using Flux, Statistics
using Flux.Data: DataLoader
using Flux: onehotbatch, onecold, binarycrossentropy, mse, huber_loss, throttle, @epochs
using Parameters: @with_kw
using CSV, DataFrames
using CUDA
using Random
using Plots
using LinearAlgebra

@with_kw mutable struct Args
    η::Float64 = 1e-5       # learning rate
    batchsize::Int = 15   # batch size
    epochs::Int = 10        # number of epochs
    device::Function = gpu  # set as gpu, if gpu available
end

function loss(x::Matrix{Float64}, y::LinearAlgebra.Adjoint{Int64, Vector{Int64}})
    # modout = model(x) .>= 0.5
    # categories = cumprod(modout, dims=1)
    # preds = sum(categories, dims=1)
    return Flux.mse(model(x), y)::Float64
end

function loss(x::Matrix{Float64}, y::LinearAlgebra.Adjoint{Float64, Matrix{Float64}})
    # modout = model(x) .>= 0.5
    # categories = cumprod(modout, dims=1)
    # preds = sum(categories, dims=1)
    return Flux.mse(model(x), y)::Float64
end

function calcAcc(test_X::Matrix{Float64}, test_Y::LinearAlgebra.Adjoint{Int64, Vector{Int64}})
    modout = model(test_X) .>= 0.5
    categories = cumprod(modout, dims=1)
    preds = sum(categories, dims=1)
    acc0 = sum((preds .== test_Y))/length(test_Y)
    acc1 = sum((preds .== test_Y) .| (preds .== (test_Y.+1)) .| (preds .== (test_Y.-1)))/length(test_Y)
    return (acc0::Float64, acc1::Float64)::Tuple{Float64, Float64}
end

function learnGrammar(f::String, datdir::String, n::Int64)
    df = CSV.read(string(datdir, f), DataFrame)

    batchsize = 15 
    propTests = 0.3
    indx  = Int(floor(length(df.string)*(1-propTests)))
    epochLength = Int(ceil(indx/batchsize))::Int64

    output_len = maximum(df.errors)::Int64
    input_len = Int(n*length(df.string[1]))::Int64

    df.encodedErrors = [vcat(ones( E), zeros( output_len-E)) for E in df.errors]

    args = Args()
    global model = Chain(
        Dense(input_len, Int(ceil(input_len)), relu),
        # Dense(Int(ceil(input_len)), Int(ceil(input_len)), relu),
        Dropout(0.1),
        # Dense(Int(ceil(input_len)), Int(ceil(input_len/1.5)), relu),
        Dense(Int(ceil(input_len)), output_len, sigmoid)
    )
    opt = ADAM(0.00001)

    global df, indx, propTests
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

    n_epochs = 500::Int64

    startAcc0 , startAcc1 = calcAcc(test_X, test_Y);

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
        # push!(lossVec, l)
        # modout = model(test_X) .>= 0.5
        # categories = cumprod(modout, dims=1)
        # preds = sum(categories, dims=1)
        # # preds = round.(Int, preds)
        # acc = sqrt(Flux.mse(preds, test_Y))
        # push!(valVec, acc)
        end
    end

    endAcc0 , endAcc1 = calcAcc(test_X, test_Y);

    change0 = endAcc0 - startAcc0
    change1 = endAcc1 - startAcc1

    return (change0, change1)::Tuple{Float64, Float64}
end

datdir = "../data/strings_6/"
files = shuffle(readdir(datdir))

listID = zeros(length(files))
listTE = zeros(length(files))
listC0 = zeros(length(files))
listC1 = zeros(length(files))

for i in 1:length(files[1:100])
    f = files[i]
    fcut = f[1:end-4]
    flist = split.(split(fcut, "_"), "=")
    flist = [[i[1], parse(Float64, i[2])] for i in flist]
    fDict = Dict(flist)

    (c0, c1) = learnGrammar(f, datdir, Int(fDict["n"]))
    listC0[i] = c0
    listC1[i] = c1
    listTE[i] = fDict["TE"]
    listID[i] = fDict["id"]
end

changeDat = DataFrame(Dict("change0"=> listC0, "change1" => listC1 , "TE" => listTE, "id" => listID))

CSV.write(string(datdir, "change.csv"), changeDat)