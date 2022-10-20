
println("Loading packages...")
using Flux, Statistics
using Flux.Data: DataLoader
using Flux: onehotbatch, onecold, binarycrossentropy, mse, huber_loss, throttle, @epochs
# using Parameters: @with_kw
using CSV, DataFrames
using Random
using Plots
using LinearAlgebra
using SharedArrays
println("Loaded")

JULIA_NUM_THREADS=6
OPENBLAS_NUM_THREADS=6

# @with_kw mutable struct Args
#     η::Float64 = 1e-5       # learning rate
#     batchsize::Int = 15   # batch size
#     epochs::Int = 10        # number of epochs
#     device::Function = gpu  # set as gpu, if gpu available
# end

# function loss(x::Matrix{Float64}, y::LinearAlgebra.Adjoint{Int64, Vector{Int64}})
#     # modout = model(x) .>= 0.5
#     # categories = cumprod(modout, dims=1)
#     # preds = sum(categories, dims=1)
#     return Flux.mse(model(x), y)::Float64
# end

# function loss(x::Matrix{Float64}, y::LinearAlgebra.Adjoint{Float64, Matrix{Float64}})
#     # modout = model(x) .>= 0.5
#     # categories = cumprod(modout, dims=1)
#     # preds = sum(categories, dims=1)
#     return Flux.mse(model(x), y)::Float64
# end

function calcAcc(test_X::Matrix{Float64}, test_Y::LinearAlgebra.Adjoint{Int64, Vector{Int64}}, model)
    modout = model(test_X) .>= 0.5
    categories = cumprod(modout, dims=1)
    preds = sum(categories, dims=1)
    acc0 = sum((preds .== test_Y))/length(test_Y)
    acc1 = sum((preds .== test_Y) .| (preds .== (test_Y.+1)) .| (preds .== (test_Y.-1)))/length(test_Y)
    return (acc0::Float64, acc1::Float64)::Tuple{Float64, Float64}
end

