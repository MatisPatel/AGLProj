@everywhere begin
    using Flux 
    using Revise
    using ProgressMeter
    using SharedArrays
    using DataFrames
    using CSV
    include("DistributedCode.jl")
end 

@everywhere begin
    println("Loading Data...")
    datfolder = "loops=false_n=5_length=11_classes=1"
    datdir = "data"
    datPath = joinpath("..", datdir, datfolder)
    # files = shuffle(readdir(datdir))
    files = shuffle!(readdir(datPath))[1:20]
    println("Loaded")
    # extract spec from folder name 
    folderDict = Dict(split.(split(datfolder, "_"), "="))
    lengthStrings = parse(Int, folderDict["length"])
    lengthAlphabet = parse(Int, folderDict["n"])
    numClasses = parse(Int, folderDict["classes"])
    isLooped = parse(Bool, folderDict["loops"])
end

@everywhere begin 
    modelList = []
    for numNeurons in 4:100
        for numLayers in 1:4
            model = createModel(numNeurons, numLayers, numClasses, lengthStrings, lengthAlphabet )
            push!(modelList, (model, numNeurons, numLayers))
        end
    end
    # TElist = zeros(length(files))
    # for num in eachindex(files)
    #     f = files[num]
    #     fcut = f[1:end-4]
    #     flist = split.(split(fcut, "_"), "=")
    #     flist = [[i[1], parse(Float64, i[2])] for i in flist]
    #     fDict = Dict(flist)
    #     TElist[num] = fDict["TE"][1]
    # end
end

modelChange0 = SharedArray(zeros(length(modelList)))
modelChange1 = SharedArray(zeros(length(modelList)))
modelScores = SharedArray(zeros(length(modelList)))
numberNeurons = SharedArray(zeros(length(modelList)))
numberLayers = SharedArray(zeros(length(modelList)))

@sync @distributed for i in eachindex(modelList)
    model, numNeurons, numLayers = modelList[i]
    preScores = zeros(length(files))
    postScores = zeros(length(files))
    startAcc = zeros(length(files))
    endAcc = zeros(length(files))
    c0List = zeros(length(files))
    c1List = zeros(length(files))

    println("Training model with ", numNeurons , " neurons and ", numLayers, " layers")
    @showprogress for num in eachindex(files)
        f = files[num]
        fcut = f[1:end-4]
        flist = split.(split(fcut, "_"), "=")
        flist = [[i[1], parse(Float64, i[2])] for i in flist]
        fDict = Dict(flist)

        preScores[num] = calculateNetworkCost(model)
        filePath = joinpath(datPath, f)
        c0List[num], c1List[num], startAcc[num], endAcc[num] = trainModelOnGrammar(filePath, model, lengthAlphabet, 200)
        postScores[num] = calculateNetworkCost(model)
        Flux.reset!(model)
    end

    modelChange0[i] = mean(c0List)
    modelChange1[i] = mean(c1List)
    modelScores[i] = mean(postScores)
    numberNeurons[i] = numNeurons
    numberLayers[i] = numLayers
end

modelStrings = [string(model[1]) for model in modelList]

println("Making DF...")
changeDat = DataFrame(Dict("change0"=> modelChange0, "change1" => modelChange1 , "scores"=> modelScores, "id" => modelStrings, "neurons" => numberNeurons, "layers" => numberLayers))
println("Saving DF...")
CSV.write(string("../data/", "permuteNeuronsAndLayers_10grammars_2classes_noLoops.csv"), changeDat) 

# normaliseScores(x) = (maximum(x) .- x)/(maximum(x) - minimum(x)) 
# normaliseScores(x, y) = (maximum(y) .- x)/(maximum(y) - minimum(y)) 

# df1 = CSV.read(string("../data/", "permuteModelData_1layer_3grammars.csv"), DataFrame)
# df2 = CSV.read(string("../data/", "permuteModelData_2layer_3grammars.csv"), DataFrame)

# plot([df1.change1.*normaliseScores(df1.scores, vcat(df1.scores, df2.scores)), df2.change1.*normaliseScores(df2.scores, vcat(df1.scores, df2.scores))])


