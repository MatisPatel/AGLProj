## Functions for pipeline
using Combinatorics, DataFrames, Flux, LinearAlgebra, Logging, Random, StatsBase

# 1. Build grammars

# Define some functions we will need 

# Grammar Entropy function - get the entropy of the grammar, as the largest absolute eigenvalue of the grammar transition matrix

function eigenvalueEntropy(eigenvalues)
    # Following Sun et al. (2021) https://doi.org/10.1371/journal.pone.0251993

    absolute_values = abs.(eigenvalues)
    sum_values = sum(abs.(eigenvalues))

    scaled_logged_values = (absolute_values./sum_values) .* log.(absolute_values./sum_values)

    entropy = -1 * (sum(scaled_logged_values))

    return entropy
end

function grammarEntropy(adjacencyMatrix, inDegreeLaplacian = nothing, signlessInDegreeLaplacian = nothing)
    
    if inDegreeLaplacian === nothing && inDegreeSignlessLaplacian === nothing
        topEntropy = abs(eigvals(adjacencyMatrix)[end])
        return topEntropy
    else 
        
        topEntropy = abs(eigvals(adjacencyMatrix)[end])

        adjMatrixEigenvalues = eigvals(adjacencyMatrix)
        adjMatrixRealEntropy = eigenvalueEntropy(real.(adjMatrixEigenvalues))
        adjMatrixImaginaryEntropy = eigenvalueEntropy(imag.(adjMatrixEigenvalues))
        adjMatrixModulusEntropy = eigenvalueEntropy(abs.(adjMatrixEigenvalues))

        inDegreeLaplacianEigenvalues = eigvals(inDegreeLaplacian)
        inDegreeLaplacianRealEntropy = eigenvalueEntropy(real.(inDegreeLaplacianEigenvalues))
        inDegreeLaplacianImaginaryEntropy = eigenvalueEntropy(imag.(inDegreeLaplacianEigenvalues))
        inDegreeLaplacianModulusEntropy = eigenvalueEntropy(abs.(inDegreeLaplacianEigenvalues))

        signlessInDegreeLaplacianEigenvalues = eigvals(signlessInDegreeLaplacian)
        signlessInDegreeLaplacianRealEntropy = eigenvalueEntropy(real.(signlessInDegreeLaplacianEigenvalues))
        signlessInDegreeLaplacianImaginaryEntropy = eigenvalueEntropy(imag.(signlessInDegreeLaplacianEigenvalues))
        signlessInDegreeLaplacianModulusEntropy = eigenvalueEntropy(abs.(signlessInDegreeLaplacianEigenvalues))

        return topEntropy, adjMatrixRealEntropy, adjMatrixImaginaryEntropy, adjMatrixModulusEntropy, inDegreeLaplacianRealEntropy, inDegreeLaplacianImaginaryEntropy, inDegreeLaplacianModulusEntropy, signlessInDegreeLaplacianRealEntropy, signlessInDegreeLaplacianImaginaryEntropy, signlessInDegreeLaplacianModulusEntropy

    end
end

# Checking Connectedness of grammar - check whether the grammar is connected.

function checkConnected(grammar)
    N = size(grammar)[1]
    gramN = grammar^N
    counts = sum(gramN .> 0, dims=2)
    return sum(counts .== N) > 0
end

# Check full transitions of grammar - check whether every state can be transitioned out of, no 0s on any rows

function checkTransitionsFull(grammar)
    # println("check trans")
    rowSums = sum(grammar, dims=2)
    fullTrans = prod(rowSums .!= 0)
    return fullTrans
end

# Generate fully connected, fully transitioned grammars with and without loops (loops = same state can be visited multiple times sequentially)

