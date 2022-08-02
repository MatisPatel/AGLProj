using Flux, Statistics
using Flux.Data: DataLoader
using Flux: onehotbatch, onecold, binarycrossentropy, mse, huber_loss, throttle, @epochs
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
    modout = model(x) .>= 0.5
    categories = cumprod(modout, dims=1)
    preds = sum(categories, dims=1)
    return Flux.mse(preds, y)
end

df = CSV.read("../data/strings_6/id=192_n=6_conn=25_TE=4.301858916713256.csv", DataFrame)

n_epochs = 1
batchsize = 15 
propTests = 0.2 
indx  = Int(floor(length(df.string)*(1-propTests)))
epochLength = Int(ceil(indx/batchsize))

output_len = maximum(df.errors)
input_len = 6*11

df.encodedErrors = [vcat(ones(Int, E), zeros(Int, output_len-E)) for E in df.errors]

args = Args()
global model = Chain(
    Dense(input_len, Int(ceil(input_len/1.5)), relu),
    Dense(Int(ceil(input_len/1.5)), Int(ceil(input_len/1.5)), relu),
    # Dense(Int(ceil(input_len/1.5)), Int(ceil(input_len/1.5)), relu),
    Dense(Int(ceil(input_len/1.5)), output_len, sigmoid)
)
opt = ADAM(0.1)

global df, indx, propTests
df = df[shuffle(1:size(df, 1)), :];
alphabet = collect('a':'z')[1:6]

strings = [Float64.(vec(Flux.onehotbatch(S, alphabet, alphabet[1]))) for S in df.string]

propTests = 0.2 
indx  = Int(floor(length(df.string)*(1-propTests)))
train_X = strings[1:indx]
train_Y = df.errors[1:indx]' 
test_X = strings[indx+1:end]
test_Y = df.errors[indx+1:end]'

model(strings[1])

test_X = cat(test_X..., dims=2)
train_dat = ([(cat(train_X[i]..., dims=2),  train_Y[i]') for i in Iterators.partition(1:length(train_X), batchsize)])

lossVec = []
valVec = []
println("Training...")

n_epochs = 10

for epoch in 1:n_epochs
for (bnum, d) in enumerate(train_dat)
    local l
    println(bnum)
    gs = gradient(Flux.params(model)) do 
        l = loss(d[1], d[2])
    end 
    Flux.update!(opt, Flux.params(model), gs)
    push!(lossVec, l)
    println(l)
    
    # preds = model(test_X);
    # preds = round.(Int, preds)
    # acc = sqrt(mean((preds .- test_Y).^2));
    # push!(valVec, acc)
end 
end

