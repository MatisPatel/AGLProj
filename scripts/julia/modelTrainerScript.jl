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
modelTable = DBInterface.execute(con, "SELECT * FROM modelatts;") |> DataFrame

# # number of errors
# numErrors = DBInterface.execute(con, "select MAX(error) from strings;") |> DataFrame
# numErrors = numErrors[1,1]
numErrors = 1

# # string length
# stringLength = DBInterface.execute(con, "SELECT stringLength FROM strings LIMIT 1;") |> DataFrame
# stringLength = stringLength[1,1]
stringLength = 2

# Number of epochs to run the training for
n_epochs = 500
throttle = 0.000001
batch_size = 10
prop_tests = 0.3
opt = Momentum(0.01, 0.95)
verbose = false

# get grammar definitions from DB
grammarsFromDB = DBInterface.execute(con, "SELECT * FROM grammars;") |> DataFrame

# end

#############################################################################################################

## Build models

# @everywhere begin
modelList = [] 
for row in 1:nrow(modelTable)
    println("Model ID: ", modelTable.modelID[row], " loaded.")
    modelChain = createModel(modelTable.neurons[row],
                             modelTable.layers[row],
                             modelTable.laminations[row],
                             Bool(modelTable.recurrence[row]),
                             Bool(modelTable.inpool[row]),
                             Bool(modelTable.outpool[row]),
                             numErrors, stringLength, alphabetLength)
    push!(modelList, (modelChain, modelTable.modelID[row], Bool(modelTable.recurrence[row])))
end
# end

### Train

## Create model outputs table

rerunDB = false

if rerunDB
    DBInterface.execute(con, "DROP TABLE IF EXISTS modeloutputs;")
    DBInterface.execute(con, "CREATE TABLE modeloutputs (traininginstanceID INT AUTO_INCREMENT PRIMARY KEY, stringID INT NOT NULL, modelID INT NOT NULL, trainteststring VARCHAR(200), pretrainprobs INT, posttrainprobs INT, epochs INT, UNIQUE (stringID, modelID));")
else
    try
        DBInterface.execute(con, "CREATE TABLE modeloutputs (traininginstanceID INT AUTO_INCREMENT PRIMARY KEY, stringID INT NOT NULL, modelID INT NOT NULL, trainteststring VARCHAR(200), pretrainprobs INT, posttrainprobs INT, epochs INT, UNIQUE (stringID, modelID));")
    catch
        println("The `modeloutputs` table already exists. Delete the table or skip these lines and add more data to the database.")
    finally
        global trainedModelsInDB = DBInterface.execute(con, "SELECT modeloutputs.modelID, strings.grammarID FROM modeloutputs JOIN strings ON modeloutputs.stringID = strings.stringID;") |> DataFrame
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


for grammarNum in 1:50:nrow(grammarsFromDB)
    grammarID = grammarsFromDB.grammarID[grammarNum]     
    modelOutputs = DataFrame(grammarID = Int32[], 
                            string = String[], 
                            stringLength = Int32[], 
                            stringNumber = String[], 
                            error = Int32[], 
                            stringID = Int32[], 
                            encodedErrors = Vector{Vector{Float64}}, 
                            TrainOrTest = String[], 
                            initialProbs = Int64[], 
                            trainedProbs = Int64[], 
                            modelID = Int32[])
    modelAccuracies = DataFrame(modelID = Int32[],
                                grammarID = Int32[], 
                                epoch = Int32[],
                                batch = Int32[],
                                loss = Float32[],
                                train_brier = Float32[],
                                test_brier = Float32[],
                                throttle = Float32[]
                                )
    
    for m in modelList 
        model = m[1]
        modelID = m[2]
        recurrence = m[3]

        if recurrence
            Flux.reset!(model)
        end

        check = checkIfRun(con, grammarID, modelID)

        grammarQuery = string("SELECT * FROM strings WHERE grammarID = ", grammarID, " AND stringLength = ", stringLength, ";") #write the query to get the strings for the ith grammar with the appropriate string number
        trainingData = DBInterface.execute(con, grammarQuery) |> DataFrame # get the strings for the ith grammar

        if !check
            try
                nextOutput, nextAccLoss = trainModelOnGrammar(trainingData, model, alphabetLength, n_epochs, modelID, recurrence, throttle, batch_size, prop_tests, opt, false)
                append!(modelOutputs, nextOutput, promote=true)
                append!(modelAccuracies, nextAccLoss, promote=true)
            catch
                println("Training failure with model: ")
                println(model)
                println("ModelID: ", modelID)
            end
        else
            println("Model ID ", modelID, " has already been trained on Grammar ID ", grammarID, ". Moving on.")
        end
    end
        
    if nrow(modelAccuracies) > 0
        for row in 1:nrow(modelAccuracies)
            query = string("INSERT INTO accuracieslosses (modelID, grammarID, epoch, batch, loss, trainbrier, testbrier, throttle) VALUES(",
                            modelAccuracies.modelID[row], ", ", 
                            modelAccuracies.grammarID[row], ", ",
                            modelAccuracies.epoch[row], ", ",
                            modelAccuracies.batch[row], ", ",
                            modelAccuracies.loss[row], ", ",
                            modelAccuracies.train_brier[row], ", ",
                            modelAccuracies.test_brier[row], ", ",
                            modelAccuracies.throttle[row],
                            ");")
            try
                DBInterface.execute(con, query) # push to DB
            catch
                println("This row is hitting a uniqueness constraint, meaning you have already entered accuracies and losses for grammar ", modelAccuracies.grammar[row], " with this model (", outputOfTraining.modelID[row], "). Moving to the next.")
                continue
            end
                
        end
    outputOfTraining = nothing 
    GC.gc()
    else
        println("All models have been trained on GrammarID ", grammarID, ". Moving to next grammar")
    end

    if nrow(modelOutputs) > 0
        for row in 1:nrow(modelOutputs)
            query = string("INSERT INTO modeloutputs (stringID, modelID, trainteststring, pretrainprobs, posttrainprobs, epochs) VALUES(",
                            modelOutputs.stringID[row], ", ",
                            modelOutputs.modelID[row], ", \"",
                            modelOutputs.TrainOrTest[row], "\", ",
                            modelOutputs.initialProbs[row], ", ",
                            modelOutputs.trainedProbs[row], ", ",
                            n_epochs, 
                            ");")
            try
                DBInterface.execute(con, query) # push to DB
            catch
                println("This row is hitting a uniqueness constraint, meaning you have already trained this string (", modelOutputs.stringID[row], ") with this model (", modelOutputs.modelID[row], "). Moving to the next.")
                continue
            end
                
        end
    outputOfTraining = nothing 
    GC.gc()
    else
        println("All models have been trained on GrammarID ", grammarID, ". Moving to next grammar")
    end

end
DBInterface.close!(con)
