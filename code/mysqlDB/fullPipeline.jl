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

using StatsBase
using LinearAlgebra
using DataFrames
using CSV
using Random
using MySQL
using Flux 
using Revise
using ProgressMeter
using SharedArrays

# Set up database

#dbName = "modeloutputdev100"

println("Opening DB Connection")
con = DBInterface.connect(MySQL.Connection, "",
"", "", db = "") # set up connection

#######################
## SCRIPT PARAMETERS ##
#######################

# alphabet 
ALPHABET = 'a':'z'

# alphabet length 
alphabetLength = 6

# connections to sample from (approx to to TE) at `alphabetLength`^2 the matrix is fully connected and maximum entropy.
grammarConnections = 15:15 #alphabetLength*2:alphabetLength^2-alphabetLength #keep getting error with `alphabetLength` connections with no loops, so have made the lower limit 2*alphabetlength.

# Entropy rounding parameter
roundingPrecision = 5 # what should we round entropy to?

# number of grammars at each level to make 
numGrammars = 5 # note that it will probably be less than this for a lot of grammars, as there will be many duplicate grammars. Should probably think of a way to make this work better and more efficiently. Currently making duplicates a lot in the grammar maker.

# number of strings we want per grammar
numStrings = 100

# string length 
stringLength = 11

# number of errors we want. Equivalent to n-1 number of classes to classify
numErrors = 1

# Set seed for randomisers (for DB IDs and for initialising NNs)
Random.seed!(2022) 

# Number of epochs to run the training for
n_epochs = 15

# Do you want to re-run the database pushes?
reRunDB = true

##################################################################################################################################
# 1. Build grammars

# Define some functions we will need 

# Grammar Entropy function - get the entropy of the grammar, as the largest absolute eigenvalue of the grammar transition matrix

function grammarEntropy(grammar)
    topEntropy = abs(eigvals(grammar)[end])
    return topEntropy
end

# Checking Connectedness of grammar - check whether the grammar is connected.

function checkConnected(grammar)
    N = size(grammar)[1]
    gramN = grammar^N
    counts = sum(gramN .> 0, dims=2)
    return sum(counts .== N) > 0
end

# Check full transitions of grammar - check whether every state can be transitioned out of, no 0s on any rows

function checkTransitionsFull(grammar)
    # println("check trans")
    rowSums = sum(grammar, dims=2)
    fullTrans = prod(rowSums .!= 0)
    return fullTrans
end

# Generate fully connected, fully transitioned grammars with and without loops (loops = same state can be visited multiple times sequentially)

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

# Make grammar table

if reRunDB 

    println("Creating DB Table")
    DBInterface.execute(con, "DROP TABLE IF EXISTS grammars;") #drop any existing table, just in case.

    # create query with max length for transitionMatrix DB length

    queryGrammarTable = string("CREATE TABLE grammars (grammarUUID CHAR(100) PRIMARY KEY, connections INT, loops INT, entropy FLOAT, alphabetLength INT, transitionMatrix CHAR(",
        (alphabetLength^2)*4, "));") # have made enough room for the transitionMatrix by squaring alphabetLength for the flattened square matrix, and then multiplying by 4 just to be sure we don't hit an error, but should need at most 3 times (with white space, comments, and brackets).
    DBInterface.execute(con, queryGrammarTable) # create a table

    # Make grammars and push to DB

    ## with loops
    println("Generating grammars with loops")
    loopsBinary = true

    for numConn in grammarConnections 
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

    ## without loops
    println("Generating grammars without loops")

    loopsBinary = false

    for numConn in grammarConnections 
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
else 
    nothing
end

#################################################################################################################################
# 2. Make grammar strings

# String maker function

function makeString(alphabet, grammar, err_grammar, str_len, errors) # takes an alphabet, a grammar, an error_grammar which is a transformation of that grammar, the length of the strings you want to build, and the number of errors you want
    str_idxs = Vector{Int64}(undef, str_len) # make vector of undefined values
    alphSize = length(alphabet) # get length of alphabet
    str_idxs[1] = rand(1:alphSize) # assign first index to be a random letter in alphabet
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

