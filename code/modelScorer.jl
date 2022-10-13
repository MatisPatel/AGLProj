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
    try 
        numNeurons = sum([sum(Flux.nfan(size(layer.weight))) for layer in model.layers]) # doesn't work for parallel layers, have to go into each
    catch;
        finallayernumNeurons = sum(Flux.nfan(size(model.layers[end].weight))) # get the final layer weight (because it is just a dense layer)
        iLayerNeurons = [] # initialise vector to save layer Neurons into
        for i in 1:(length(model)-1) # iterate through all layers except last one
        p1Neurons = sum(Flux.nfan(size(model.layers[i][1].weight))) # get the number of neurons for the first Dense part of Parallel
        p2Neurons = sum(Flux.nfan(size(model.layers[i][2].weight))) # ditto but for second
            try # try for a third
                p3Neurons = sum(Flux.nfan(size(model.layers[i][3].weight))) # try for a third
                push!(iLayerNeurons, p1Neurons + p2Neurons + p3Neurons) # push sum to list
            catch;
                push!(iLayerNeurons, p1Neurons + p2Neurons) # otherwise save sum of first two
            end
        end
        numNeurons = finallayernumNeurons + sum(iLayerNeurons) # sum together final layers and remaining parallel layers
    end
    return numLayers + numNonZero + numNeurons # sum together
end

datdir = "C:/Users/kv301/OneDrive - University of Cambridge/Documents/PhD Year 2/Major Transitions Project/AGLProj/"
file = "data/stringsNoLoops_5/id=42_n=5_conn=10_TE=2.1478990357047856.csv"

modList = []
for i in 0:1:50 # 1-layer net
    model = Chain(
        Dense(55, 24+i, relu), 
        Dense(24+i, 10, sigmoid)
        )
    push!(modList, model)
end

for i in 0:1:50 # 2-layer net
    for j in 0:1:50
        model = Chain(
            Dense(55, 24+i, relu), 
            Dense(24+i, 24+j, relu), 
            Dense(24+j, 10, sigmoid)
            )
        push!(modList, model)
    end
end

for i in 0:1:50 # 3-layer net
    for j in 0:1:50
        for h in 0:1:50
            model = Chain(Dense(55, 24+i, relu), 
            Dense(24+i, 24+j, relu), 
            Dense(24+j, 24+h, relu), 
            Dense(24+h, 10, sigmoid)
            )
            push!(modList, model)
        end
    end
end

for i in 0:1:25 # bring it up to 37 in each side of the layer from 12, total 74 (from 24), as above
    model = Chain( 
        Parallel(vcat, p1=Dense(55, 12+i, relu), p2=Dense(55,12+i, relu)), 
        Dense((12+i)*2, 10, sigmoid)
        )
    push!(modList, model)
end

for i in 0:1:25 # bring it up to 37 in each side of the layer from 12, total 74 (from 24), as above
    model = Chain( 
        Parallel(vcat, p1=Dense(55, 12+i, relu), p2=Dense(55,12+i, relu)),
        Parallel(vcat, p1=Dense(12+i, 12+i, relu), p2=Dense(12+i,12+i, relu)),
        Dense((12+i)*2, 10, sigmoid)
        )
    push!(modList, model)
end

for i in 0:1:17 # bring it up to 25 in each side of the layer from 8, total 75 (from 24)
    model = Chain( 
        Parallel(vcat, p1=Dense(55, 8+i, relu), p2=Dense(55,8+i, relu), p3=Dense(55, 8+i, relu)), 
        Dense((8+i)*3, 10, sigmoid)
        )
    push!(modList, model)
end

#for i in 0:1:17 # bring it up to 25 in each side of the layer from 8, total 75 (from 24)
#    model = Chain( 
#        Parallel(vcat, p1=Dense(55, 8+i, relu), p2=Dense(55,8+i, relu), p3=Dense(55, 8+i, relu)),
#        Parallel(vcat, p1=Dense(8+i, 8+i, relu), p2=Dense(8+i,8+i, relu), p3=Dense(8+i, 8+i, relu)),
#        Dense((8+i)*3, 10, sigmoid)
#        )
#    push!(modList, model)
#end

#for i in 0:1:50 #cannot calculate network cost for these at the moment
#    model = Chain(
#        RNN(55 => 10+i, relu),
#        Dense(10+i => 10, sigmoid)
#    )
#    push!(modList, model)
#end
    
preScores = zeros(length(modList))
postScores = zeros(length(modList))
startAcc = zeros(length(modList))
endAcc = zeros(length(modList))
c0List = zeros(length(modList))
c1List = zeros(length(modList))

for num in eachindex(modList)
    println("Running: ", num)
    try 
        model = modList[num]
        preScores[num] = calculateNetworkCost(model)
        c0List[num], c1List[num], startAcc[num], endAcc[num] = trainModelOnGrammar(datdir, file, model, 5, 500)
        postScores[num] = calculateNetworkCost(model)
    catch
        preScores[num] = 0
        c0List[num] = 0
        c1List[num] = 0
        startAcc[num] = 0
        endAcc[num] = 0
        postScores[num] = 0
    end

end

output = DataFrame(Model = modList, Prescore = preScores, PostScores = postScores, C0List = c0List, C1List = c1List, StartAcc = startAcc, EndAcc = endAcc)
CSV.write("C:/Users/kv301/OneDrive - University of Cambridge/Documents/PhD Year 2/Major Transitions Project/AGLProj/data/DeepAndParallelScorerOutput_id=42_n=5_conn=10_TE=2.1478990357047856.csv", output)

# v = collect(Iterators.flatten(Flux.params(model)))
# histogram(v)