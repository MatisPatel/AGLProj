using StatsBase
using LinearAlgebra
using DataFrames 
using CSV 
using Random

function makeString(alphabet, grammar, str_len, error=0.0)
    str_idxs = Vector{Int64}(undef, str_len)
    err_grammar = grammar .+ error
    alphSize = length(alphabet)
    str_idxs[1] = rand(1:alphSize) 
    for n in 2:str_len 
        next = sample(1:alphSize, Weights(err_grammar[str_idxs[n-1], :]))
        str_idxs[n] = next
    end 
    return join(alphabet[str_idxs]), str_idxs
end

function makeErrString(alphabet, grammar, err_grammar, str_len, errors)
    str_idxs = Vector{Int64}(undef, str_len)
    alphSize = length(alphabet)
    str_idxs[1] = rand(1:alphSize) 
    where_errors = nothing
    if (errors < str_len-1)
        where_errors = sample(2:str_len, errors, replace=false)
    else
        where_errors = 2:str_len
    end
    for n in 2:str_len 
        if n in where_errors
            next = sample(1:alphSize, Weights(err_grammar[str_idxs[n-1], :]))
            str_idxs[n] = next
        else 
            next = sample(1:alphSize, Weights(grammar[str_idxs[n-1], :]))
            str_idxs[n] = next
        end
    end 
    return join(alphabet[str_idxs]), str_idxs, where_errors
end

function randomGrammar(N::Int)
    # make grammar
    grammar = rand([0,1], N*N)
    return reshape(grammar, N, N)
end

function genConnectedGrammar(N::Int, edges::Int)
    done = false 
    grammar = nothing
    while !done 
        grammar = reshape(shuffle(vcat(repeat([1], edges), 
        repeat([0], N^2 - edges))), N, N)
        if checkConnected(grammar) 
            done = true 
        end 
    end 
    return grammar 
end

function genConnectedGrammarNoLoops(N::Int, edges::Int)
    done = false 
    grammar = zeros(N, N)
    while !done 
        if edges > (N^2 - N)
            return "ERROR: Edges to large to construct with no loops"
        end

        links = shuffle(vcat(repeat([1], edges), repeat([0], N^2 - N - edges)))
        for i in 1:N 
            for j in 1:N 
                if i == j 
                    grammar[i, j] = 0 
                else 
                    grammar[i, j] = pop!(links)
                end
            end
        end

        if checkConnected(grammar) 
            done = true 
        end 
    end 
    return grammar 
end

function grammarEntropy(grammar)
        topEntropy = abs(eigvals(grammar)[end])
        return topEntropy
end 

function checkConnected(grammar) 
    N = size(grammar)[1]
    gramN = grammar^N 
    counts = sum(gramN .> 0, dims=2)
    return sum(counts .== N) > 0
end

# N = 10
# grammars  = [[genConnectedGrammar(N, i) for j in 1:100] for i in N:(N*N)]
# entropies = [mean([grammarEntropy(gram) for gram in list]) for list in grammars]
# plot(entropies)
# alphabet = ['M', 'Q', 'R', 'T', 'V', 'X']

# # from https://link.springer.com/article/10.3758/s13428-012-0253-6/tables/2
# grammar = [0.0 0.0 0.0 0.0 0.5 0.5;
#            0.5 0.0 0.0 0.0 0.0 0.5;
#            0.0 0.5 0.0 0.5 0.0 0.0;
#            0.0 1.0 0.0 0.0 0.0 0.0;
#            0.0 0.5 0.5 0.0 0.0 0.0;
#            0.0 0.0 0.3 0.3 0.3 0.0]

# err_grammar = grammar .== 0.0

# grammaticalStrings = [makeString(alphabet, grammar, 4) for i in 1:10]
# ungrammaticalStrings = [makeErrString(alphabet, grammar, err_grammar, 4, 1) for i in 1:10]

# # genenrate data
# gr = [makeString(alphabet, grammar, 6)[1] for i in 1:500]
# ungr = [makeErrString(alphabet, grammar, err_grammar, 6, 1)[1] for i in 1:500]

# df = DataFrame(
#     string=vcat(gr, ungr), 
#     grammatical=vcat(repeat([1], 500), repeat([0], 500))
#     ) 

# CSV.write("../data/testGrammar.csv", df)