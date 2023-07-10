# Model optimiser script

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

con = DBInterface.connect(MySQL.Connection, dbHostname,
dbUsername, dbPassword, db = dbName) # set up connection
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
modelTable = DBInterface.execute(con, "SELECT * FROM models WHERE neurons = 80 AND (layers = 1 OR layers = 2 OR layers = 4 or layers = 8);") |> DataFrame

# number of errors
numErrors = DBInterface.execute(con, "SELECT MAX(error) FROM strings;") |> DataFrame
numErrors = numErrors[1,1]

# string length
stringLength = DBInterface.execute(con, "SELECT stringLength FROM strings LIMIT 1;") |> DataFrame
stringLength = stringLength[1,1]

# neurons
num_neurons = 80

num_layers = [1,2,4,8]

# Epochs to run the training for
epochs = 2000

batch_size_list = [10, 20, 40, 80, 160, 320, 640] #(up exponentially while less than num strings.)


optimisers_list = [Descent(0.001), Descent(0.01), Descent(0.05), Descent(0.1), Descent(0.2),
                    Momentum(0.001, 0.8), Momentum(0.001, 0.9), Momentum(0.001, 0.95), Momentum(0.001, 0.99),
                    Momentum(0.01, 0.8), Momentum(0.01, 0.9), Momentum(0.01, 0.95), Momentum(0.01, 0.99),
                    Momentum(0.05, 0.8), Momentum(0.05, 0.9), Momentum(0.05, 0.95), Momentum(0.05, 0.99),
                    Momentum(0.1, 0.8), Momentum(0.1, 0.9), Momentum(0.1, 0.95), Momentum(0.1, 0.99),
                    Momentum(0.2, 0.8), Momentum(0.2, 0.9), Momentum(0.2, 0.95), Momentum(0.2, 0.99),
                    Nesterov(0.001, 0.8), Nesterov(0.001, 0.9), Nesterov(0.001, 0.95), Nesterov(0.001, 0.99),
                    Nesterov(0.01, 0.8), Nesterov(0.01, 0.9), Nesterov(0.01, 0.95), Nesterov(0.01, 0.99),
                    Nesterov(0.05, 0.8), Nesterov(0.05, 0.9), Nesterov(0.05, 0.95), Nesterov(0.05, 0.99),
                    Nesterov(0.1, 0.8), Nesterov(0.1, 0.9), Nesterov(0.1, 0.95), Nesterov(0.1, 0.99),
                    Nesterov(0.2, 0.8), Nesterov(0.2, 0.9), Nesterov(0.2, 0.95), Nesterov(0.2, 0.99),
                    Adam(0.001), Adam(0.005), Adam(0.01), Adam(0.05), Adam(0.1),
                    RMSProp(0.001), RMSProp(0.005), RMSProp(0.01), RMSProp(0.05), RMSProp(0.1),
                    RAdam(0.001), RAdam(0.005), RAdam(0.01), RAdam(0.05), RAdam(0.1),
                    AdaMax(0.001), AdaMax(0.005), AdaMax(0.01), AdaMax(0.05), AdaMax(0.1),
                    OAdam(0.001), OAdam(0.005), OAdam(0.01), OAdam(0.05), OAdam(0.1),
                    AdaBelief(0.001), AdaBelief(0.005), AdaBelief(0.01), AdaBelief(0.05), AdaBelief(0.1),
                    AdaGrad(), AdaDelta(), AMSGrad(), NAdam()] #skipping AdamW as cba iterating through the decays.