function genConnectedGrammar(N::Int, edges::Int, loops::Bool)
    done = false
    grammar = nothing

    if loops

        while !done
            grammar = reshape(shuffle(vcat(repeat([1], edges),
                    repeat([0], N^2 - edges))), N, N)
            if checkTransitionsFull(grammar)
                if checkConnected(grammar)
                    if sum(Diagonal(grammar)) >= 1 # added constraint so that it must have loops
                        done = true
                    end
                end
            end
        end

    else

        if edges > (N^2 - N)
            return "ERROR: Edges to large to construct with no loops"
        end

        if edges == N
            return "ERROR: To few edges to construct with no loops, or at least it will take too long..."
        end
        # [[j==i ? 0 : 1 for j in 1:N] for i in 1:N]
        while !done
            listEdges = shuffle(vcat(repeat([1], edges),
                    repeat([0], N^2-N - edges))) 
            grammar = vcat([[j==i ? 0 : pop!(listEdges) for j in 1:N] for i in 1:N])
            grammar = reduce(hcat, grammar)
            #println(sum(Diagonal(grammar)))
            if sum(Diagonal(grammar)) == 0
                if checkTransitionsFull(grammar)
                    if checkConnected(grammar) # added constraint so that it must not have loops
                        done = true
                    end
                end
            end
        end

    end

    outDegreeMatrix = diagm(vec(sum(grammar, dims=1))) #diagonal matrix with the 
    inDegreeMatrix = diagm(vec(sum(grammar, dims=2)))
    outDegreeLaplacian = outDegreeMatrix .- grammar
    inDegreeLaplacian = inDegreeMatrix .- grammar
    signlessInDegreeLaplacian = inDegreeMatrix .+ grammar # For Sun et al. (2021) entropy calcs
    return grammar, outDegreeMatrix, inDegreeMatrix, outDegreeLaplacian, inDegreeLaplacian, signlessInDegreeLaplacian
end

#################################################################################################################################
# 2. Make grammar strings

# String maker function

function makeString(alphabet, grammar, err_grammar, str_len, errors) # takes an alphabet, a grammar, an error_grammar which is a transformation of that grammar, the length of the strings you want to build, and the number of errors you want
    str_idxs = Vector{Int64}(undef, str_len) # make vector of undefined values
    alphSize = length(alphabet) # get length of alphabet
    str_idxs[1] = rand(1:alphSize) # assign first index to be a random letter in alphabet
    where_errors = nothing
    if (errors < str_len-1)
        where_errors = sample(2:str_len, errors, replace=false)
    else
        where_errors = 2:str_len
    end
    for n in 2:str_len 
        if n in where_errors
            next = sample(1:alphSize, Weights(err_grammar[str_idxs[n-1], :]))
            str_idxs[n] = next
        else 
            next = sample(1:alphSize, Weights(grammar[str_idxs[n-1], :]))
            str_idxs[n] = next
        end
    end 
    return join(alphabet[str_idxs]), str_idxs, where_errors
end

#################################################################################################################################
# 2.1 Make grammar strings from raised grammar

# String maker function
#genMoras(alphabet, k) = collect(with_replacement_combinations(alphabet, k))

function makeRaisedString(alphabet, grammar, err_grammar, n_raised, str_len, errors) # takes an alphabet, a grammar, an error_grammar which is a transformation of that grammar, the length of the strings you want to build, and the number of errors you want
    str_idxs = Vector{Int64}(undef, str_len) # make vector of undefined values
    moras = genMoras(alphabet, n_raised)
    moraSize = length(moras) # get length of alphabet
    str_idxs[1] = rand(1:moraSize) # assign first index to be a random letter in alphabet
    where_errors = nothing
    if (errors < str_len-1)
        where_errors = sample(2:str_len, errors, replace=false)
    else
        where_errors = 2:str_len
    end
    for n in 2:str_len 
        if n in where_errors
            next = sample(1:moraSize, Weights(err_grammar[str_idxs[n-1], :]))
            str_idxs[n] = next
        else 
            next = sample(1:moraSize, Weights(grammar[str_idxs[n-1], :]))
            str_idxs[n] = next
        end
    end 
    return str_idxs, where_errors
end
#makeString(alphabet, grammar, err_grammar, n_raised, str_len, errors)
##################################################################################################################################
# 3. Define models 

# Create models function

