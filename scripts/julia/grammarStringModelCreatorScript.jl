############################################# Full pipeline for grammars ########################################################
# Author: M. Patel, K. Voudouris
# Project Title: AGLProj
# Julia Version: 1.8.2
# MySQL version: 8.0.31
#################################################################################################################################

# Script Outline
# 0. Load packages & setup DB connection & define parameters
# 1. First we build the grammars. 
# 2. Then we make the strings. 
# 3. Then we define the models. 

#################################################################################################################################
# 0. Preamble

using DrWatson
@quickactivate "AGLProj"
using StatsBase, LinearAlgebra, DataFrames, CSV, Random, MySQL, Flux

include(srcdir("utils.jl"))

# Set up database

con = database_connect("database_connection.csv")

#######################
## SCRIPT PARAMETERS ##
#######################

#@everywhere begin
    # alphabet 
    ALPHABET = 'a':'z'

    # alphabet length 
    alphabetLength = 6

    # connections to sample from (approx to to TE) at `alphabetLength`^2 the matrix is fully connected and maximum entropy.
    grammarConnections = alphabetLength*2:alphabetLength^2-alphabetLength #keep getting error with `alphabetLength` connections with no loops, so have made the lower limit 2*alphabetlength.

    # Entropy rounding parameter
    roundingPrecision = 5 # what should we round entropy to?

    # number of grammars at each level to make 
    numGrammars = 100 # note that it will probably be less than this for a lot of grammars, as there will be many duplicate grammars. Should probably think of a way to make this work better and more efficiently. Currently making duplicates a lot in the grammar maker.

    # number of strings we want per grammar, multiply this by number of errors
    numStrings = 250

    # string length 
    stringLength = 2   

    # number of errors we want. Equivalent to n-1 number of classes to classify
    numErrors = 1

    # Set seed for randomisers (for DB IDs and for initialising NNs)
    Random.seed!(2022) # may need to work out how to change this for all workers ! 
    
    # Number of attempts to try to find unique transition matrices
    numAttempts = 10

    # Minimum number of neurons we want in the networks 
    minNumNeurons = 8

    # Maximum number of neurons we want in the networks 
    maxNumNeurons = 512

    # Increments between neurons
    neuronIncrements = 4 #ensure they are increments that make sense

    # Minimum number of layers we want in the networks
    minNumLayers = 1

    # Maximum number of layers we want in the networks
    maxNumLayers = 20

    # Maximum number of laminations in neural network (assuming increments of 1)
    maxNumLaminations = 8
#end

# Do you want to re-run the database pushes?
reRunDB = false

##################################################################################################################################
# 1. Build grammars


# Make grammar table

