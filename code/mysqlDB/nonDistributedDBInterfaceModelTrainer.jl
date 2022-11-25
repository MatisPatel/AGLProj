using Flux 
using Revise
using ProgressMeter
using SharedArrays
using DataFrames
using CSV
using MySQL
include("DistributedCode.jl")

println("Loading Data...")
datdir = "../data/stringsNoLoops_5/"
# files = shuffle(readdir(datdir))
files = shuffle!(readdir(datdir))[1:3]
println("Loaded")

modelList = []
for i in 20:80
    for j in 1:4
        splits = Int.(sort([floor(i*(k+1)/j) - floor(i*k / j) for k in 1:j], rev=true))
        if (length(splits) == 1)
            model = Chain(
                Dense(55, splits[1], relu),
                Dense(splits[end], 10, sigmoid)
            )
        else
            model = Chain(
                Dense(55, splits[1], relu),
                [Dense(splits[i], splits[i+1], relu) for i in 1:(length(splits) - 1)]...,
                Dense(splits[end], 10, sigmoid)
            )
        end
        push!(modelList, (model, i, j))
    end
end

## DB Setup

println("Opening DB Connection")
con = DBInterface.connect(MySQL.Connection, "localhost",
"user_name", "password", db = "modeloutput") # set up connection - insert your user and pass

println("Creating DB Table")
DBInterface.execute(con, "DROP TABLE IF EXISTS models;") #drop any existing table, just in case.
DBInterface.execute(con, "CREATE TABLE models (name VARCHAR(1000), grammarId VARCHAR(1000), change0 FLOAT, change1 FLOAT, scores FLOAT, neurons INT, layers INT);") # create a table

println("Commencing Training")
for i in eachindex(modelList)
    model, numNeurons, numLayers = modelList[i]
    preScores = zeros(length(files))
    postScores = zeros(length(files))
    startAcc = zeros(length(files))
    endAcc = zeros(length(files))
    c0List = zeros(length(files))
    c1List = zeros(length(files))

    println("Training model with ", numNeurons , " neurons and ", numLayers, " layers")
    @showprogress for num in eachindex(files)
        f = files[num] #should probably change this because 'f' can also be 'false' right?
        fcut = f[1:end-4]
        flist = split.(split(fcut, "_"), "=")
        flist = [[i[1], parse(Float64, i[2])] for i in flist]
        fDict = Dict(flist)

        preScores[num] = calculateNetworkCost(model)
        c0List[num], c1List[num], startAcc[num], endAcc[num] = trainModelOnGrammar(datdir, f, model, 5, 200)
        postScores[num] = calculateNetworkCost(model)
        Flux.reset!(model)
    end
    
    modelChange0 = mean(c0List)
    modelChange1 = mean(c1List)
    modelScores = mean(postScores)
    numberNeurons = numNeurons
    numberLayers = numLayers

    query = string("INSERT INTO models (name, grammarId, change0, change1, scores, neurons, layers) VALUES(\"",
    modelList[i], "\", \"",
    f, "\", ",
    modelChange0, ", ",
    modelChange1, ", ",
    modelScores, ", ",
    numberNeurons, ", ",
    numberLayers, ");")
    
    DBInterface.execute(con, query) # push to DB

end

model_output = DBInterface.execute(con, "SELECT * FROM models;") |> DataFrame
CSV.write(string("../data/", "permuteNeuronsAndLayers_3grammars_noLoops.csv"), model_output)

DBInterface.close!(con) #close the connection