function learnGrammar(f::String, datdir::String, n::Int64, n_epochs::Int64)
    df = CSV.read(string(datdir, f), DataFrame)

    batchsize = 15 
    propTests = 0.3
    indx  = Int(floor(length(df.string)*(1-propTests)))
    epochLength = Int(ceil(indx/batchsize))::Int64

    output_len = maximum(df.errors)::Int64
    input_len = Int(n*length(df.string[1]))::Int64

    df.encodedErrors = [vcat(ones( E), zeros( output_len-E)) for E in df.errors]

    # args = Args()
    model = Chain(
        Dense(input_len, Int(ceil(input_len)), relu),
        # Dense(Int(ceil(input_len)), Int(ceil(input_len)), relu),
        Dropout(0.1),
        # Dense(Int(ceil(input_len)), Int(ceil(input_len/1.5)), relu),
        Dense(Int(ceil(input_len)), output_len, sigmoid)
    )
    opt = ADAM(0.00001)

    df = df[shuffle(1:size(df, 1)), :];
    alphabet = collect('a':'z')[1:Int(n)]

    strings = [Float64.(vec(Flux.onehotbatch(S, alphabet, alphabet[1]))) for S in df.string]

    propTests = 0.2 
    indx  = Int(floor(length(df.string)*(1-propTests)))
    train_X = strings[1:indx]
    train_Y = df.encodedErrors[1:indx]' 
    test_X = strings[indx+1:end]
    test_Y = df.errors[indx+1:end]'

    model(strings[1])

    test_X = cat(test_X..., dims=2)
    # train_dat = ([(cat(train_X[i]..., dims=2),  train_Y[i]') for i in Iterators.partition(1:length(train_X), batchsize)])
    train_dat = ([(cat(train_X[i]..., dims=2),  cat(train_Y[i]..., dims=1)') for i in Iterators.partition(1:length(train_X), batchsize)])::Vector{Tuple{Matrix{Float64}, LinearAlgebra.Adjoint{Float64, Matrix{Float64}}}}

    lossVec = []
    valVec = []
    # println("Training...")

    # n_epochs = 500::Int64

    startAcc0 , startAcc1 = calcAcc(test_X, test_Y, model);

    @time begin
        for epoch in 1:n_epochs
            local l
            # println(epoch)
            for (bnum, d) in enumerate(train_dat)
                # println(bnum)
                gs = gradient(Flux.params(model)) do 
                    l = loss(d[1], d[2])
                end 
                Flux.update!(opt, Flux.params(model), gs)
            end 
        push!(lossVec, l)
        # modout = model(test_X) .>= 0.5
        # categories = cumprod(modout, dims=1)
        # preds = sum(categories, dims=1)
        # # preds = round.(Int, preds)
        # acc = sqrt(Flux.mse(preds, test_Y))
        # push!(valVec, acc)
        end
    end

    endAcc0 , endAcc1 = calcAcc(test_X, test_Y, model);

    change0 = endAcc0 - startAcc0
    change1 = endAcc1 - startAcc1

    return (change0, change1)::Tuple{Float64, Float64, Float64, Float64}
end


function trainModelOnGrammar(filepath::String, model, n::Int64, n_epochs::Int64)
    df = CSV.read(filepath, DataFrame)

    batchsize = 15 
    propTests = 0.3
    indx  = Int(floor(length(df.string)*(1-propTests)))
    epochLength = Int(ceil(indx/batchsize))::Int64

    output_len = maximum(df.errors)::Int64
    input_len = Int(n*length(df.string[1]))::Int64

    df.encodedErrors = [vcat(ones( E), zeros( output_len-E)) for E in df.errors]

    # args = Args()
    # model = Chain(
    #     Dense(input_len, Int(ceil(input_len)), relu),
    #     # Dense(Int(ceil(input_len)), Int(ceil(input_len)), relu),
    #     Dropout(0.1),
    #     # Dense(Int(ceil(input_len)), Int(ceil(input_len/1.5)), relu),
    #     Dense(Int(ceil(input_len)), output_len, sigmoid)
    # )
    # opt = ADAM(0.00001)
    opt = ADAM(0.0001)

    df = df[shuffle(1:size(df, 1)), :];
    alphabet = collect('a':'z')[1:Int(n)]

    strings = [Float64.(vec(Flux.onehotbatch(S, alphabet, alphabet[1]))) for S in df.string]

    propTests = 0.2 
    indx  = Int(floor(length(df.string)*(1-propTests)))
    train_X = strings[1:indx]
    train_Y = df.encodedErrors[1:indx]' 
    test_X = strings[indx+1:end]
    test_Y = df.errors[indx+1:end]'

    model(strings[1])

    test_X = cat(test_X..., dims=2)
    # train_dat = ([(cat(train_X[i]..., dims=2),  train_Y[i]') for i in Iterators.partition(1:length(train_X), batchsize)])
    train_dat = ([(cat(train_X[i]..., dims=2),  cat(train_Y[i]..., dims=1)') for i in Iterators.partition(1:length(train_X), batchsize)])::Vector{Tuple{Matrix{Float64}, LinearAlgebra.Adjoint{Float64, Matrix{Float64}}}}

    lossVec = []
    valVec = []
    # println("Training...")

    # n_epochs = 500::Int64

    startAcc0 , startAcc1 = calcAcc(test_X, test_Y, model);

    begin
        for epoch in 1:n_epochs
            local l
            # println(epoch)
            for (bnum, d) in enumerate(train_dat)
                # println(bnum)
                gs = gradient(Flux.params(model)) do 
                    l = loss(d[1], d[2], model)
                end 
                Flux.update!(opt, Flux.params(model), gs)
            end 
        # push!(lossVec, l)
        # modout = model(test_X) .>= 0.5
        # categories = cumprod(modout, dims=1)
        # preds = sum(categories, dims=1)
        # # preds = round.(Int, preds)
        # acc = sqrt(Flux.mse(preds, test_Y))
        # push!(valVec, acc)
        end
    end

    endAcc0 , endAcc1 = calcAcc(test_X, test_Y, model);

    change0 = endAcc0 - startAcc0
    change1 = endAcc1 - startAcc1

    return (change0, change1, startAcc0, endAcc0)::Tuple{Float64, Float64, Float64, Float64}
end

sqnorm(x) = sum(abs2, x);

function loss(x, y, model)
    # modout = model(x) .>= 0.5
    # categories = cumprod(modout, dims=1)
    # preds = sum(categories, dims=1)
    return Flux.mse(model(x), y) #+ 0.01*sum(sqnorm, Flux.params(model));
end

function lossBinary(x, y, model)
    # modout = model(x) .>= 0.5
    # categories = cumprod(modout, dims=1)
    # preds = sum(categories, dims=1)
    return Flux.logitbinarycrossentropy(model(x), y) #+ 0.01*sum(sqnorm, Flux.params(model));
end

function calculateNetworkCost(model, thresh=0.1) 
    numLayers = length(model)
    P = collect(Iterators.flatten(Flux.params(model)))
    numNonZero = length(P[abs.(P).>thresh])
    numNeurons = sum([sum(Flux.nfan(size(layer.weight))) for layer in model.layers])
    return numLayers + numNonZero + numNeurons
end 

function createModel(numNeurons, numLayers, numClasses, lengthStrings, lengthAlphabet)
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