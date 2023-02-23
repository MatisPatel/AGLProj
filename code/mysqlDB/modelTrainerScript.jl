############################################# Full pipeline for grammars ########################################################
# Author: M. Patel, K. Voudouris
# Project Title: AGLProj
# Julia Version: 1.8.2
# MySQL version: 8.0.31
#################################################################################################################################

# Script Outline
# 0. Load packages & setup DB connection & define parameters
# 1. We define the models from what is in the database.
# 2. We train the models in parallel and then pass the results to the database serially. 

#################################################################################################################################
# 0. Preamble

# Load packages
using Distributed 
# addprocs(n) to add n extra workers 
# @everywhere import Pkg; Pkg.instantiate() # run this if you need to install the packages on each worker
# @everywhere import Pkg; Pkg.add("SharedArrays"); Pkg.add("Distributed"); Pkg.add("StatsBase"); Pkg.add("LinearAlgebra"); Pkg.add("DataFrames"); Pkg.add("CSV"); Pkg.add("Random"); Pkg.add("MySQL"); Pkg.add("Flux"); Pkg.add("Revise"); Pkg.add("ProgressMeter") # add whatever packages aren't installed on your workers

@everywhere begin
    using SharedArrays
    using Distributed
    using StatsBase
    using LinearAlgebra
    using DataFrames
    using CSV
    using Random
    using MySQL
    using Flux 
    #using Revise
    #using ProgressMeter
    include("fullPipelineSourceFunctions.jl")
end

# Set up database

# Set up database


println("Opening DB Connection")
@everywhere begin
    database_connection = CSV.File("./code/mysqlDB/database_connection.csv") |> DataFrame

    dbName = database_connection.Value[1]
    dbUsername = database_connection.Value[2]
    dbPassword = database_connection.Value[3]
    dbHostname = database_connection.Value[4]

    con = DBInterface.connect(MySQL.Connection, dbHostname,
    dbUsername, dbPassword, db = dbName) # set up connection
end

#######################
## SCRIPT PARAMETERS ##
#######################

@everywhere begin
    # alphabet 
    ALPHABET = 'a':'z'

    # alphabet length 
    alphabetLength = DBInterface.execute(con, "SELECT alphabetLength FROM grammars LIMIT 1;") |> DataFrame 
    alphabetLength = alphabetLength[1,1] #get the alphabet length

    # Set seed for randomisers (for DB IDs and for initialising NNs)
    Random.seed!(2022) # may need to work out how to change this for all workers ! 
    
    # model table
    modelTable = DBInterface.execute(con, "SELECT * FROM models;") |> DataFrame

    # number of errors
    numErrors = DBInterface.execute(con, "select MAX(error) from strings;") |> DataFrame
    numErrors = numErrors[1,1]

    # string length
    stringLength = DBInterface.execute(con, "SELECT stringLength FROM strings LIMIT 1;") |> DataFrame
    stringLength = stringLength[1,1]

    # Number of epochs to run the training for
    n_epochs = 5

end

#############################################################################################################

## Build models

@everywhere begin
    modelList = [] 
    for row in 1:nrow(modelTable)
        modelChain = createModel(modelTable.neurons[row], modelTable.layers[row], numErrors, stringLength, alphabetLength)
        push!(modelList, (modelChain, modelTable.modelID[row]))
    end
end

### Train

## Create trained models table

rerunDB = true

if rerunDB
    DBInterface.execute(con, "DROP TABLE IF EXISTS trainedmodels;")
    DBInterface.execute(con, "CREATE TABLE trainedmodels (traininginstanceID INT AUTO_INCREMENT PRIMARY KEY, stringID INT NOT NULL, modelID INT NOT NULL, trainteststring VARCHAR(200), pretrainpreds INT, posttrainpreds INT, epochs INT, UNIQUE (stringID, modelID));")
else
    try
        DBInterface.execute(con, "CREATE TABLE trainedmodels (traininginstanceID INT AUTO_INCREMENT PRIMARY KEY, stringID INT NOT NULL, modelID INT NOT NULL, trainteststring VARCHAR(200), pretrainpreds INT, posttrainpreds INT, epochs INT, UNIQUE (stringID, modelID));")
    catch
        println("The `trainedmodels` table already exists. Delete the table or skip these lines and add more data to the database.")
    end
end

#for grammarNum in 1:nrow(grammarsFromDB)
for grammarNum in 1:300:nrow(grammarsFromDB)
    ## first get the grammars and strings out

    grammarQuery = string("SELECT * FROM strings WHERE grammarID = ", grammarsFromDB.grammarID[grammarNum], ";") #write the query to get the strings for the ith grammar
    stringsFromGrammar = DBInterface.execute(con, grammarQuery) |> DataFrame # get the strings for the ith grammar

    ## train the first model to intialise the df
    outputOfTraining = trainModelOnGrammar(stringsFromGrammar, modelList[1][1], alphabetLength, n_epochs, modelList[1][2])



    ### This for loop can be parallelised. Everything is ready to go, just need to work out how to get the dataframes to bind at the end of the for loop so that we can then pass that dataframe to the database serially.
    for model in 2:length(modelList)
        nextModelOutputOfTraining = trainModelOnGrammar(stringsFromGrammar, modelList[model][1], alphabetLength, n_epochs, modelList[model][2])
        outputOfTraining = append!(outputOfTraining, nextModelOutputOfTraining)
    end


    ### This for loop just iterates row-wise through the output of training for all models on a single grammar, and pushes each row to the database one at a time. Avoids issues with querying database from multiple processes.
    for row in 1:size(outputOfTraining)[1]
        query = string("INSERT INTO trainedmodels (stringID, modelID, trainteststring, pretrainpreds, posttrainpreds, epochs) VALUES(\"",
            outputOfTraining.stringID[row], "\", \"",
            outputOfTraining.modelID[row], "\", \"",
            outputOfTraining.TrainOrTest[row], "\", ",
            outputOfTraining.initialPreds[row], ", ",
            outputOfTraining.trainedPreds[row], ", ",
            n_epochs, ");")
        try
            DBInterface.execute(con, query) # push to DB
        catch
            println("This row is hitting a uniqueness constraint, meaning you have already trained this string (", outputOfTraining.stringID[row], ") with this model (", outputOfTraining.modelID[row], "). Moving to the next.")
            continue
        end
        
    end
    outputOfTraining = 0 #reassign that dataframe to something small to release memory
    GC.gc() #force garbage collection at end of each loop.

end
