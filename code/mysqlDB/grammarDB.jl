using StatsBase
using LinearAlgebra
using DataFrames
using CSV
using Random
using MySQL
#include("grammar.jl")

### Functions

# Grammar Entropy function
function grammarEntropy(grammar)
    topEntropy = abs(eigvals(grammar)[end])
    return topEntropy
end

#Checking Connectedness of grammar 
function checkConnected(grammar)
    N = size(grammar)[1]
    gramN = grammar^N
    counts = sum(gramN .> 0, dims=2)
    return sum(counts .== N) > 0
end

function checkTransitionsFull(grammar)
    # println("check trans")
    rowSums = sum(grammar, dims=2)
    fullTrans = prod(rowSums .!= 0)
    return fullTrans
end

function genConnectedGrammar(N::Int, edges::Int, loops::Bool)
    done = false
    grammar = nothing

    if loops

        while !done
            grammar = reshape(shuffle(vcat(repeat([1], edges),
                    repeat([0], N^2 - edges))), N, N)
            if checkTransitionsFull(grammar)
                if checkConnected(grammar)
                    if sum(Diagonal(grammar)) >= 1 # added constraint so that it must have loops
                        done = true
                    end
                end
            end
        end

    else

        if edges > (N^2 - N)
            return "ERROR: Edges to large to construct with no loops"
        end

        if edges == N
            return "ERROR: To few edges to construct with no loops, or at least it will take too long..."
        end

        while !done
            grammar = reshape(shuffle(vcat(repeat([1], edges),
                    repeat([0], N^2 - edges))), N, N)
            #println(sum(Diagonal(grammar)))
            if checkTransitionsFull(grammar)
                if checkConnected(grammar)
                    if sum(Diagonal(grammar)) == 0 # added constraint so that it must not have loops
                        done = true
                    end
                end
            end
        end

    end
    return grammar
end

## Parameters

# alphabet length 
N = 4

# connections to sample rom (approx to to TE) at N^2 the matrix is fully connected and maximum entropy.
conn = N+1:N^2-N #keep getting error with only N connections

# number of grammars at each level to make 
numGrammars = 10

# make dataframe to store grammars 
#df = []

## Database Preamble

print("Opening DB Connection")
print("Please enter the database details:")
print("Enter host name:")
hostname = readline()
print("Enter user name:")
username = readline()
print("Enter password:")
password = readline()
print("Enter DB name:")
DBName = readline()

println("Setting up connection")
try
    con = DBInterface.connect(MySQL.Connection, hostname,
        username, password, db=DBName) # set up connection
    println("Success! Database connected!")
    dbConnectionBinary = true
catch
    dbConnectionBinary = false
end

if dbConnectionBinary
    println("Creating DB Table")
    DBInterface.execute(con, "DROP TABLE IF EXISTS grammars;") #drop any existing table, just in case.

    # create query with max length for transitionMatrix DB length

    queryGrammarTable = string("CREATE TABLE grammars (grammarID VARCHAR(100), connections INT, loops INT, entropy FLOAT, alphabetLength INT, transitionMatrix NVARCHAR(",
        (N^2) * 4, "));")
    DBInterface.execute(con, queryGrammarTable) # create a table

    ## Make grammars 

    roundingPrecision = 5 # what should we round entropy to?
    Random.seed!(2022) # set seed for generating IDs for grammars

    ## with loops
    println("Generating grammars with loops")
    loopsBinary = true

    for numConn in conn
        # gramVec = Matrix{Int64}[]
        for i in 1:numGrammars
            #done = false
            # while !done
            candidateGram = genConnectedGrammar(N, numConn, loopsBinary)
            # if !(candidateGram in gramVec) 
            # push!(gramVec, candidateGram)
            #     done = true
            # end
            # store grammar in dataframe 
            TE = round(grammarEntropy(candidateGram), digits=roundingPrecision)
            query = string("INSERT INTO grammars (grammarId, connections, loops, entropy, alphabetLength, transitionMatrix) VALUES(\"",
                string("Grammar_", abs(rand(Int32))), "\", ",
                numConn, ", ",
                Int(loopsBinary), ", ",
                TE, ", ",
                N, ", \"",
                string(candidateGram), "\");")
            #println(query)

            DBInterface.execute(con, query) # push to DB
            # end
        end
    end

    ## without loops
    println("Generating grammars without loops")

    loopsBinary = false

    for numConn in conn
        # gramVec = Matrix{Int64}[]
        for i in 1:numGrammars
            #done = false
            # while !done
            candidateGram = genConnectedGrammar(N, numConn, loopsBinary)
            # if !(candidateGram in gramVec) 
            # push!(gramVec, candidateGram)
            #     done = true
            # end
            # store grammar in dataframe 
            TE = round(grammarEntropy(candidateGram), digits=roundingPrecision)
            query = string("INSERT INTO grammars (grammarId, connections, loops, entropy, alphabetLength, transitionMatrix) VALUES(\"",
                string("Grammar_", abs(rand(Int32))), "\", ",
                numConn, ", ",
                Int(loopsBinary), ", ",
                TE, ", ",
                N, ", \"",
                string(candidateGram), "\");")
            #println(query)

            DBInterface.execute(con, query) # push to DB
            # end
        end
    end

    DBInterface.execute(con, "ALTER TABLE grammars ADD PRIMARY KEY (grammarId);") # make grammarId the primary key for this table, could move this into initial query

    #bson(string("../data/grammars_", N, ".bson"), data=df, alphSize = N)

    DBInterface.close!(con) #close the connection

else
    println("Database connection failed, try different login details.")
end