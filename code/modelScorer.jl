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

datdir = "../data/stringsNoLoops_5"
file = "/id=41_n=5_conn=10_TE=2.147899035704789.csv"

modList = []
for i in 1:1:50
    model = Chain(Dense(55, 24+i, relu), Dense(24+i, 10, sigmoid))
    push!(modList, model)
end

preScores = zeros(length(modList))
postScores = zeros(length(modList))
startAcc = zeros(length(modList))
endAcc = zeros(length(modList))
c0List = zeros(length(modList))
c1List = zeros(length(modList))

for num in eachindex(modList)
    println("Running: ", num)
    model = modList[num]
    preScores[num] = calculateNetworkCost(model)
    c0List[num], c1List[num], startAcc[num], endAcc[num] = trainModelOnGrammar(datdir, file, model, 5, 500)
    postScores[num] = calculateNetworkCost(model)
end

# v = collect(Iterators.flatten(Flux.params(model)))
# histogram(v)