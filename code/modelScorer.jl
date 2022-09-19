using Flux 
using Revise
include("DistributedCode.jl")

sqnorm(x) = sum(abs2, x);

function loss(x, y, model)
    # modout = model(x) .>= 0.5
    # categories = cumprod(modout, dims=1)
    # preds = sum(categories, dims=1)
    return Flux.mse(model(x), y) #+ 0.01*sum(sqnorm, Flux.params(model));
end

function calculateNetworkCost(model, thresh=0.1) 
    numLayers = length(model)
    P = collect(Iterators.flatten(Flux.params(model)))
    numNonZero = length(P[P.>thresh])
    numNeurons = sum([sum(Flux.nfan(size(layer.weight))) for layer in model.layers])
    return numLayers + numNonZero + numNeurons
end

datdir = "../data/stringsNoLoops_5/"
file = "id=41_n=5_conn=10_TE=2.147899035704789.csv"
files = shuffle(readdir(datdir))[1:10]


model1 = Chain(
    Dense(55, 50, relu), 
    Dense(50, 10, sigmoid)
)

model2 = Chain(
    Dense(55, 25, relu), 
    Dense(25, 25, relu),
    Dense(25, 10, sigmoid)
)

TElist = zeros(length(files))

preScores = zeros(length(files))
postScores = zeros(length(files))
startAcc = zeros(length(files))
endAcc = zeros(length(files))
c0List = zeros(length(files))
c1List = zeros(length(files))

preScores2 = zeros(length(files))
postScores2 = zeros(length(files))
startAcc2 = zeros(length(files))
endAcc2 = zeros(length(files))
c0List2 = zeros(length(files))
c1List2 = zeros(length(files))

for num in eachindex(files)
    f = files[num]
    println(f)
    fcut = f[1:end-4]
    flist = split.(split(fcut, "_"), "=")
    flist = [[i[1], parse(Float64, i[2])] for i in flist]
    fDict = Dict(flist)
    TElist[num] = fDict["TE"][1]

    println("Running: ", num)
    model = modList[num]
    preScores[num] = calculateNetworkCost(model)
    c0List[num], c1List[num], startAcc[num], endAcc[num] = trainModelOnGrammar(datdir, f, model, 5, 500)
    postScores[num] = calculateNetworkCost(model)
end