optimisers_list_names = ["Descent(0.001)", "Descent(0.01)", "Descent(0.05)", "Descent(0.1)", "Descent(0.2)",
"Momentum(0.001, 0.8)", "Momentum(0.001, 0.9)", "Momentum(0.001, 0.95)", "Momentum(0.001, 0.99)",
"Momentum(0.01, 0.8)"," Momentum(0.01, 0.9)", "Momentum(0.01, 0.95)", "Momentum(0.01, 0.99)",
"Momentum(0.05, 0.8)", "Momentum(0.05, 0.9)", "Momentum(0.05, 0.95)", "Momentum(0.05, 0.99)",
"Momentum(0.1, 0.8)", "Momentum(0.1, 0.9)", "Momentum(0.1, 0.95)", "Momentum(0.1, 0.99)",
"Momentum(0.2, 0.8)"," Momentum(0.2, 0.9)", "Momentum(0.2, 0.95)", "Momentum(0.2, 0.99)",
"Nesterov(0.001, 0.8)", "Nesterov(0.001, 0.9)", "Nesterov(0.001, 0.95)", "Nesterov(0.001, 0.99)",
"Nesterov(0.01, 0.8)", "Nesterov(0.01, 0.9)", "Nesterov(0.01, 0.95)", "Nesterov(0.01, 0.99)",
"Nesterov(0.05, 0.8)", "Nesterov(0.05, 0.9)", "Nesterov(0.05, 0.95)", "Nesterov(0.05, 0.99)",
"Nesterov(0.1, 0.8)", "Nesterov(0.1, 0.9)", "Nesterov(0.1, 0.95)", "Nesterov(0.1, 0.99)",
"Nesterov(0.2, 0.8)", "Nesterov(0.2, 0.9)", "Nesterov(0.2, 0.95)", "Nesterov(0.2, 0.99)",
"Adam(0.001)", "Adam(0.005)", "Adam(0.01)", "Adam(0.05)", "Adam(0.1)",
"RMSProp(0.001)", "RMSProp(0.005)", "RMSProp(0.01)", "RMSProp(0.05)", "RMSProp(0.1)",
"RAdam(0.001)", "RAdam(0.005)", "RAdam(0.01)", "RAdam(0.05)", "RAdam(0.1)",
"AdaMax(0.001)", "AdaMax(0.005)", "AdaMax(0.01)", "AdaMax(0.05)", "AdaMax(0.1)",
"OAdam(0.001)", "OAdam(0.005)", "OAdam(0.01)", "OAdam(0.05)", "OAdam(0.1)",
"AdaBelief(0.001)", "AdaBelief(0.005)", "AdaBelief(0.01)", "AdaBelief(0.05)", "AdaBelief(0.1)",
"AdaGrad()", "AdaDelta()", "AMSGrad()", "NAdam()"]

activation_functions = [celu, elu, gelu, sigmoid, hardsigmoid, tanh, hardtanh, relu, leakyrelu, selu]

# get grammar definitions from DB
grammarsFromDB = DBInterface.execute(con, "SELECT * FROM grammars WHERE grammars.grammarID mod 80 = 0 AND grammars.connections mod 3 = 0;") |> DataFrame #get every 80th grammar where connections are multiples of 3. Gives us a good range of 17 grammars to test on.

# end

#############################################################################################################

## Build models

println("Creating DB Table")
DBInterface.execute(con, "DROP TABLE IF EXISTS modelstuning;") #drop any existing table, just in case.
DBInterface.execute(con, "CREATE TABLE modelstuning (modelID INT AUTO_INCREMENT PRIMARY KEY, name VARCHAR(1000), neurons INT, layers INT, actfunc VARCHAR(30));") # create a table of the models 

# Push models to DB and save to a list for training later. 
   
modelList = []
for layers in num_layers
    for act_func in activation_functions
        modelChain = createModel(num_neurons, layers, numErrors, stringLength, alphabetLength, act_func)
        push!(modelList, modelChain)
            
        query = string("INSERT INTO modelstuning (name, neurons, layers, actfunc) VALUES(", "\"",
        string(modelChain), "\", ",
        num_neurons, ", ",
        layers, ", \"",
        string(act_func), "\");")
        DBInterface.execute(con, query) # push to DB
    end
end

### Train


include("tuningTesterFunction.jl")

#con = DBInterface.connect(MySQL.Connection, dbHostname,
#dbUsername, dbPassword, db = dbName)

grammarQuery = string("SELECT * FROM strings WHERE grammarID = ", grammarsFromDB.grammarID[1], ";") #write the query to get the strings for the ith grammar
stringsFromGrammar = DBInterface.execute(con, grammarQuery) |> DataFrame # get the strings for the ith grammar

