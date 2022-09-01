using BSON
include("grammar.jl")

# alphabet length 
N = 6 

# connections to sample rom (approx to to TE) at N^2 the matrix is fully connected and maximum entropy.
conn = 6:36 

# number of grammars at each level to make 
numGrammars = 10 

# make dataframe to store grammars 
df = []

#make grammars 
for numConn in conn 
    # gramVec = Matrix{Int64}[]
    for i in 1:numGrammars 
        done = false
        # while !done
            candidateGram = genConnectedGrammar(N, numConn)
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

bson(string("../data/grammars_", N, ".bson"), data=df, alphSize = N)