if reRunDB 

    println("Creating DB Table")
    DBDropQuery = string("DROP TABLE IF EXISTS strings;") # make the drop table query 
    DBInterface.execute(con, DBDropQuery) #drop any existing table, just in case.

    DBInterface.execute(con, "DROP TABLE IF EXISTS grammars;") #drop any existing table, just in case.
    # may need to drop dependent tables, if so: DBInterface.execute(con, "DROP TABLE IF EXISTS trainedmodels;"); DBInterface.execute(con, "DROP TABLE IF EXISTS strings;"); DBInterface.execute(con, "DROP TABLE IF EXISTS models;")
    # create query with max length for transitionMatrix DB length

    queryGrammarTable = string("CREATE TABLE grammars (grammarID INT AUTO_INCREMENT NOT NULL PRIMARY KEY, connections INT NOT NULL, loops INT NOT NULL, topentropy FLOAT NOT NULL, adjmatrixrealentropy FLOAT NOT NULL, adjmatriximagentropy FLOAT, adjmatrixmodentropy FLOAT NOT NULL, indlaplacianrealentropy FLOAT NOT NULL, indlaplacianimagentropy FLOAT, indlaplacianmodentropy FLOAT NOT NULL, slesslaplacianrealentropy FLOAT NOT NULL, slesslaplacianimagentropy FLOAT, slesslaplacianmodentropy FLOAT NOT NULL, alphabetLength INT NOT NULL, transitionMatrix CHAR(",
        (alphabetLength^2)*4, ") UNIQUE);") # have made enough room for the transitionMatrix by squaring alphabetLength for the flattened square matrix, and then multiplying by 4 just to be sure we don't hit an error, but should need at most 3 times (with white space, comments, and brackets).
    DBInterface.execute(con, queryGrammarTable) # create a table

    # Make grammars and push to DB

    ## with loops
    println("Attempting to generate ", (numGrammars*((grammarConnections[end]-grammarConnections[1])+1)) ," grammars with loops")
    begin
        loopsBinary = true
        for numConn in grammarConnections 
            # gramVec = Matrix{Int64}[]
            grammarCounter = 0
            for grammarNum in 1:numGrammars
                #done = false
                # while !done
                    for attemptNum in 1:numAttempts
                        if grammarCounter < numGrammars # only try more attempts if you have less than the desired number of grammars
                            #println("Attempt Number: ", attemptNum, " for Connections: ", numConn, " grammar number: ", grammarNum)
                            try
                                candidateGram, outDegreeMatrix, inDegreeMatrix, outDegreeLaplacian, inDegreeLaplacian, signlessInDegreeLaplacian = genConnectedGrammar(alphabetLength, numConn, loopsBinary)
                                # store grammar in dataframe 
                                topEntropy, adjMatrixRealEntropy, adjMatrixImaginaryEntropy, adjMatrixModulusEntropy, inDegreeLaplacianRealEntropy, inDegreeLaplacianImaginaryEntropy, inDegreeLaplacianModulusEntropy, signlessInDegreeLaplacianRealEntropy, signlessInDegreeLaplacianImaginaryEntropy, signlessInDegreeLaplacianModulusEntropy = grammarEntropy(candidateGram, inDegreeLaplacian, signlessInDegreeLaplacian)
                                adjMatrixImaginaryEntropy =  ifelse(isnan(adjMatrixImaginaryEntropy), " NULL ", round(adjMatrixImaginaryEntropy, digits = roundingPrecision))
                                inDegreeLaplacianImaginaryEntropy =  ifelse(isnan(inDegreeLaplacianImaginaryEntropy), " NULL ", round(inDegreeLaplacianImaginaryEntropy, digits = roundingPrecision))
                                signlessInDegreeLaplacianImaginaryEntropy =  ifelse(isnan(signlessInDegreeLaplacianImaginaryEntropy), " NULL ", round(signlessInDegreeLaplacianImaginaryEntropy, digits = roundingPrecision))
                                query = string("INSERT INTO grammars (connections, loops, topentropy, adjmatrixrealentropy, adjmatriximagentropy, adjmatrixmodentropy, indlaplacianrealentropy, indlaplacianimagentropy, indlaplacianmodentropy, slesslaplacianrealentropy, slesslaplacianimagentropy, slesslaplacianmodentropy, alphabetLength, transitionMatrix) VALUES(",
                                    numConn, ", ",
                                    Int(loopsBinary), ", ",
                                    round(topEntropy, digits = roundingPrecision), ", ",
                                    round(adjMatrixRealEntropy, digits = roundingPrecision), ", ",
                                    adjMatrixImaginaryEntropy, ", ",
                                    round(adjMatrixModulusEntropy, digits = roundingPrecision), ", ",
                                    round(inDegreeLaplacianRealEntropy, digits = roundingPrecision), ", ",
                                    inDegreeLaplacianImaginaryEntropy, ", ",
                                    round(inDegreeLaplacianModulusEntropy, digits = roundingPrecision), ", ",
                                    round(signlessInDegreeLaplacianRealEntropy, digits = roundingPrecision), ", ",
                                    signlessInDegreeLaplacianImaginaryEntropy, ", ",
                                    round(signlessInDegreeLaplacianModulusEntropy, digits = roundingPrecision), ", ",
                                    alphabetLength, ", \"",
                                    string(candidateGram), "\");"
                                )
    
                                DBInterface.execute(con, query) # push to DB - will fail if there is an identical transition matrix, as this has a unique constraint.

                                grammarCounter += 1 # successfully added a grammar to the database, so add 1 to the counter

                                continue
                            catch
                                println("A non-unique transition matrix was found for grammar number ", grammarNum, " of grammars with ", numConn, " connections and loops = ", loopsBinary, ". Attempt ", attemptNum, " of ", numAttempts)

                                continue
                            end
                        else
                            break
                        end
                    end
                # end
            end
        end
    end
    ## without loops
    println("Attempting to generate ", (numGrammars*((grammarConnections[end]-grammarConnections[1])+1))*2, " grammars without loops")

    begin
        #@everywhere 
        loopsBinary = false
        #@sync @distributed 
        for numConn in grammarConnections 
            # gramVec = Matrix{Int64}[]
            grammarCounter = 0 
            for grammarNum in 1:numGrammars
                    for attemptNum in 1:numAttempts
                        if grammarCounter < numGrammars # only try more attempts if you have less than the desired number of grammars
                            #println("Attempt Number: ", attemptNum, " for Connections: ", numConn, " grammar number: ", grammarNum)
                            try
                                candidateGram, outDegreeMatrix, inDegreeMatrix, outDegreeLaplacian, inDegreeLaplacian, signlessInDegreeLaplacian = genConnectedGrammar(alphabetLength, numConn, loopsBinary)
                                # store grammar in dataframe 
                                topEntropy, adjMatrixRealEntropy, adjMatrixImaginaryEntropy, adjMatrixModulusEntropy, inDegreeLaplacianRealEntropy, inDegreeLaplacianImaginaryEntropy, inDegreeLaplacianModulusEntropy, signlessInDegreeLaplacianRealEntropy, signlessInDegreeLaplacianImaginaryEntropy, signlessInDegreeLaplacianModulusEntropy = grammarEntropy(candidateGram, inDegreeLaplacian, signlessInDegreeLaplacian)
                                adjMatrixImaginaryEntropy =  ifelse(isnan(adjMatrixImaginaryEntropy), " NULL ", round(adjMatrixImaginaryEntropy, digits = roundingPrecision))
                                inDegreeLaplacianImaginaryEntropy =  ifelse(isnan(inDegreeLaplacianImaginaryEntropy), " NULL ", round(inDegreeLaplacianImaginaryEntropy, digits = roundingPrecision))
                                signlessInDegreeLaplacianImaginaryEntropy =  ifelse(isnan(signlessInDegreeLaplacianImaginaryEntropy), " NULL ", round(signlessInDegreeLaplacianImaginaryEntropy, digits = roundingPrecision))
                                query = string("INSERT INTO grammars (connections, loops, topentropy, adjmatrixrealentropy, adjmatriximagentropy, adjmatrixmodentropy, indlaplacianrealentropy, indlaplacianimagentropy, indlaplacianmodentropy, slesslaplacianrealentropy, slesslaplacianimagentropy, slesslaplacianmodentropy, alphabetLength, transitionMatrix) VALUES(",
                                    numConn, ", ",
                                    Int(loopsBinary), ", ",
                                    round(topEntropy, digits = roundingPrecision), ", ",
                                    round(adjMatrixRealEntropy, digits = roundingPrecision), ", ",
                                    adjMatrixImaginaryEntropy, ", ",
                                    round(adjMatrixModulusEntropy, digits = roundingPrecision), ", ",
                                    round(inDegreeLaplacianRealEntropy, digits = roundingPrecision), ", ",
                                    inDegreeLaplacianImaginaryEntropy, ", ",
                                    round(inDegreeLaplacianModulusEntropy, digits = roundingPrecision), ", ",
                                    round(signlessInDegreeLaplacianRealEntropy, digits = roundingPrecision), ", ",
                                    signlessInDegreeLaplacianImaginaryEntropy, ", ",
                                    round(signlessInDegreeLaplacianModulusEntropy, digits = roundingPrecision), ", ",
                                    alphabetLength, ", \"",
                                    string(candidateGram), "\");"
                                )
    
                                DBInterface.execute(con, query) # push to DB - will fail if there is an identical transition matrix, as this has a unique constraint.

                                grammarCounter += 1 # successfully added a grammar to the database, so add 1 to the counter

                                continue
                            catch
                                println("A non-unique transition matrix was found for grammar number ", grammarNum, " of grammars with ", numConn, " connections and loops = ", loopsBinary, ". Attempt ", attemptNum, " of ", numAttempts)

                                continue
                            end
                        else
                            break
                        end
                    end
                # end
            end
        end
    end
