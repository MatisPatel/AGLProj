## Functions for pipeline
using Random
using LinearAlgebra
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
        # [[j==i ? 0 : 1 for j in 1:N] for i in 1:N]
        while !done
            listEdges = shuffle(vcat(repeat([1], edges),
                    repeat([0], N^2-N - edges))) 
            grammar = vcat([[j==i ? 0 : pop!(listEdges) for j in 1:N] for i in 1:N])
            grammar = reduce(hcat, grammar)
            #println(sum(Diagonal(grammar)))
            if sum(Diagonal(grammar)) == 0
                if checkTransitionsFull(grammar)
                    if checkConnected(grammar) # added constraint so that it must not have loops
                        done = true
                    end
                end
            end
        end

    end
    return grammar
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

###################################################################################################################################

# train model function

function trainModelOnGrammar(grammarUUID, model, modelUUID, alphabetLength, n_epochs)
    # loading the df from csv training data 
    #df = CSV.read(filepath, DataFrame)

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
            println(epoch)
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