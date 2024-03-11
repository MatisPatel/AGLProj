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

# @everywhere begin
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
# end

# Set up database

# Set up database


println("Opening DB Connection")
# @everywhere begin
database_connection = CSV.File("./code/mysqlDB/database_connection.csv") |> DataFrame

dbName = database_connection.Value[1]
dbUsername = database_connection.Value[2]
dbPassword = database_connection.Value[3]
dbHostname = database_connection.Value[4]

con = DBInterface.connect(MySQL.Connection, dbHostname, dbUsername, dbPassword, db = dbName) # set up connection
# end

#######################
## SCRIPT PARAMETERS ##
#######################

# @everywhere begin
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
n_epochs = 100

# get grammar definitions from DB
grammarsFromDB = DBInterface.execute(con, "SELECT * FROM grammars;") |> DataFrame

# end

#############################################################################################################

## Build models

# @everywhere begin
modelList = [] 
for row in 1:nrow(modelTable)
    if ismissing(modelTable[row,7]) #not recurrent
        modelChain = createModel(modelTable.neurons[row], modelTable.layers[row], modelTable.laminations[row], numErrors, stringLength, alphabetLength)
        push!(modelList, (modelChain, modelTable.modelID[row], "feedforward"))
    else
        modelChain = createRecurrentModel(modelTable.neurons[row], modelTable.layers[row], modelTable.recurrentlayers[row], modelTable.laminations[row], modelTable.recurrentend[row], numErrors, stringLength, alphabetLength)
        push!(modelList, (modelChain, modelTable.modelID[row], "recurrent"))
    end
end
# end

### Train

## Create trained models table

rerunDB = false

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


begin
    for grammarNum in 1:50:nrow(grammarsFromDB)

        #println("Training on thread: ", Threads.threadid(), " for grammar: ", grammarNum)

        grammarQuery = string("SELECT * FROM strings WHERE grammarID = ", grammarsFromDB.grammarID[grammarNum], ";") #write the query to get the strings for the ith grammar
        stringsFromGrammar = DBInterface.execute(con, grammarQuery) |> DataFrame # get the strings for the ith grammar

        ## train the first model to intialise the df
        trainingData = stringsFromGrammar

        println("Training on:", modelList[1][2])

        if modelList[1][3] == "feedforward"
            global outputOfTraining = trainModelOnGrammar(stringsFromGrammar, modelList[1][1], alphabetLength, n_epochs, modelList[1][2], false)
        elseif modelList[1][3] == "recurrent"
            global outputOfTraining = trainModelOnGrammar(stringsFromGrammar, modelList[1][1], alphabetLength, n_epochs, modelList[1][2], true)
        else
            println("Type of network not recognised.")
        end

         
        for model in modelList
            if model != modelList[1]
                println("Training on:", model[2])
                if model[3] == "feedforward"
                    nextModelOutputOfTraining = trainModelOnGrammar(stringsFromGrammar, model[1], alphabetLength, n_epochs, model[2], false)
                elseif model[3] == "recurrent"
                    nextModelOutputOfTraining = trainModelOnGrammar(stringsFromGrammar, model[1], alphabetLength, n_epochs, model[2], true)
                else
                    println("Type of network not recognised.")
                end
                global outputOfTraining = append!(outputOfTraining, nextModelOutputOfTraining, promote = true)
            end
        end
        
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
        outputOfTraining = Nothing 
        GC.gc()
            
    end
    DBInterface.close!(con)
end