function createModel(numNeurons, numLayers, numLaminations, recurrence, inputPool, outputPool, numClasses, lengthStrings, lengthAlphabet)
    # Takes number of neurons, number of layers, number of splits in the hidden layers, number of classes (i.e., errors), length of strings, and length of alphabet 
    if numLayers == 1 && numLaminations > 1
        @warn "Number of laminations is greater than 1 but number of hidden layers is 1. This is just a single layer fully connected net. Returning false to avoid duplication."
        return false 
    end

    if numLaminations > 1 && inputPool && outputPool && numLayers < 4
        @warn "Number of laminations is greater than 1 with a pooling layer at both ends, but the number of hidden layers is less than 4. This is just a 1-3 layer fully connected net. Returning false to avoid duplication."
        return false
    end

    if numLaminations > 1 && (inputPool ⊻ outputPool) && numLayers < 3
        @warn "Number of laminations is greater than 1 with a pooling layer, but the number of hidden layers is less than 3. This is just a 1-2 layer fully connected net. Returning false to avoid duplication."
        return false
    end

    lam_splits = Int.(sort([floor(numNeurons*(k+1)/numLaminations) - 
                    floor(numNeurons*k / numLaminations) for k in 1:numLaminations], rev=true))
    for lam_neurons in lam_splits
        if lam_neurons < numLayers
            @warn "You have defined too many layers for the number of neurons some layers will have no neurons. Returning false to avoid this."
            return false
        end
    end
    layer_splits = []
    for lam_neurons in lam_splits
        splits = Int.(sort([floor(lam_neurons*(k+1)/numLayers) - floor(lam_neurons*k / numLayers) for k in 1:numLayers], rev=true))
        push!(layer_splits, splits)
    end
    branches = [] 
    for splits in layer_splits
        if (length(splits) == 1)
            branch = Chain(
                Dense(lengthStrings*lengthAlphabet, splits[1], relu),
                #Dense(splits[end], numClasses, sigmoid)
            )
        else
            if (!inputPool && !outputPool)
                if recurrence
                    branch = Chain(
                        RNN(lengthStrings*lengthAlphabet, splits[1], tanh),
                        [RNN(splits[i], splits[i+1], tanh) for i in 1:(length(splits) - 1)]...
                    )
                else
                    branch = Chain(
                        Dense(lengthStrings*lengthAlphabet, splits[1], relu),
                        [Dense(splits[i], splits[i+1], relu) for i in 1:(length(splits) - 1)]...
                    )
                end
            elseif (inputPool && !outputPool)
                if recurrence
                    branch = Chain([RNN(splits[i], splits[i+1], tanh) for i in 1:(length(splits) - 1)]...)
                else
                    branch = Chain([Dense(splits[i], splits[i+1], relu) for i in 1:(length(splits) - 1)]...)
                end
            elseif (!inputPool && outputPool)
                if recurrence
                    branch = Chain(
                        RNN(lengthStrings*lengthAlphabet, splits[1], tanh),
                        [RNN(splits[i], splits[i+1], tanh) for i in 1:(length(splits) - 2)]...
                    )
                else
                    branch = Chain(
                        Dense(lengthStrings*lengthAlphabet, splits[1], relu),
                        [Dense(splits[i], splits[i+1], relu) for i in 1:(length(splits) - 2)]...
                    )
                end
            elseif (inputPool && outputPool)
                if recurrence
                    branch = Chain([RNN(splits[i], splits[i+1], tanh) for i in 1:(length(splits) - 2)]...
                    )
                else
                    branch = Chain([Dense(splits[i], splits[i+1], relu) for i in 1:(length(splits) - 2)]...
                    )
                end
            else 
                error("Pooling failure...")
            end
        end
        push!(branches, branch)
    end

    if (!inputPool && !outputPool)
        model = Chain(
            Parallel(vcat, branches...),
            Dense(sum([splits[end] for splits in layer_splits]), numClasses, sigmoid)
            )
    elseif (inputPool && !outputPool)
        if recurrence
            model = Chain(
                RNN(lengthStrings*lengthAlphabet, sum([splits[1] for splits in layer_splits]), tanh),
                Parallel(vcat, branches...),
                Dense(sum([splits[end] for splits in layer_splits]), numClasses, sigmoid)
                )
        else
            model = Chain(
                Dense(lengthStrings*lengthAlphabet, sum([splits[1] for splits in layer_splits]), relu),
                Parallel(vcat, branches...),
                Dense(sum([splits[end] for splits in layer_splits]), numClasses, sigmoid)
                )
        end
    elseif (!inputPool && outputPool)
        if recurrence
            model = Chain(
                Parallel(vcat, branches...),
                RNN(sum([splits[end-1] for splits in layer_splits]), sum([splits[end] for splits in layer_splits]), tanh),
                Dense(sum([splits[end] for splits in layer_splits]), numClasses, sigmoid)
                )
        else
            model = Chain(
                Parallel(vcat, branches...),
                Dense(sum([splits[end-1] for splits in layer_splits]), sum([splits[end] for splits in layer_splits]), relu),
                Dense(sum([splits[end] for splits in layer_splits]), numClasses, sigmoid)
                )
        end
    else
        if recurrence
            model = Chain(
                RNN(lengthStrings*lengthAlphabet, sum([splits[1] for splits in layer_splits]), tanh),
                Parallel(vcat, branches...),
                RNN(sum([splits[end-1] for splits in layer_splits]), sum([splits[end] for splits in layer_splits]), tanh),
                Dense(sum([splits[end] for splits in layer_splits]), numClasses, sigmoid)
                )
        else
            model = Chain(
                Dense(lengthStrings*lengthAlphabet, sum([splits[1] for splits in layer_splits]), relu),
                Parallel(vcat, branches...),
                Dense(sum([splits[end-1] for splits in layer_splits]), sum([splits[end] for splits in layer_splits]), relu),
                Dense(sum([splits[end] for splits in layer_splits]), numClasses, sigmoid)
                )
        end
    end
    return model