# Grammars in DB

grammarsFromDB = DBInterface.execute(con, "SELECT * FROM grammars GROUP BY transitionMatrix;") |> DataFrame # get the grammars by unique transition matrix and convert to dataframe.

if reRunDB
    # Drop string table if necessary and then create

    DBDropQuery = string("DROP TABLE IF EXISTS strings;") # make the drop table query 
    DBInterface.execute(con, DBDropQuery) #drop any existing table, just in case.

    stringTableCreationQuery = string("CREATE TABLE strings (grammarUUID CHAR(100), string VARCHAR(", stringLength*2, "), stringNumber VARCHAR(", stringLength*5, "), error INT, stringUUID CHAR(100) PRIMARY KEY, FOREIGN KEY (grammarUUID) REFERENCES grammars(grammarUUID));") #string ID is the primary key, foreign key is grammarID which references the grammar table
    DBInterface.execute(con, stringTableCreationQuery)

    # Make grammars and push to DB

    println("Creating ", size(grammarsFromDB)[1]*numStrings*(numErrors+1), "strings in the table `strings`")

    for i in 1:size(grammarsFromDB)[1] #for all the grammars that are unique in the DB
    
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
            for z in 0:numErrors
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
else
    nothing
end

##################################################################################################################################
# 3. Define models 

# Create models function

function createModel(numNeurons, numLayers, numClasses, lengthStrings, lengthAlphabet)
    # Takes number of neurons, number of layers, number of classes (i.e., errors), length of strings, and length of alphabet 
    splits = Int.(sort([floor(numNeurons*(k+1)/numLayers) - floor(numNeurons*k / numLayers) for k in 1:numLayers], rev=true))
    if (length(splits) == 1)
        model = Chain(
            Dense(lengthStrings*lengthAlphabet, splits[1], relu),
            Dense(splits[end], numClasses, sigmoid)
        )
    else
        model = Chain(
            Dense(lengthStrings*lengthAlphabet, splits[1], relu),
            [Dense(splits[i], splits[i+1], relu) for i in 1:(length(splits) - 1)]...,
            Dense(splits[end], numClasses, sigmoid)
        )
    end
    return model
end

if reRunDB

    # Make model table

    println("Creating DB Table")
    DBInterface.execute(con, "DROP TABLE IF EXISTS models;") #drop any existing table, just in case.
    DBInterface.execute(con, "CREATE TABLE models (modelUUID CHAR(100) PRIMARY KEY, name VARCHAR(1000), neurons INT, layers INT);") # create a table of the models 

    # Push models to DB and save to a list for training later.

    
    begin   
        modelList = []
        for numNeurons in 4:4:100
            for numLayers in 1:2
                model = createModel(numNeurons, numLayers, numErrors, stringLength, alphabetLength)
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
    
    begin   
        modelList = []
        for numNeurons in 4:4:100
            for numLayers in 1:2
                model = createModel(numNeurons, numLayers, numErrors, stringLength, alphabetLength)
                push!(modelList, (model, numNeurons, numLayers))
            
                #query = string("INSERT INTO models (modelUUID, name, neurons, layers) VALUES(UUID(), ", "\"",
                #string(model), "\", ",
                #numNeurons, ", ",
                #numLayers, ");")
                #println(query)
    
                #DBInterface.execute(con, query) # push to DB
            end
        end
    end
end

##################################################################################################################################
# 4. Train models 

#  calculate loss function 

# function loss(x, y, model)
#     # modout = model(x) .>= 0.5
#     # categories = cumprod(modout, dims=1)
#     # preds = sum(categories, dims=1)
#     return Flux.mse(model(x), y) #+ 0.01*sum(sqnorm, Flux.params(model));
# end



# Make predictions given a model, function

# function calcAcc(test_X::Matrix{Float64}, test_Y::LinearAlgebra.Adjoint{Int64, Vector{Int64}}, model)
#     modout = model(test_X) .>= 0.5
#     categories = cumprod(modout, dims=1)
#     preds = sum(categories, dims=1)
#     acc0 = sum((preds .== test_Y))/length(test_Y)
#     acc1 = sum((preds .== test_Y) .| (preds .== (test_Y.+1)) .| (preds .== (test_Y.-1)))/length(test_Y)
#     return (acc0::Float64, acc1::Float64)::Tuple{Float64, Float64}
# end

