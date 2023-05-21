# Epoch tester script

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
modelTable = DBInterface.execute(con, "SELECT * FROM models;") |> DataFrame

# number of errors
numErrors = DBInterface.execute(con, "select MAX(error) from strings;") |> DataFrame
numErrors = numErrors[1,1]

# string length
stringLength = DBInterface.execute(con, "SELECT stringLength FROM strings LIMIT 1;") |> DataFrame
stringLength = stringLength[1,1]


# Max number of epochs to run the training for
max_epochs = 1000

# get graamar definitions from DB
grammarsFromDB = DBInterface.execute(con, "SELECT * FROM grammars;") |> DataFrame

# end

#############################################################################################################

## Build models

# @everywhere begin
modelList = [] 
for row in 1:nrow(modelTable)
    modelChain = createModel(modelTable.neurons[row], modelTable.layers[row], numErrors, stringLength, alphabetLength)
    push!(modelList, (modelChain, modelTable.modelID[row]))
end
# end

### Train


include("epochTesterFunction.jl")

#con = DBInterface.connect(MySQL.Connection, dbHostname,
#dbUsername, dbPassword, db = dbName)

grammarQuery = string("SELECT * FROM strings WHERE grammarID = ", grammarsFromDB.grammarID[1], ";") #write the query to get the strings for the ith grammar
stringsFromGrammar = DBInterface.execute(con, grammarQuery) |> DataFrame # get the strings for the ith grammar

## train the first model to intialise the df

modelTrain =modelList[1][1]
trainingData = stringsFromGrammar

outputOfTraining = trainModelOnGrammarEpoch(trainingData, modelTrain, alphabetLength, max_epochs, modelList[1][2]) 


### This for loop can be parallelised. Everything is ready to go, just need to work out how to get the dataframes to bind at the end of the for loop so that we can then pass that dataframe to the database serially.
for model in 2:length(modelList)
    nextModelOutputOfTraining = trainModelOnGrammarEpoch(trainingData, modelList[model][1], alphabetLength, max_epochs, modelList[model][2])
    global outputOfTraining = append!(outputOfTraining, nextModelOutputOfTraining)
end
    
for grammarNum in 151:150:nrow(grammarsFromDB)
    println("Computing grammar number: ", grammarNum)
    #make connection
    #local con

    

    #println("training on thread: ", Threads.threadid(), " for grammar: ", grammarNum)

    ## first get the grammars and strings out

    local grammarQuery = string("SELECT * FROM strings WHERE grammarID = ", grammarsFromDB.grammarID[grammarNum], ";") #write the query to get the strings for the ith grammar
    local stringsFromGrammar = DBInterface.execute(con, grammarQuery) |> DataFrame # get the strings for the ith grammar

    ## train the first model to intialise the df

    local modelTrain =modelList[1][1]
    local trainingData = stringsFromGrammar

    nextModelOutputOfTraining = trainModelOnGrammarEpoch(trainingData, modelTrain, alphabetLength, max_epochs, modelList[1][2]) 
    global outputOfTraining = append!(outputOfTraining, nextModelOutputOfTraining)

    ### This for loop can be parallelised. Everything is ready to go, just need to work out how to get the dataframes to bind at the end of the for loop so that we can then pass that dataframe to the database serially.
    for model in 2:length(modelList)
        nextModelOutputOfTraining = trainModelOnGrammarEpoch(trainingData, modelList[model][1], alphabetLength, max_epochs, modelList[model][2])
        global outputOfTraining = append!(outputOfTraining, nextModelOutputOfTraining)
    end

    # outputOfTraining = 0 #reassign that dataframe to something small to release memory
    #GC.gc() #force garbage collection at end of each loop.
    
    #println("releasing thread: ", Threads.threadid())

    
end
# end

DBInterface.close!(con)

CSV.write("./data/epochtesting.csv", outputOfTraining)