## train the first model to intialise the df

modelTrain=modelList[1]
trainingData = stringsFromGrammar

#modelID

modelQuery = string("SELECT modelID FROM modelstuning WHERE name = \"", string(modelTrain), "\";")
modelIDRow = DBInterface.execute(con, modelQuery) |> DataFrame
modelID = modelIDRow[1,1]

# create copy of optimiser list so we don't store all updates in optimiser

optimisers_list_copy = optimisers_list

# train

outputOfTraining = trainModelOnGrammarTuning(trainingData, modelTrain, alphabetLength, epochs, modelID, batch_size_list[1], optimisers_list[1], optimisers_list_names[1])

for ω in 2:length(optimisers_list)
    println("Optimiser ", ω)
    nextModelOutputOfTraining = trainModelOnGrammarTuning(trainingData, modelTrain, alphabetLength, epochs, modelID, 10, optimisers_list[ω], optimisers_list_names[ω])

    global outputOfTraining = append!(outputOfTraining, nextModelOutputOfTraining)
end

CSV.write("./data/tuningTesting.csv", outputOfTraining)
for β in 2:length(batch_size_list)
    println("Batch size ", β)
    for ω in eachindex(optimisers_list)
        print(".")
        nextModelOutputOfTraining = trainModelOnGrammarTuning(trainingData, modelTrain, alphabetLength, epochs, modelID, batch_size_list[β], optimisers_list[ω], optimisers_list_names[ω])
        global outputOfTraining = append!(outputOfTraining, nextModelOutputOfTraining)
    end
end

CSV.write("./data/tuningTesting.csv", outputOfTraining)


### This for loop can be parallelised. Everything is ready to go, just need to work out how to get the dataframes to bind at the end of the for loop so that we can then pass that dataframe to the database serially.
for model in 2:length(modelList)
    println("Model number ", model)
    modelTrain=modelList[model]
    
    #modelID

    modelQuery = string("SELECT modelID FROM modelstuning WHERE name = \"", string(modelTrain), "\";")
    modelIDRow = DBInterface.execute(con, modelQuery) |> DataFrame
    modelID = modelIDRow[1,1]

    for β in batch_size_list
        println("Batch size ", β)
        for ω in eachindex(optimisers_list)
            print(".")
            nextModelOutputOfTraining = trainModelOnGrammarTuning(trainingData, modelTrain, alphabetLength, epochs, modelID, β, optimisers_list[ω], optimisers_list_names[ω])
            global outputOfTraining = append!(outputOfTraining, nextModelOutputOfTraining)
        end
    end

    CSV.write("./data/tuningTesting.csv", outputOfTraining)
end

for γ in 2:length(grammarsFromDB)
    println("Grammar number ", γ)
    grammarQuery = string("SELECT * FROM strings WHERE grammarID = ", grammarsFromDB.grammarID[γ], ";") #write the query to get the strings for the ith grammar
    stringsFromGrammar = DBInterface.execute(con, grammarQuery) |> DataFrame # get the strings for the ith grammar
    for modelTrain in modelList
    
        modelQuery = string("SELECT modelID FROM modelstuning WHERE name = \"", string(modelTrain), "\";")
        modelIDRow = DBInterface.execute(con, modelQuery) |> DataFrame
        modelID = modelIDRow[1,1]
    
        for β in batch_size_list
            println("Batch size ", β)
            for ω in eachindex(optimisers_list)
                print(".")
                nextModelOutputOfTraining = trainModelOnGrammarTuning(trainingData, modelTrain, alphabetLength, epochs, modelID, β, optimisers_list[ω], optimisers_list_names[ω])
                global outputOfTraining = append!(outputOfTraining, nextModelOutputOfTraining)
            end
        end
    
        CSV.write("./data/tuningTesting.csv", outputOfTraining)
    end
    CSV.write("./data/tuningTesting.csv", outputOfTraining)
end


DBInterface.close!(con)

CSV.write("./data/tuningTesting.csv", outputOfTraining)