else 
    nothing
end

#################################################################################################################################
# 2. Make grammar strings

# Grammars in DB

grammarsFromDB = DBInterface.execute(con, "SELECT * FROM grammars;") |> DataFrame # get the grammars by unique transition matrix and convert to dataframe.
println("There are ", nrow(grammarsFromDB), " grammars in the database. You may have asked for ", (numGrammars*((grammarConnections[end]-grammarConnections[1])+1))*2, " grammars, but many of those would have been duplicated.")


if reRunDB
    # Drop string table if necessary and then create

    DBDropQuery = string("DROP TABLE IF EXISTS strings;") # make the drop table query 
    DBInterface.execute(con, DBDropQuery) #drop any existing table, just in case.

    stringTableCreationQuery = string("CREATE TABLE strings (grammarID INT NOT NULL, string VARCHAR(", stringLength*2, ") NOT NULL, stringLength INT, stringNumber VARCHAR(", stringLength*5, ") NOT NULL, error INT NOT NULL, stringID INT AUTO_INCREMENT NOT NULL PRIMARY KEY, FOREIGN KEY (grammarID) REFERENCES grammars(grammarID));") #string ID is the primary key, foreign key is grammarID which references the grammar table
    DBInterface.execute(con, stringTableCreationQuery)
end

begin
    # Make grammars and push to DB

    println("Creating ", size(grammarsFromDB)[1]*numStrings*(numErrors+1), " strings in the table `strings`")
    
    #@sync @distributed 
    for i in 1:size(grammarsFromDB)[1] #for all the grammars that are unique in the DB
        
        begin
            ## get transition matrix
            alphSize = grammarsFromDB.alphabetLength[i] # get the alphabet size from the DB
            alphabet = ALPHABET[1:alphSize] # get the alphabet letters we want
            grammarString = grammarsFromDB.transitionMatrix[i] # get the flattened transition matrix
            grammarChop = chop(grammarString, head = 1, tail = 1) # chop the brackets off either side
            grammarSplit = split(grammarChop, "; ") # get the rows as separated by ;
            transitionMatrix = zeros(alphSize, alphSize) # initialise a matrix of 0s
            for j in 1:alphSize # for each row
                for h in 1:alphSize # for each column
                    transitionMatrix[j,h] = parse(Int, split(grammarSplit[j])[h]) # take the integer from the grammarSplit at the right index
                end
            end
            #grammarID_db = string(grammarsFromDB.grammarID[i], "_table") #get grammar ID, legacy from making lots of separate tables
            errTransitionMatrix = transitionMatrix .== 0.0 #make inverted transition matrix
  
            #println(stringTableCreationQuery)
        
            for stringNum in 1:numStrings
                for errorNum in 0:numErrors
                    outputString, outputStringAsNum = makeString(alphabet, transitionMatrix, errTransitionMatrix, stringLength, errorNum)
                    insertIntoQuery = string("INSERT INTO strings (grammarID, string, stringNumber, stringLength, error) VALUES(\"",
                        grammarsFromDB.grammarID[i], "\", \"",
                        outputString, "\", \"", 
                        outputStringAsNum, "\", ",
                        stringLength, ", ",
                        errorNum, ");"
                    )
                    DBInterface.execute(con, insertIntoQuery)
                    #println(insertIntoQuery)
                end
            end
        end

    end
