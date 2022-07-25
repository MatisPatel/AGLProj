include("grammar.jl")
using BSON 
using CSV

BSON.@load "../data/grammars_6.bson" data alphSize
ALPHABET = 'a':'z'
N = alphSize
alphabet = ALPHABET[1:N]

G = data[100][end]
errG = G .== 0.0

gr = [makeErrString(alphabet, G, errG, 11, 0) for i in 1:1581]

ungr = collect(Iterators.flatten([[makeErrString(alphabet, G, errG, 11, n) for i in 1:500] for n in 1:10]))

stringDat = vcat(gr, ungr)

dataset = DataFrame(stringDat)
rename!(dataset, [:string, :numbers, :errors])
dataset[!, :errors] = length.(dataset[!, :errors])

CSV.write(string("../data/dataset_", N, ".csv"), dataset)