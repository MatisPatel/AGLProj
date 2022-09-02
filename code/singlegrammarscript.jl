using Flux, Statistics
using Flux.Data: DataLoader
using Flux: onehotbatch, onecold, binarycrossentropy, mse, huber_loss, throttle, @epochs
# using Parameters: @with_kw
using CSV, DataFrames
# using CUDA
using Random
using Plots

# @with_kw mutable struct Args
#     η::Float64 = 1e-5       # learning rate
#     batchsize::Int = 15   # batch size
#     epochs::Int = 10        # number of epochs
#     device::Function = gpu  # set as gpu, if gpu available
# end

function loss(x, y)
    # modout = model(x) .>= 0.5
    # categories = cumprod(modout, dims=1)
    # preds = sum(categories, dims=1)
    return Flux.mse(model(x), y)
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

# args = Args()
global model = Chain(
    Dense(input_len, Int(ceil(input_len)), relu),
    # Dense(Int(ceil(input_len)), Int(ceil(input_len)), relu),
    Dropout(0.1),
    # Dense(Int(ceil(input_len)), Int(ceil(input_len/1.5)), relu),
    Dense(Int(ceil(input_len)), output_len, sigmoid)
)

opt = Adam(0.0001)

global df, indx, propTests
df = df[shuffle(1:size(df, 1)), :];
alphabet = collect('a':'z')[1:6]

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
train_dat = ([(cat(train_X[i]..., dims=2),  cat(train_Y[i]..., dims=1)') for i in Iterators.partition(1:length(train_X), batchsize)])

lossVec = []
valVec = []
println("Training...")

n_epochs = 100
modout = model(test_X) .>= 0.5
categories = cumprod(modout, dims=1)
preds = sum(categories, dims=1)
startAcc0 = sum((preds .== test_Y))/length(test_Y)
startAcc1 = sum((preds .== test_Y) .| (preds .== (test_Y.+1)) .| (preds .== (test_Y.-1)))/length(test_Y)

@time begin
for epoch in 1:n_epochs
    train_dat = ([(cat(train_X[i]..., dims=2),  cat(train_Y[i]..., dims=1)') for i in Iterators.partition(shuffle(1:length(train_X)), batchsize)])
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
modout = model(test_X) .>= 0.5
categories = cumprod(modout, dims=1)
preds = sum(categories, dims=1)
# preds = round.(Int, preds)
acc = sqrt(Flux.mse(preds, test_Y))
push!(valVec, acc)
end
end

modout = model(test_X) .>= 0.5
categories = cumprod(modout, dims=1)
preds = sum(categories, dims=1)
endAcc0 = sum((preds .== test_Y))/length(test_Y)
endAcc1 = sum((preds .== test_Y) .| (preds .== (test_Y.+1)) .| (preds .== (test_Y.-1)))/length(test_Y)

change0 = endAcc0 - startAcc0
change1 = endAcc1 - startAcc1

function calcAcc(test_X, test_Y)
    modout = model(test_X) .>= 0.5
    categories = cumprod(modout, dims=1)
    preds = sum(categories, dims=1)
    acc0 = sum((preds .== test_Y))/length(test_Y)
    acc1 = sum((preds .== test_Y) .| (preds .== (test_Y.+1)) .| (preds .== (test_Y.-1)))/length(test_Y)
    return (acc0, acc1)
end

outDat = DataFrame(Dict("strings" => df.string[indx+1:end], "truth" => vec([x for x in test_Y]), "preds" => vec([x for x in preds])))

CSV.write("../data/simgle_model_out.csv", outDat)