end

##################################################################################################################################
# 3. Define models 

if reRunDB
    # Make model table

    println("Creating DB Table")
    DBInterface.execute(con, "DROP TABLE IF EXISTS modelatts;") #drop any existing table, just in case.
    DBInterface.execute(con, "CREATE TABLE modelatts (modelID INT AUTO_INCREMENT PRIMARY KEY, neurons INT, layers INT, laminations INT, recurrence BOOL, inpool BOOL, outpool BOOL, UNIQUE (neurons, layers, laminations, recurrence, inpool, outpool));") # create a table of the models 

    # Push models to DB and save to a list for training later. 
end

for neurs in minNumNeurons:neuronIncrements:maxNumNeurons
    for lays in minNumLayers:maxNumLayers
        for lams in 1:maxNumLaminations
            for ipool in [true, false]
                for opool in [true, false]
                    for rec in [true, false]
                        model = createModel(neurs, lays, lams, rec, ipool, opool, numErrors, stringLength, alphabetLength)
                        if model != false
                            query = string("INSERT INTO modelatts (neurons, layers, laminations, recurrence, inpool, outpool) VALUES(",
                                            neurs, ", ",
                                            lays, ", ",
                                            lams, ", ",
                                            rec, ", ",
                                            ipool, ", ",
                                            opool, ");"
                                            )
                            try
                                DBInterface.execute(con, query)
                            catch
                                println("This model has already been entered into the database")
                                println(model)
                            end
                        end
                    end
                end
            end
        end
    end
end
                                
DBInterface.close!(con) #close the connection