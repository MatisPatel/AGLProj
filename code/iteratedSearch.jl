using Flux 
using Revise
using ProgressMeter
using SharedArrays
using DataFrames
using CSV
include("DistributedCode.jl")

datdir = "../data/stringsNoLoops_5/"
files = readdir(datdir) 

model, numNeurons, numLayers = createModel(55, 1)

TElist = zeros(length(files))
change0 = zeros(length(files))
change1 = zeros(length(files))

@time begin 
    @showprogress for (i, f) in enumerate(files)
        fcut = f[1:end-4]
        flist = split.(split(fcut, "_"), "=")
        flist = [[i[1], parse(Float64, i[2])] for i in flist]
        fDict = Dict(flist)
        TElist[i] = fDict["TE"][1]
        change0[i], change1[i], _, _ = trainModelOnGrammar(datdir, f, model, 5, 200)
        Flux.reset!(model)
    end 
end

