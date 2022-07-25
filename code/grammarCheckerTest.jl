using Flux, Statistics
using Flux.Data: DataLoader
using Flux: onehotbatch, onecold, binarycrossentropy, throttle, @epochs
using Parameters: @with_kw
using CSV, DataFrames
using CUDA
using Random
using Plots

@with_kw mutable struct Args
    η::Float64 = 1e-5       # learning rate
    batchsize::Int = 15   # batch size
    epochs::Int = 10        # number of epochs
    device::Function = gpu  # set as gpu, if gpu available
end

function loss(x, y)
    ypred = model(x) 
    return binarycrossentropy(ypred, y)
end

function train_model(model, opt, train_dat, test_X, test_Y, epochs=1)      
    lossVec = []
    valVec = []
    println("Training...")
    for epoch in 1:epochs
        println(epoch)
        local l
        for d in train_dat
            gs = gradient(Flux.params(model)) do 
                l = loss(d...)
            end 
            Flux.update!(opt, Flux.params(model), gs)
            push!(lossVec, l)
            println(l)
            
            preds = model(test_X);
            preds = [x>0.5 ? 1 : 0 for x in preds]
            acc = sum(preds .== test_Y)/length(test_Y);
            push!(valVec, acc)
        end 
    end
    return lossVec, valVec
end

df = CSV.read("../data/testGrammar.csv", DataFrame)

# process data into train and test 
# shuffle data 
# df = df[shuffle(1:size(df, 1)), :];
# alphabet = unique(join(df.string))

# strings = [Float64.(vec(Flux.onehotbatch(S, alphabet, alphabet[1]))) for S in df.string]

# propTests = 0.2 
# indx  = Int(floor(length(df.string)*(1-propTests)))
# train_X = strings[1:indx]
# train_Y = df.grammatical[1:indx]' 
# test_X = strings[indx+1:end]
# test_Y = df.grammatical[indx+1:end]'

# input_len = size(strings[1])[1]
# hidden_len = Int(input_len*(2/3))
# args = Args()
# model = Chain(
#     Dense(input_len, input_len, relu),
#     Dense(input_len, input_len, relu),
#     Dense(input_len, input_len, relu),
#     Dense(input_len, 24, relu),
#     Dense(24, 1, sigmoid)
# )

# model(strings[1])

# test_X = cat(test_X..., dims=2)
# train_dat = ([(cat(train_X[i]..., dims=2), train_Y[i]') for i in Iterators.partition(1:length(train_X), 15)])

N = 10
n_epochs = 1
batchsize = 15 
propTests = 0.2 
indx  = Int(floor(length(df.string)*(1-propTests)))
epochLength = Int(ceil(indx/batchsize))
lossMat = zeros(N, epochLength*n_epochs)
valMat = zeros(N, epochLength*n_epochs)

for run in 1:N 
    input_len = 6*6

    args = Args()
    global model = Chain(
        # Dense(input_len, input_len, relu),
        # Dense(input_len, input_len, relu),
        # Dense(input_len, input_len, relu),
        Dense(input_len, 10, relu),
        Dense(10, 1, sigmoid)
    )
    opt = ADAM(0.01)
    
    global df, indx, propTests
    df = df[shuffle(1:size(df, 1)), :];
    alphabet = unique(join(df.string))

    strings = [Float64.(vec(Flux.onehotbatch(S, alphabet, alphabet[1]))) for S in df.string]

    propTests = 0.2 
    indx  = Int(floor(length(df.string)*(1-propTests)))
    train_X = strings[1:indx]
    train_Y = df.grammatical[1:indx]' 
    test_X = strings[indx+1:end]
    test_Y = df.grammatical[indx+1:end]'

    # input_len = size(strings[1])[1]

    # args = Args()
    # model = Chain(
    #     Dense(input_len, input_len, relu),
    #     Dense(input_len, input_len, relu),
    #     Dense(input_len, input_len, relu),
    #     Dense(input_len, 24, relu),
    #     Dense(24, 1, sigmoid)
    # )
    # opt = ADAM(0.01)

    model(strings[1])

    test_X = cat(test_X..., dims=2)
    train_dat = ([(cat(train_X[i]..., dims=2), train_Y[i]') for i in Iterators.partition(1:length(train_X), batchsize)])

    # lossMat[run, :], valMat[run, :] = train_model(model,opt, train_dat, test_X, test_Y, n_epochs)

    lossVec = []
    valVec = []
    println("Training...")
    for epoch in 1:n_epochs
        println(epoch)
        local l
        for d in train_dat
            gs = gradient(Flux.params(model)) do 
                l = loss(d...)
            end 
            Flux.update!(opt, Flux.params(model), gs)
            push!(lossVec, l)
            println(l)
            
            preds = model(test_X);
            preds = [x>0.5 ? 1 : 0 for x in preds]
            acc = sum(preds .== test_Y)/length(test_Y);
            push!(valVec, acc)
        end 
    end
    lossMat[run, :] = lossVec
    valMat[run, :] = valVec
end

meanLoss = mean(lossMat, dims=1)
meanVal = mean(valMat, dims=1) 
p1 = plot([meanLoss', meanVal'], labels=["loss" "acc"])
savefig(p1, "../graphs/model.png")

# epochs = 1
# lossVec = []
# valVec = []
# println("Training...")
# for epoch in 1:epochs
#     println(epoch)
#     local l
#     for d in train_dat
#         gs = gradient(Flux.params(model)) do 
#             l = loss(d...)
#         end 
#         Flux.update!(opt, Flux.params(model), gs)
#         push!(lossVec, l)
#         println(l)
        
#         preds = model(test_X);
#         preds = [x>0.5 ? 1 : 0 for x in preds]
#         acc = sum(preds .== test_Y)/length(test_Y);
#         push!(valVec, acc)
#     end 
# end

# p1 = plot([lossVec, valVec], labels=["loss" "acc"])
# savefig(p1, "../graphs/model.png")