# train model function

function trainModelOnGrammar(grammarUUID, model, modelUUID, alphabetLength, n_epochs)
    # loading the df from csv training data 
    #df = CSV.read(filepath, DataFrame)
    Flux.reset!(model)
    query = string("SELECT * FROM strings WHERE grammarUUID = \"", grammarUUID, "\";")
    grammarStrings = DBInterface.execute(con, query) |> DataFrame # force to right types

    # batch size for each backprop update
    batchsize = 15 
    # proportion of strings that will be in test group and not trained on
    propTests = 0.3
    # index for cut between training and test groups
    indx  = Int(floor(length(grammarStrings.string)*(1-propTests)))
    # epochLength = Int(ceil(indx/batchsize))::Int64

    # determine size of output layer of network. 
    output_len = maximum(grammarStrings.error)::Int32
    # input_len = Int(n*length(df.string[1]))::Int64

    # new col in grammarStrings, where errors are encoded as ordinal values [0,0] [1, 0] [1, 1]
    grammarStrings.encodedErrors = [vcat(ones( E), zeros( output_len-E)) for E in grammarStrings.error]

    # args = Args()
    # model = Chain(
    #     Dense(input_len, Int(ceil(input_len)), relu),
    #     # Dense(Int(ceil(input_len)), Int(ceil(input_len)), relu),
    #     Dropout(0.1),
    #     # Dense(Int(ceil(input_len)), Int(ceil(input_len/1.5)), relu),
    #     Dense(Int(ceil(input_len)), output_len, sigmoid)
    # )
    # opt = ADAM(0.00001) 
    # defining optimiser to use
    opt = ADAM(0.0001)
    # shuffle for rows
    grammarStrings = grammarStrings[shuffle(1:size(grammarStrings, 1)), :]
    # getting chars for alphabet
    alphabet = collect('a':'z')[1:Int(alphabetLength)]

    # one hot encoding of strings for training/testing
    strings = [Float64.(vec(Flux.onehotbatch(S, alphabet, alphabet[1]))) for S in grammarStrings.string]

    # splitting the data ito train/test and strings and truth. 
    train_X = strings[1:indx]
    train_Y = grammarStrings.encodedErrors[1:indx]' #@Mati, why is this encoded Errors when test is just error?
    test_X = strings[indx+1:end]
    test_Y = grammarStrings.encodedErrors[indx+1:end]' #@Mati, above q?

    # compile model call
    # model(strings[1])

    # 
    test_X = cat(test_X..., dims=2)
    # train_dat = ([(cat(train_X[i]..., dims=2),  train_Y[i]') for i in Iterators.partition(1:length(train_X), batchsize)])
    
    # list comp to make tuples for each batch 
    train_dat = ([(cat(train_X[i]..., dims=2),  cat(train_Y[i]..., dims=1)') for i in Iterators.partition(1:length(train_X), batchsize)]) #::Vector{Tuple{Matrix{Float64}, LinearAlgebra.Adjoint{Float64, Matrix{Float64}}}}

    #lossVec = []
    #valVec = []
    # println("Training...")

    # n_epochs = 500::Int64
    # startacc0 is proportion of strings exactly predicted.
    # startacc1 is proportion of strings predicted within 1 class range.
    # startAcc0 , startAcc1 = calcAcc(test_X, test_Y, model);


    # make train/test columns for pretraining
    Train =  ["Train"]
    Test = ["Test"]
    grammarStrings.TrainOrTest = vcat(repeat(Train, indx), repeat(Test, length(strings[indx+1:end])))

    # test the model out on the strings we have, before we train the model
    modout_trainX = model(cat(train_X..., dims=2)) .>= 0.5
    categories_trainX = cumprod(modout_trainX, dims=1)
    preds_trainX = sum(categories_trainX, dims=1) .== train_Y # this is giving all 0s, why?

    modout_testX = model(test_X) .>= 0.5
    categories_testX = cumprod(modout_testX, dims=1)
    preds_testX = sum(categories_testX, dims=1) .== test_Y

    grammarStrings.initialPreds = Int.(vec(hcat(preds_trainX, preds_testX)))

    begin
        for epoch in 1:n_epochs
            #local l
            #println(epoch)
            #for d in enumerate(train_dat)
                #println(bnum)
                #gs = gradient(Flux.params(model)) do 
                #    l = Flux.logitbinarycrossentropy(model(d[1]), d[2])
                    # Flux.mse(model(train_dat[1][1]), train_dat[1][2]) - works, but can't get gradient - zygote error.
                    # Flux.logitbinarycrossentropy(model(train_dat[1][1]), train_dat[1][2])
            #    end 
            #    Flux.update!(opt, Flux.params(model), gs)
            ps = Flux.params(model)
            loss(x, y) = sum(Flux.Losses.binarycrossentropy(model(x), y))
            Flux.train!(loss, ps, train_dat, opt)    
            #end 
        # push!(lossVec, l)
        # modout = model(test_X) .>= 0.5
        # categories = cumprod(modout, dims=1)
        # preds = sum(categories, dims=1)
        # # preds = round.(Int, preds)
        # acc = sqrt(Flux.mse(preds, test_Y))
        # push!(valVec, acc)
        end
    end

    # test the model out on the strings we have, before we train the model
    modout_trainX = model(cat(train_X..., dims=2)) .>= 0.5
    categories_trainX = cumprod(modout_trainX, dims=1)
    preds_trainX = sum(categories_trainX, dims=1)

    modout_testX = model(test_X) .>= 0.5
    categories_testX = cumprod(modout_testX, dims=1)
    preds_testX = sum(categories_testX, dims=1)

    grammarStrings.trainedPreds = vec(hcat(preds_trainX, preds_testX))

    # make column of modelUUIDs

    #grammarStrings.modelUUID = vcat(repeat([modelUUID], length(strings)))

    return grammarStrings
end

# Make model table

println("Creating DB Table of model training")
DBInterface.execute(con, "DROP TABLE IF EXISTS trainedmodels;") #drop any existing table, just in case.
DBInterface.execute(con, "CREATE TABLE trainedmodels (traininginstanceUUID CHAR(100) PRIMARY KEY, stringUUID CHAR(100), modelUUID CHAR(100), trainteststring VARCHAR(10), pretrainpreds INT, posttrainpreds INT, epochs INT, FOREIGN KEY (stringUUID) REFERENCES strings(stringUUID), FOREIGN KEY (modelUUID) REFERENCES models(modelUUID));") # create a table of the models 

modelsFromDB = DBInterface.execute(con, "SELECT * FROM models;") |> DataFrame # get the grammars by unique transition matrix and convert to dataframe.

# Train the models 

# need to add training instance UUID

for i in 1:size(grammarsFromDB)[1]
    #for j in 1:size(modelsFromDB)[1]
    for j in 1:2

        global outputOfTraining = trainModelOnGrammar(grammarsFromDB.grammarUUID[i], modelList[j][1], modelsFromDB.modelUUID[j], alphabetLength, n_epochs)
        for h in 1:size(outputOfTraining)[1]
            
            query = string("INSERT INTO trainedmodels (traininginstanceUUID, stringUUID, modelUUID, trainteststring, pretrainpreds, posttrainpreds, epochs) VALUES(UUID(), \"",
                outputOfTraining.stringUUID[h], "\", \"",
                modelsFromDB.modelUUID[j], "\", \"",
                outputOfTraining.TrainOrTest[h], "\", ",
                outputOfTraining.initialPreds[h], ", ",
                outputOfTraining.trainedPreds[h], ", ",
                n_epochs, ");")
            #println(query)
            #println(modelsFromDB.modelUUID[j])
            DBInterface.execute(con, query) # push to DB
        end
        println("Model ", modelsFromDB.modelUUID[j], " trained on grammar ", grammarsFromDB.grammarUUID[i], " and added to the database. Moving on to the next.")
    end
end










#DBInterface.close!(con) #close the connection