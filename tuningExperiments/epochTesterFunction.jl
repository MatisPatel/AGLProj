function trainModelOnGrammarEpoch(grammarStrings, modelFromDB, alphabetLength, max_epochs, modelID)
    # loading the df from csv training data 
    #df = CSV.read(filepath, DataFrame)

    #query = string("SELECT * FROM strings WHERE grammarID = \"", grammarID, "\";")
    #grammarStrings = DBInterface.execute(con, query) |> DataFrame # force to right types

    model = modelFromDB #convert the string coming from the database into a chain

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

    #lossVec = []
    #valVec = []
    # println("Training...")

    # n_epochs = 500::Int64
    # startacc0 is proportion of strings exactly predicted.
    # startacc1 is proportion of strings predicted within 1 class range.
    # startAcc0 , startAcc1 = calcAcc(test_X, test_Y, model);


    # make train/test columns for pretraining
    #Train =  ["Train"]
    #Test = ["Test"]
    #grammarStrings.TrainOrTest = vcat(repeat(Train, indx), repeat(Test, length(strings[indx+1:end])))

    # test the model out on the strings we have, before we train the model
    #modout_trainX = model(cat(train_X..., dims=2)) .>= 0.5
    #categories_trainX = cumprod(modout_trainX, dims=1)
    #preds_trainX = sum(categories_trainX, dims=1) .== train_Y # this is giving all 0s, why?

    #modout_testX = model(test_X) .>= 0.5
    #categories_testX = cumprod(modout_testX, dims=1)
    #preds_testX = sum(categories_testX, dims=1) .== test_Y

    #grammarStrings.initialPreds = Int.(vec(hcat(preds_trainX, preds_testX)))

    valVec = []
    #begin
        for epoch in 1:max_epochs
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
        modout = model(test_X) .>= 0.5
        categories = cumprod(modout, dims=1)
        preds = sum(categories, dims=1) #.== test_Y
        # # preds = round.(Int, preds)
        acc = sqrt(Flux.mse(preds, test_Y))
        push!(valVec, acc)
        end
    #end

    # test the model out on the strings we have, before we train the model
    #modout_trainX = model(cat(train_X..., dims=2)) .>= 0.5
    #categories_trainX = cumprod(modout_trainX, dims=1)
    #preds_trainX = sum(categories_trainX, dims=1)

    #modout_testX = model(test_X) .>= 0.5
    #categories_testX = cumprod(modout_testX, dims=1)
    #preds_testX = sum(categories_testX, dims=1)

    #grammarStrings.trainedPreds = vec(hcat(preds_trainX, preds_testX))

    # make column of modelUUIDs

    #grammarStrings.modelID = vcat(repeat([modelID], length(strings)))

    dataframe = DataFrame(collect(valVec'), :auto) #make a dataframe with each column for each epoch
    
    dataframe.modelID = [modelID]

    return dataframe
end