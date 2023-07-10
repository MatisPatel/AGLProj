function trainModelOnGrammarTuning(grammarStrings, model, alphabetLength, max_epochs, modelID, batchSize, optimiser, optimiser_string)
    # batch size for each backprop update
    batchsize = batchSize 
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

    # defining optimiser to use
    opt = optimiser
    # shuffle for rows
    grammarStrings = grammarStrings[shuffle(1:size(grammarStrings, 1)), :]
    # getting chars for alphabet
    alphabet = collect('a':'z')[1:Int(alphabetLength)]

    # one hot encoding of strings for training/testing
    strings = [Float32.(vec(Flux.onehotbatch(S, alphabet, alphabet[1]))) for S in grammarStrings.string]

    # splitting the data ito train/test and strings and truth. 
    train_X = strings[1:indx]
    train_Y = grammarStrings.encodedErrors[1:indx]' #@Mati, why is this encoded Errors when test is just error?
    test_X = strings[indx+1:end]
    test_Y = hcat(grammarStrings.encodedErrors[indx+1:end]...) #@Mati, above q?

    # compile model call
    # model(strings[1])

    # 
    test_X = cat(test_X..., dims=2)
    # train_dat = ([(cat(train_X[i]..., dims=2),  train_Y[i]') for i in Iterators.partition(1:length(train_X), batchsize)])
    
    # list comp to make tuples for each batch 
    train_dat = ([(cat(train_X[i]..., dims=2),  cat(train_Y[i]..., dims=1)') for i in Iterators.partition(1:length(train_X), batchsize)]) #::Vector{Tuple{Matrix{Float64}, LinearAlgebra.Adjoint{Float64, Matrix{Float64}}}}

    #dataframe = DataFrame(optimiser = string(opt)) #make a dataframe with each column for each epoch

        for epoch in 1:max_epochs

            ps = Flux.params(model)
            loss(x, y) = sum(Flux.Losses.logitbinarycrossentropy(model(x), y))
            Flux.train!(loss, ps, train_dat, opt)    

            # modout = model(test_X) .>= 0.5
            # categories = cumprod(modout, dims=1)
            # preds = sum(categories, dims=1) #.== test_Y
            # acc = sqrt(Flux.mse(preds, test_Y))
            # if mod(epoch, 200) == 0
            #     push!(valVec, acc)
            # end
        end

    modout = model(test_X) .>= 0.5
    categories = cumprod(modout, dims=1)
    preds = sum(categories, dims=1) #.== test_Y
    acc = sqrt(Flux.mse(preds, test_Y))

    dataframe = DataFrame(endAccuracy = [acc])
    
    dataframe.modelID = [modelID]

    dataframe.batchsize = [batchSize]

    dataframe.epochs = [max_epochs]

    dataframe.optimiser = [optimiser_string]

    opt = Nothing
    optimiser = Nothing
    model = Nothing

    GC.gc()

    return dataframe
end