using CSV
using ProgressMeter
using Random
using MySQL
using DataFrames
using StatsBase
using LinearAlgebra

# Error string function
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

# Parameters

ALPHABET = 'a':'z'
numStrings = 10
stringLength = 11
numErrors = 1
Random.seed!(2022) # set seed for generating IDs for strings AND more importantly for generating strings


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
    numGrammars = DBInterface.execute(con, "SELECT * FROM grammars GROUP BY transitionMatrix;") |> DataFrame

    # Make grammars and push to DB

    for i in 1:size(numGrammars)[1]
        
        ## get transition matrix
        alphSize = numGrammars[i, 5]
        alphabet = ALPHABET[1:alphSize]
        grammarString = numGrammars[i, 6]
        grammarChop = chop(grammarString, head = 1, tail = 1)
        grammarSplit = split(grammarChop, "; ")
        transitionMatrix = zeros(alphSize, alphSize)
        for j in 1:alphSize
            for h in 1:alphSize
                transitionMatrix[j,h] = parse(Int, split(grammarSplit[j])[h])
            end
        end

        grammarID_db = string(numGrammars[i, 1], "_table") #get grammar ID
        errTransitionMatrix = transitionMatrix .== 0.0 #make inverted transition matrix
        
        DBDropQuery = string("DROP TABLE IF EXISTS ", grammarID_db, ";") 
        DBInterface.execute(con, DBDropQuery) #drop any existing table, just in case.
        grammarTableCreationQuery = string("CREATE TABLE ", grammarID_db, " (grammarId VARCHAR(100), string VARCHAR(", stringLength*2, "), stringNumber VARCHAR(", stringLength*5, "), error INT, stringId VARCHAR(100), PRIMARY KEY (stringId), FOREIGN KEY (grammarId) REFERENCES grammars(grammarId));")
        DBInterface.execute(con, grammarTableCreationQuery)
        #println(grammarTableCreationQuery)
        for k in 1:numStrings
            for z in 0:numErrors
                outputString = makeErrString(alphabet, transitionMatrix, errTransitionMatrix, 11, z)[1]
                outputStringAsNum = makeErrString(alphabet, transitionMatrix, errTransitionMatrix, 11, z)[2]
                insertIntoQuery = string("INSERT INTO ", grammarID_db, " (grammarId, string, stringNumber, error, stringId) VALUES(\"",
                numGrammars[i, 1], "\", \"",
                outputString, "\", \"",
                outputStringAsNum, "\", ",
                z, ", \"",
                string("String_", abs(rand(Int32))), "\");")
                DBInterface.execute(con, insertIntoQuery)
                #println(insertIntoQuery)
            end
        end

    end

    DBInterface.close!(con) #close the connection
else
    println("Database connection failed, try different login details.")
end