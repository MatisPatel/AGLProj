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

using DrWatson
@quickactivate "AGLProj"
using StatsBase, LinearAlgebra, DataFrames, CSV, Random, MySQL, Flux

include(srcdir("utils.jl"))

# Set up database

con = database_connect("database_connection.csv")

#######################
## SCRIPT PARAMETERS ##
#######################

# @everywhere begin
    # alphabet 
ALPHABET = 'a':'z'

# alphabet length 
# alphabetLength = DBInterface.execute(con, "SELECT alphabetLength FROM grammars LIMIT 1;") |> DataFrame 
# alphabetLength = alphabetLength[1,1] #get the alphabet length
alphabetLength = 6

# Set seed for randomisers (for DB IDs and for initialising NNs)
Random.seed!(2022) # may need to work out how to change this for all workers ! 

# model table
modelTable = DBInterface.execute(con, "SELECT * FROM models;") |> DataFrame

# # number of errors
# numErrors = DBInterface.execute(con, "select MAX(error) from strings;") |> DataFrame
# numErrors = numErrors[1,1]
numErrors = 1

# # string length
# stringLength = DBInterface.execute(con, "SELECT stringLength FROM strings LIMIT 1;") |> DataFrame
# stringLength = stringLength[1,1]
stringLength = 2

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
    if modelTable[row,6] == "ff" #not recurrent as no "in" or "out" specification
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
    finally
        global trainedModelsInDB = DBInterface.execute(con, "SELECT trainedmodels.modelID, strings.grammarID FROM trainedmodels JOIN strings ON trainedmodels.stringID = strings.stringID;") |> DataFrame
        unique!(trainedModelsInDB)
    end
end

## Create losses and accuracies table

rerunDB = false

if rerunDB
    DBInterface.execute(con, "DROP TABLE IF EXISTS accuracieslosses;")
    DBInterface.execute(con, "CREATE TABLE accuracieslosses (modelID INT NOT NULL, grammarID INT NOT NULL, epoch INT NOT NULL, batch INT NOT NULL, loss FLOAT NOT NULL, trainbrier FLOAT NOT NULL, testbrier FLOAT NOT NULL, throttle FLOAT NOT NULL, UNIQUE (modelID, grammarID, epoch, batch));")
else
    try
        DBInterface.execute(con, "CREATE TABLE accuracieslosses (modelID INT NOT NULL, grammarID INT NOT NULL, epoch INT NOT NULL, batch INT NOT NULL, loss FLOAT NOT NULL, trainbrier FLOAT NOT NULL, testbrier FLOAT NOT NULL, throttle FLOAT NOT NULL, UNIQUE (modelID, grammarID, epoch, batch));")
    catch
        println("The `accuracieslosses` table already exists. Delete the table or skip these lines and add more data to the database.")
    end
end


begin
    for grammarNum in 1:50:nrow(grammarsFromDB)

        #println("Training on thread: ", Threads.threadid(), " for grammar: ", grammarNum)
        grammarID = grammarsFromDB.grammarID[grammarNum]
        grammarQuery = string("SELECT * FROM strings WHERE grammarID = ", grammarID, " AND stringLength = ", stringLength, ";") #write the query to get the strings for the ith grammar with the appropriate string number
        stringsFromGrammar = DBInterface.execute(con, grammarQuery) |> DataFrame # get the strings for the ith grammar

        trainingData = stringsFromGrammar

        global outputOfTraining = DataFrame(grammarID = Int32[], string = String[], stringLength = Int32[], stringNumber = String[], error = Int32[], stringID = Int32[], encodedErrors = Vector{Vector{Float64}}, TrainOrTest = String[], initialPreds = Int64[], trainedPreds = Int64[], modelID = Int32[])
         
        for model in modelList 
            modelID = model[2]
            checkIfRun = filter(row -> row.modelID == modelID && row.grammarID == grammarID, trainedModelsInDB) #check if there are any rows for that model on that grammar already in the database
            if nrow(checkIfRun) == 0
                println("Training on:", model[2])
                if model[3] == "feedforward"
                    nextModelOutputOfTraining = trainModelOnGrammar(stringsFromGrammar, model[1], alphabetLength, n_epochs, modelID, false)
                elseif model[3] == "recurrent"
                    nextModelOutputOfTraining = trainModelOnGrammar(stringsFromGrammar, model[1], alphabetLength, n_epochs, modelID, true)
                else
                    println("Type of network not recognised.")
                end
                append!(outputOfTraining, nextModelOutputOfTraining)
            else
                println("Model ID ", modelID, " `has already been trained on Grammar ID ", grammarID, ". Moving on.")
            end
        end
        
        if nrow(outputOfTraining) > 0
            for row in 1:nrow(outputOfTraining)
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
        else
            println("All models have been trained on GrammarID ", grammarID, ". Moving to next grammar")
        end

    end
    DBInterface.close!(con)
end