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
    datdir = "../data/stringsNoLoops_5/"
    # files = shuffle(readdir(datdir))
    files = shuffle!(readdir(datdir))[1:3]
    println("Loaded")
end

@everywhere begin 
    modelList = []
    for i in 4:8
        for j in 1:4
            splits = Int.(sort([floor(i*(k+1)/j) - floor(i*k / j) for k in 1:j], rev=true))
            if (length(splits) == 1)
                model = Chain(
                    Dense(55, splits[1], relu),
                    Dense(splits[end], 10, sigmoid)
                )
            else
                model = Chain(
                    Dense(55, splits[1], relu),
                    [Dense(splits[i], splits[i+1], relu) for i in 1:(length(splits) - 1)]...,
                    Dense(splits[end], 10, sigmoid)
                )
            end
            push!(modelList, model)
        end
    end


    TElist = zeros(length(files))
    for num in eachindex(files)
        f = files[num]
        fcut = f[1:end-4]
        flist = split.(split(fcut, "_"), "=")
        flist = [[i[1], parse(Float64, i[2])] for i in flist]
        fDict = Dict(flist)
        TElist[num] = fDict["TE"][1]
    end
end

modelChange0 = SharedArray(zeros(length(modelList)))
modelChange1 = SharedArray(zeros(length(modelList)))
modelScores = SharedArray(zeros(length(modelList)))

@sync @distributed for i in eachindex(modelList)
    model = modelList[i]
    preScores = zeros(length(files))
    postScores = zeros(length(files))
    startAcc = zeros(length(files))
    endAcc = zeros(length(files))
    c0List = zeros(length(files))
    c1List = zeros(length(files))

    @showprogress for num in eachindex(files)
        f = files[num]
        fcut = f[1:end-4]
        flist = split.(split(fcut, "_"), "=")
        flist = [[i[1], parse(Float64, i[2])] for i in flist]
        fDict = Dict(flist)

        preScores[num] = calculateNetworkCost(model)
        c0List[num], c1List[num], startAcc[num], endAcc[num] = trainModelOnGrammar(datdir, f, model, 5, 200)
        postScores[num] = calculateNetworkCost(model)
        Flux.reset!(model)
    end

    modelChange0[i] = mean(c0List)
    modelChange1[i] = mean(c1List)
    modelScores[i] = mean(postScores)
end

modelStrings = [string(model) for model in modelList]

println("Making DF...")
changeDat = DataFrame(Dict("change0"=> modelChange0, "change1" => modelChange1 , "scores"=> modelScores, "id" => modelStrings))
println("Saving DF...")
CSV.write(string("../data/", "permuteModelData_2layer_3grammars.csv"), changeDat)

# normaliseScores(x) = (maximum(x) .- x)/(maximum(x) - minimum(x)) 
# normaliseScores(x, y) = (maximum(y) .- x)/(maximum(y) - minimum(y)) 

# df1 = CSV.read(string("../data/", "permuteModelData_1layer_3grammars.csv"), DataFrame)
# df2 = CSV.read(string("../data/", "permuteModelData_2layer_3grammars.csv"), DataFrame)

# plot([df1.change1.*normaliseScores(df1.scores, vcat(df1.scores, df2.scores)), df2.change1.*normaliseScores(df2.scores, vcat(df1.scores, df2.scores))])


