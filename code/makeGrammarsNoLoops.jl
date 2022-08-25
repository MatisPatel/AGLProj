using BSON
using ProgressMeter
include("grammar.jl")

# alphabet length 
N = 5 

# connections to sample rom (approx to to TE) at N^2 the matrix is fully connected and maximum entropy.
conn = 6:20

# number of grammars at each level to make 
numGrammars = 10 

# make dataframe to store grammars 
df = []

#make grammars 
@showprogress for numConn in conn 
    # gramVec = Matrix{Int64}[]
    for i in 1:numGrammars 
        # done = false
        # while !done
            candidateGram = genConnectedGrammarNoLoops(N, numConn)
            # if !(candidateGram in gramVec) 
                # push!(gramVec, candidateGram)
            #     done = true
            # end
            # store grammar in dataframe 
            TE = grammarEntropy(candidateGram)
            row = (; N, numConn, TE, candidateGram)
            push!(df, row)
        # end
    end
end

bson(string("../data/grammarsNoLoops_", N, ".bson"), data=df, alphSize = N)