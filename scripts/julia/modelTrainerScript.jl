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

using Distributed
nProcs = 10
addprocs(nProcs-1)

@everywhere begin
    using DrWatson
    quickactivate(".", "AGLProj")
    using Combinatorics, DataFrames, Flux, LinearAlgebra, Logging, Random, StatsBase, CSV, MySQL
    include(srcdir("utils.jl"))
end

# Connect to database
con = database_connect("database_connection.csv")

# Load grammars
grammarsFromDB = DBInterface.execute(con, "SELECT * FROM grammars;") |> DataFrame

# Load models
modelTable = DBInterface.execute(con, "SELECT * FROM modelatts;") |> DataFrame

#######################
## SCRIPT PARAMETERS ##
#######################

# alphabet length 
alphabetLength = DBInterface.execute(con, "SELECT alphabetLength FROM grammars LIMIT 1;") |> DataFrame 
alphabetLength = alphabetLength[1,1] #get the alphabet length

# number of errors
numErrors = DBInterface.execute(con, "select MAX(error) from strings;") |> DataFrame
numErrors = numErrors[1,1]

# string length
stringLength = DBInterface.execute(con, "SELECT stringLength FROM strings LIMIT 1;") |> DataFrame
stringLength = stringLength[1,1]

@everywhere begin
    Random.seed!(2022)

    # Load variables onto workers
    alphabetLength = $alphabetLength
    numErrors = $numErrors
    stringLength = $stringLength

    # Alphabet
    ALPHABET = 'a':'z'

    # Training parameters
    n_epochs = 500
    throttle = 0.000001
    batch_size = 10
    prop_tests = 0.3
    opt = Momentum(0.01, 0.95)

    # Print messages
    verbose = false
end

#############################################################################################################

## Build models
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

### Train

## Create model outputs table

rerunDB = false

if rerunDB
    DBInterface.execute(con, "DROP TABLE IF EXISTS modeloutputs;")
    DBInterface.execute(con, "CREATE TABLE modeloutputs (traininginstanceID INT AUTO_INCREMENT PRIMARY KEY, stringID INT NOT NULL, modelID INT NOT NULL, trainteststring VARCHAR(200), pretrainprobs FLOAT, posttrainprobs FLOAT(32), epochs INT, UNIQUE (stringID, modelID));")
else
    try
        DBInterface.execute(con, "CREATE TABLE modeloutputs (traininginstanceID INT AUTO_INCREMENT PRIMARY KEY, stringID INT NOT NULL, modelID INT NOT NULL, trainteststring VARCHAR(200), pretrainprobs FLOAT, posttrainprobs FLOAT(32), epochs INT, UNIQUE (stringID, modelID));")
    catch
        println("The `modeloutputs` table already exists. Delete the table or skip these lines and add more data to the database.")
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

    checkedModelList = []
    count = 0
    for m in modelList
        count = count + 1
        println(count)
        modID = m[2]
        if checkIfRun(con, grammarID, modID)
            pass
        else
            append!(checkedModelList, [m])
        end
    end

    if length(checkedModelList) > 0
        grammarQuery = string("SELECT * FROM strings WHERE grammarID = ", grammarID, " AND stringLength = ", stringLength, ";") #write the query to get the strings for the ith grammar with the appropriate string number
        trainingData = DBInterface.execute(con, grammarQuery) |> DataFrame # get the strings for the ith grammar
        
        for models in collect(Iterators.partition(checkedModelList, nProcs*3)) # batch up the models 
            results = @distributed (vcat) for m in models
                model = m[1]
                modelID = m[2]
                recurrence = m[3]
                Flux.reset!(model)
                nextOutput, nextAccLoss = trainModelOnGrammar(trainingData, model, alphabetLength, n_epochs, modelID, 
                                                            recurrence, throttle, batch_size, prop_tests, opt, false)
                (nextOutput, nextAccLoss)

            end

            output_list = map(x -> x[1], results)
            acc_loss_list = map(x -> x[2], results)
            modelOutputs = vcat(output_list...)
            unique!(modelOutputs)
            modelAccuracies = vcat(acc_loss_list...)
            
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
            end

            if nrow(modelOutputs) > 0
                for row in 1:nrow(modelOutputs)
                    query = string("INSERT INTO modeloutputs (stringID, modelID, trainteststring, pretrainprobs, posttrainprobs, epochs) VALUES(",
                                    modelOutputs.stringID[row], ", ",
                                    modelOutputs.modelID[row], ", \"",
                                    modelOutputs.TrainOrTest[row], "\", ",
                                    modelOutputs.initialProbs[row], ", ",
                                    modelOutputs.trainedProbs[row], ", ",
                                    modelOutputs.epochs[row], 
                                    ");")
                    try
                        DBInterface.execute(con, query) # push to DB
                    catch
                        println("This row is hitting a uniqueness constraint, meaning you have already trained this string (", modelOutputs.stringID[row], ") with this model (", modelOutputs.modelID[row], "). Moving to the next.")
                        continue
                    end
                        
                end
            end
        end
    else
        println("All models have been evaluated on grammar", grammarID, ". Moving on...")
    end
end
DBInterface.close!(con)