end

###################################################################################################################################

# L2 Regularizer helper function
pen_l2(x::AbstractArray) = sum(abs2, x)/2

# train model function
function trainModelOnGrammar(grammarStrings, model, alphabetLength, n_epochs, modelID, recurrence, throttle = 0.0001, batch_size = 10, prop_tests = 0.3, opt = Momentum(0.01, 0.95))
    
    # determine size of output layer of network. 
    output_len = maximum(grammarStrings.error)::Int32

    # new col in grammarStrings, where errors are encoded as ordinal values [0,0] [1, 0] [1, 1]
    grammarStrings.encodedErrors = [vcat(ones( E), zeros( output_len-E)) for E in grammarStrings.error]

    # get train test split
    train_X, train_Y, test_X, test_Y = train_test_split(grammarStrings, prop_tests, alphabetLength)

    # batch up the training data
    train_dat = ([(cat(train_X[i]..., dims=2),  cat(train_Y[i]..., dims=1)') for i in Iterators.partition(1:length(train_X), batch_size)]) #::Vector{Tuple{Matrix{Float64}, LinearAlgebra.Adjoint{Float64, Matrix{Float64}}}}

    # make train/test columns for pretraining
    Train =  ["Train"]
    Test = ["Test"]
    grammarStrings.TrainOrTest = vcat(repeat(Train, length(train_X)), repeat(Test, length(strings[length(train_X)+1:end])))

    if recurrence
        Flux.reset!(model)
    end

    # test the model out on the strings we have, before we train the model
    probs_trainX = model(cat(train_X..., dims=2))
    # modout_trainX = model(cat(train_X..., dims=2)) .>= 0.5
    # categories_trainX = cumprod(modout_trainX, dims=1)
    # preds_trainX = sum(categories_trainX, dims=1)
    # acc_trainX = sum(categories_trainX, dims=1) .== [Bool(x[1]) for x in train_Y]

    if recurrence
        Flux.reset!(model)
    end

    probs_testX = model(cat(test_X..., dims=2))

    grammarStrings.initialProbs = Float32.(vec(hcat(probs_trainX, probs_testX)))

    if recurrence
        Flux.reset!(model)
    end

    model, acc_and_losses = training_loop(model, opt, train_dat, train_X, train_Y, test_X, test_Y, n_epochs)

    if recurrence
        Flux.reset!(model)
    end

    testmode!(model) #if there are dropout layers
    # test the model out on the strings we have, after we train the model
    probs_trainX = model(cat(train_X..., dims=2))
    
    if recurrence
        Flux.reset!(model)
    end

    probs_testX = model(cat(test_X..., dims=2))

    grammarStrings.trainedProbs = Float32.(vec(hcat(probs_trainX, probs_testX)))

    if recurrence
        Flux.reset!(model)
    end

    # make column of modelIDs

    grammarStrings.modelID = vcat(repeat([modelID], length(strings)))

    return grammarStrings, acc_and_losses
end


function brier_score(model, train_X, train_Y)
    preds = model(cat(train_X..., dims=2))
    outs = [Bool(x[1]) for x in train_Y]
    BS = 1/length(outs) * sum(sum(square.(preds - outs), dims=1), dims=2)
    return BS[1,1]
end

square(n) = n * n

function stop_early(prev_loss, current_loss, min_diff)
    diff = prev_loss - current_loss
    if diff < min_diff && diff >= 0
        return true
    else
        return false
    end
end

function training_loop(model, opt, train_dat, train_x, train_y, test_x, test_y, n_epochs, throttle = 0.00001, verbose = true)
    acc_losses = DataFrame(modelID = Int32[],
                           grammarID = Int32[], 
                           epoch = Int32[],
                           batch = Int32[],
                           loss = Float32[],
                           train_brier = Float32[],
                           test_brier = Float32[],
                           throttle = Float32[])
         
    opt_state = Flux.setup(opt, model)
    prev_loss = 100 #set it high so training runs for at least one epoch
    batch = 1
    for epoch in 1:n_epochs
        break_train = false
        for (x, y) in train_dat 
            curr_loss, gs = Flux.withgradient(m -> Flux.logitbinarycrossentropy(m(x), y), model)
            Flux.update!(opt_state, model, gs[1])
            dataframe = DataFrame(modelID = modelID,
                                  grammarID = grammarStrings.grammarID[1],
                                  epoch = epoch,
                                  batch = batch,
                                  loss = curr_loss,
                                  train_brier = brier_score(model, train_x, train_y),
                                  test_brier = brier_score(model, test_x, test_y),
                                  throttle = throttle)
            append!(acc_losses, dataframe)
            if stop_early(prev_loss, curr_loss, throttle)
                println("Stopped early as loss stopped changing")
                break_train = true  
                break
            end
            prev_loss = curr_loss
            batch += 1
        end
        if (mod(epoch, 10) == 1 || break_train) && verbose
            @info "After epoch = $epoch" dataframe.loss[end] dataframe.train_brier[end] dataframe.test_brier[end]
        end
        if break_train
            break
        end
    end

    return model, acc_losses
end


function train_test_split(grammar_strings, prop, alphabetLength)
    indx  = Int(floor(length(grammar_strings.string)*(1-prop)))

    alphabet = collect('a':'z')[1:Int(alphabetLength)]

    strings = [Float32.(vec(Flux.onehotbatch(S, alphabet, alphabet[1]))) for S in grammar_strings.string]

    # splitting the data ito train/test and strings and truth. 
    train_X = strings[1:indx]
    train_Y = grammar_strings.encodedErrors[1:indx]' 
    test_X = strings[indx+1:end]
    test_Y = grammar_strings.encodedErrors[indx+1:end]'

    return train_X, train_Y, test_X, test_Y
end


function database_connect(csv_name) 
    csv_location = projectdir("src", csv_name)
    if isfile(csv_location)
        database_connection = CSV.File(csv_location) |> DataFrame

        dbName = database_connection.Value[1]
        dbUsername = database_connection.Value[2]
        dbPassword = database_connection.Value[3]
        dbHostname = database_connection.Value[4]

        println("Opening DB Connection")
        con = DBInterface.connect(MySQL.Connection, 
                                  dbHostname,
                                  dbUsername, 
                                  dbPassword, 
                                  db = dbName) 

        return con
    else
        error("Database connection csv not found. Please add it to the src folder.")
    end
end