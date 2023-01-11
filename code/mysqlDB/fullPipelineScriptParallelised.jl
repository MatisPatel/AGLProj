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
# 4. Then we train the models.

#################################################################################################################################
# 0. Preamble

# Load packages
using Distributed 
# addprocs(n) to add n extra workers 
# @everywhere import Pkg; Pkg.instantiate() # run this if you need to install the packages on each worker
# @everywhere import Pkg; Pkg.add("SharedArrays"); Pkg.add("Distributed"); Pkg.add("StatsBase"); Pkg.add("LinearAlgebra"); Pkg.add("DataFrames"); Pkg.add("CSV"); Pkg.add("Random"); Pkg.add("MySQL"); Pkg.add("Flux"); Pkg.add("Revise"); Pkg.add("ProgressMeter") # add whatever packages aren't installed on your workers

@everywhere begin
    using SharedArrays
    using Distributed
    using StatsBase
    using LinearAlgebra
    using DataFrames
    using CSV
    using Random
    using MySQL
    using Flux 
    #using Revise
    #using ProgressMeter
    include("C:/Users/kv301/OneDrive - University of Cambridge/Documents/PhD Year 2/Major Transitions Project/AGLProj/code/mysqlDB/fullPipelineFunctionsKV.jl")
end

# Set up database

#dbName = "modeloutput"

#println("Opening DB Connection")
#con = DBInterface.connect(MySQL.Connection, "5.67.9.60", # for pi connection
#"user", "password", db = dbName) # set up connection

println("Opening DB Connection")
@everywhere begin
    dbName = "modeloutputsmall"
    con = DBInterface.connect(MySQL.Connection, "localhost",
    "username", "password", db = dbName) # set up connection
end


#######################
## SCRIPT PARAMETERS ##
#######################

@everywhere begin
    # alphabet 
    ALPHABET = 'a':'z'

    # alphabet length 
    alphabetLength = 6

    # connections to sample from (approx to to TE) at `alphabetLength`^2 the matrix is fully connected and maximum entropy.
    grammarConnections = alphabetLength*2:alphabetLength^2-alphabetLength #keep getting error with `alphabetLength` connections with no loops, so have made the lower limit 2*alphabetlength.

    # Entropy rounding parameter
    roundingPrecision = 5 # what should we round entropy to?

    # number of grammars at each level to make 
    numGrammars = 2 # note that it will probably be less than this for a lot of grammars, as there will be many duplicate grammars. Should probably think of a way to make this work better and more efficiently. Currently making duplicates a lot in the grammar maker.

    # number of strings we want per grammar
    numStrings = 3

    # string length 
    stringLength = 11   

    # number of errors we want. Equivalent to n-1 number of classes to classify
    numErrors = 1

    # Set seed for randomisers (for DB IDs and for initialising NNs)
    Random.seed!(2022) # may need to work out how to change this for all workers !   

    # Number of epochs to run the training for
    n_epochs = 5

    # Minimum number of neurons we want in the networks 
    minNumNeurons = 4

    # Maximum number of neurons we want in the networks 
    maxNumNeurons = 40

    # Increments between neurons
    neuronIncrements = 4 #ensure they are increments that make sense

    # Minimum number of layers we want in the networks
    minNumLayers = 1

    # Maximum number of layers we want in the networks
    maxNumLayers = 2
end

# Do you want to re-run the database pushes?
reRunDB = true

##################################################################################################################################
# 1. Build grammars


# Make grammar table

if reRunDB 

    println("Creating DB Table")
    DBInterface.execute(con, "DROP TABLE IF EXISTS grammars;") #drop any existing table, just in case.
    # may need to drop dependent tables, if so: DBInterface.execute(con, "DROP TABLE IF EXISTS trainedmodels;"); DBInterface.execute(con, "DROP TABLE IF EXISTS strings;"); DBInterface.execute(con, "DROP TABLE IF EXISTS models;")
    # create query with max length for transitionMatrix DB length

    queryGrammarTable = string("CREATE TABLE grammars (grammarUUID CHAR(100) PRIMARY KEY, connections INT, loops INT, entropy FLOAT, alphabetLength INT, transitionMatrix CHAR(",
        (alphabetLength^2)*4, "));") # have made enough room for the transitionMatrix by squaring alphabetLength for the flattened square matrix, and then multiplying by 4 just to be sure we don't hit an error, but should need at most 3 times (with white space, comments, and brackets).
    DBInterface.execute(con, queryGrammarTable) # create a table

    # Make grammars and push to DB

    ## with loops
    println("Generating ", numGrammars*(grammarConnections[end]-grammarConnections[1]) ," grammars with loops")
    begin
        @everywhere loopsBinary = true
        @sync @distributed for numConn in grammarConnections 
            # gramVec = Matrix{Int64}[]
            for i in 1:numGrammars 
                #done = false
                # while !done
                    candidateGram = genConnectedGrammar(alphabetLength, numConn, loopsBinary)
                        # if !(candidateGram in gramVec) 
                        # push!(gramVec, candidateGram)
                    #   done = true
                    # end
                    # store grammar in dataframe 
                    TE = round(grammarEntropy(candidateGram), digits = roundingPrecision)
                    query = string("INSERT INTO grammars (grammarUUID, connections, loops, entropy, alphabetLength, transitionMatrix) VALUES(UUID(), ",
                    numConn, ", ",
                    Int(loopsBinary), ", ",
                    TE, ", ",
                    alphabetLength, ", \"",
                    string(candidateGram), "\");")
                    #println(query)
    
                    DBInterface.execute(con, query) # push to DB
                # end
            end
        end
    end
    ## without loops
    println("Generating grammars without loops")

    begin
        @everywhere loopsBinary = false
        @sync @distributed for numConn in grammarConnections 
            # gramVec = Matrix{Int64}[]
            for i in 1:numGrammars 
                #done = false
                # while !done
                    candidateGram = genConnectedGrammar(alphabetLength, numConn, loopsBinary)
                    # if !(candidateGram in gramVec) 
                        # push!(gramVec, candidateGram)
                    #     done = true
                    # end
                    # store grammar in dataframe 
                    TE = round(grammarEntropy(candidateGram), digits = roundingPrecision)
                    query = string("INSERT INTO grammars (grammarUUID, connections, loops, entropy, alphabetLength, transitionMatrix) VALUES(UUID(), ",
                    numConn, ", ",
                    Int(loopsBinary), ", ",
                    TE, ", ",
                    alphabetLength, ", \"",
                    string(candidateGram), "\");")
                    #println(query)
    
                    DBInterface.execute(con, query) # push to DB
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

