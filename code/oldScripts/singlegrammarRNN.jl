using Flux, Statistics
using Flux.Data: DataLoader
using Flux: onehotbatch, onecold, binarycrossentropy, mse, huber_loss, throttle, @epochs
# using Parameters: @with_kw
using CSV, DataFrames
# using CUDA
using Random
using Plots

function loss(x, y)
    Flux.reset!(model)
    # modout = model(x) .>= 0.5
    # categories = cumprod(modout, dims=1)
    # preds = sum(categories, dims=1)
    return Flux.mse(model(x)[:,:,end], y)
end

df = CSV.read("../data/strings_6/id=192_n=6_conn=25_TE=4.301858916713256.csv", DataFrame)

n_epochs = 1
batchsize = 15 
propTests = 0.2 
indx  = Int(floor(length(df.string)*(1-propTests)))
epochLength = Int(ceil(indx/batchsize))

output_len = maximum(df.errors)
input_len = 6*11

df.encodedErrors = [vcat(ones( E), zeros( output_len-E)) for E in df.errors]

# RNN test
model = Chain(
    RNN(6 => 10, relu),
    Dense(10 => 10, sigmoid)
)

opt = ADAM(0.0001)

global df, indx, propTests
df = df[shuffle(1:size(df, 1)), :];
alphabet = collect('a':'z')[1:6]

strings = [Float32.(Flux.onehotbatch(string, alphabet, alphabet[1])) for string in df.string] 

propTests = 0.2
indx  = Int(floor(length(df.string)*(1-propTests)))
train_X = strings[1:indx]
train_Y = df.encodedErrors[1:indx]' 
test_X = strings[indx+1:end]
test_Y = df.errors[indx+1:end]'

test_X = permutedims(cat(test_X..., dims=3), (1, 3, 2))

train_dat = ([(permutedims(cat(train_X[i]..., dims=3), (1, 3, 2)),  cat(train_Y[i]..., dims=1)') for i in Iterators.partition(1:length(train_X), batchsize)])

lossVec = []
valVec = []
println("Training...")

Flux.reset!(model)
n_epochs = 100
modout = model(test_X)[:,:,end] .>= 0.5
categories = cumprod(modout, dims=1)
preds = sum(categories, dims=1)
startAcc0 = sum((preds .== test_Y))/length(test_Y)
startAcc1 = sum((preds .== test_Y) .| (preds .== (test_Y.+1)) .| (preds .== (test_Y.-1)))/length(test_Y)


@time begin
    for epoch in 1:n_epochs
        train_dat = ([(permutedims(cat(train_X[i]..., dims=3), (1, 3, 2)),  
        cat(train_Y[i]..., dims=1)') for i in Iterators.partition(shuffle(1:length(train_X)), batchsize)])
        local l
        println(epoch)
        for (bnum, d) in enumerate(train_dat)
            println(bnum)
            gs = gradient(Flux.params(model)) do 
                l = loss(d[1], d[2])
            end 
            Flux.update!(opt, Flux.params(model), gs)
        end 
    push!(lossVec, l)
    Flux.reset!(model)
    modout = model(test_X)[:,:,end] .>= 0.5
    categories = cumprod(modout, dims=1)
    preds = sum(categories, dims=1)
    # preds = round.(Int, preds)
    acc = sqrt(Flux.mse(preds, test_Y))
    push!(valVec, acc)
    end
end

Flux.reset!(model)
modout = model(test_X)[:,:,end] .>= 0.5
categories = cumprod(modout, dims=1)
preds = sum(categories, dims=1)
endAcc0 = sum((preds .== test_Y))/length(test_Y)
endAcc1 = sum((preds .== test_Y) .| (preds .== (test_Y.+1)) .| (preds .== (test_Y.-1)))/length(test_Y)

change0 = endAcc0 - startAcc0
change1 = endAcc1 - startAcc1

rnnVal = valVec
rnnLoss =lossVec

plot([ffnVal, rnnVal], label=["ffn" "rnn"])