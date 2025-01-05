using DrWatson
@quickactivate "AGLProj"
using Test, StatsBase, LinearAlgebra, DataFrames, CSV, Random, MySQL, Flux

include(srcdir("utils.jl"))

# Args
numNeurons = 20
numLayers = 6
numLaminations = 5
recurrence = false
inputPool = true
outputPool = true
numClasses = 1
lengthStrings = 8 
lengthAlphabet = 6

model = createModel(numNeurons, numLayers, numLaminations, recurrence, inputPool, outputPool, numClasses, lengthStrings, lengthAlphabet)

@test model == false