@everywhere grammarsFromDB = DBInterface.execute(con, "SELECT * FROM grammars GROUP BY transitionMatrix;") |> DataFrame # get the grammars by unique transition matrix and convert to dataframe.

if reRunDB
    # Drop string table if necessary and then create

    DBDropQuery = string("DROP TABLE IF EXISTS strings;") # make the drop table query 
    DBInterface.execute(con, DBDropQuery) #drop any existing table, just in case.

    stringTableCreationQuery = string("CREATE TABLE strings (grammarUUID CHAR(100), string VARCHAR(", stringLength*2, "), stringNumber VARCHAR(", stringLength*5, "), error INT, stringUUID CHAR(100) PRIMARY KEY, FOREIGN KEY (grammarUUID) REFERENCES grammars(grammarUUID));") #string ID is the primary key, foreign key is grammarID which references the grammar table
    DBInterface.execute(con, stringTableCreationQuery)

    # Make grammars and push to DB

    println("Creating ", size(grammarsFromDB)[1]*numStrings*(numErrors+1), "strings in the table `strings`")
    
    @sync @distributed for i in 1:size(grammarsFromDB)[1] #for all the grammars that are unique in the DB
        
        begin
            ## get transition matrix
            alphSize = grammarsFromDB.alphabetLength[i] # get the alphabet size from the DB
            alphabet = ALPHABET[1:alphSize] # get the alphabet leeters we want
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
        
            for k in 1:numStrings
                for z in 0:numStrings
                    outputString, outputStringAsNum = makeString(alphabet, transitionMatrix, errTransitionMatrix, stringLength, z)
                    insertIntoQuery = string("INSERT INTO strings (grammarUUID, string, stringNumber, error, stringUUID) VALUES(\"",
                    grammarsFromDB.grammarUUID[i], "\", \"",
                    outputString, "\", \"", 
                    outputStringAsNum, "\", ",
                    z, ", UUID());")
                    DBInterface.execute(con, insertIntoQuery)
                    #println(insertIntoQuery)
                end
            end
        end

    end
else
    nothing
end

##################################################################################################################################
# 3. Define models 

if reRunDB

    # Make model table

    println("Creating DB Table")
    DBInterface.execute(con, "DROP TABLE IF EXISTS models;") #drop any existing table, just in case.
    DBInterface.execute(con, "CREATE TABLE models (modelUUID CHAR(100) PRIMARY KEY, name VARCHAR(1000), neurons INT, layers INT);") # create a table of the models 

    # Push models to DB and save to a list for training later.

    
    @everywhere begin   
        modelList = []
        for numNeurons in minNumNeurons:neuronIncrements:maxNumNeurons
            for numLayers in minNumLayers:maxNumLayers
                model = createModel(numNeurons, numLayers, numClasses, stringLength, alphabetLength)
                push!(modelList, (model, numNeurons, numLayers))
            
                query = string("INSERT INTO models (modelUUID, name, neurons, layers) VALUES(UUID(), ", "\"",
                string(model), "\", ",
                numNeurons, ", ",
                numLayers, ");")
                #println(query)
    
                DBInterface.execute(con, query) # push to DB
            end
        end
    end
else
    
    @everywhere begin   
        modelList = [] # we need the list in for training - might change as we might be able to parse strings into chains
        for numNeurons in minNumNeurons:neuronIncrements:maxNumNeurons
            for numLayers in minNumLayers:maxNumLayers
                model = createModel(numNeurons, numLayers, numErrors, stringLength, alphabetLength)
                push!(modelList, (model, numNeurons, numLayers))
            end
        end
    end
end

##################################################################################################################################
# 4. Train models 

# Train the models 

@sync @distributed for i in 1:size(grammarsFromDB)[1]
    for j in 1:size(modelsFromDB)[1]

        outputOfTraining = trainModelOnGrammar(grammarsFromDB.grammarUUID[i], modelList[j][1], modelsFromDB.modelUUID[j], alphabetLength, n_epochs)
        for h in 1:size(outputOfTraining)[1]
            
            query = string("INSERT INTO trainedmodels (traininginstanceUUID, stringUUID, modelUUID, trainteststring, pretrainpreds, posttrainpreds, epochs) VALUES(UUID(), \"",
                outputOfTraining.stringUUID[h], "\", \"",
                modelsFromDB.modelUUID[j], "\", \"",
                outputOfTraining.TrainOrTest[h], "\", ",
                outputOfTraining.initialPreds[h], ", ",
                outputOfTraining.trainedPreds[h], ", ",
                n_epochs, ");")
            DBInterface.execute(con, query) # push to DB
        end
        #println("Model ", modelsFromDB.modelUUID[j], " trained on grammar ", grammarsFromDB.grammarUUID[i], " and added to the database. Moving on to the next.")
    end
end

@everywhere DBInterface.close!(con) #close the connection