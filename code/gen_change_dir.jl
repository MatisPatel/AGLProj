using Distributed
@everywhere include("DistributedCode.jl")

listID = SharedArray(zeros(length(files)))
listTE = SharedArray(zeros(length(files)))
listCN = SharedArray(zeros(length(files)))
listC0 = SharedArray(zeros(length(files)))
listC1 = SharedArray(zeros(length(files)))

println("Running training...")
@sync @distributed for i in 1:length(files)
    f = files[i]
    println(f)
    fcut = f[1:end-4]
    flist = split.(split(fcut, "_"), "=")
    flist = [[i[1], parse(Float64, i[2])] for i in flist]
    fDict = Dict(flist)

    (c0, c1) = learnGrammar(f, datdir, 6, 250)
    listC0[i] = c0
    listC1[i] = c1
    listTE[i] = fDict["TE"][1]
    listID[i] = fDict["id"]
    listCN[i] = fDict["conn"]
end

println("Making DF...")
changeDat = DataFrame(Dict("change0"=> listC0, "change1" => listC1 , "TE" => listTE, "id" => listID))
println("Saving DF...")
CSV.write(string("../data/", "change_3.csv"), changeDat)

println("Done")