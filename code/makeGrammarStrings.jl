include("grammar.jl")
using BSON 
using CSV
using ProgressMeter

BSON.@load "../data/grammarsNoLoops_5.bson" data alphSize
ALPHABET = 'a':'z'

@showprogress for (i, entry) in enumerate(data)
    alphabet = ALPHABET[1:entry[1]]
    G = entry[end]
    errG = G .== 0.0

    gr = [makeErrString(alphabet, G, errG, 11, 0) for i in 1:1581]

    ungr = collect(Iterators.flatten([[makeErrString(alphabet, G, errG, 11, n) for i in 1:500] for n in 1:10]))

    stringDat = vcat(gr, ungr)

    dataset = DataFrame(stringDat)
    rename!(dataset, [:string, :numbers, :errors])
    dataset[!, :errors] = length.(dataset[!, :errors])

    CSV.write(string("../data/stringsNoLoops_5/", "id=", i, "_n=", N, "_conn=", entry[2], "_TE=", entry[3], ".csv"), dataset)
end