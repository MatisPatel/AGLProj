## Functions to export
using Combinatorics, DataFrames, IterTools, LinearAlgebra, Lux, MLUtils, OneHotArrays, Random, StatsBase, Zygote

#==================================================================================#
# Build models

# Ref: https://jldc.ch/post/seq2one-flux/; https://lux.csail.mit.edu/stable/tutorials/beginner/3_SimpleRNN#Creating-a-Classifier
struct RNNCellClassifier{R, D} <: Lux.AbstractLuxContainerLayer{(:recurrent, :dense)}
    recurrent::R
    dense::D
end

function (s::RNNCellClassifier)(x::AbstractArray{T, 3}, ps::NamedTuple, st::NamedTuple) where {T}
    y, st_rec = s.recurrent(x, ps.recurrent, st.recurrent)
    y, st_dense = s.dense(y, ps.dense, st.dense) # apply the dense layer to the output
    st = merge(st, (dense=st_dense, recurrent=st_rec))
    return vec(y), st
end

# Union Type for models defined here
AGLModel = Union{RNNCellClassifier,Chain}

# Build models function
function build_model(num_neurons, num_layers, num_laminations, recurrence, gru, input_pool, output_pool, num_classes, length_strings, length_alphabet, reservoir, reservoir_scaling, verbose=false)
    # Takes number of neurons, number of layers, number of splits in the hidden layers, number of classes (i.e., errors), length of strings, and length of alphabet 
    @assert (num_laminations >= 1) "Number of laminations must be greater than or equal to 1 (single lamination is just a densely connected network)."

    if gru && !recurrence
        if verbose
            @warn "GRU has been requested but recurrence is false. GRU can only be used with recurrence. Returning false."
        end
        return false
    end
    
    if reservoir
        num_layers = num_layers - 1
    end

    if num_layers < 1
        if verbose
            @warn "You need at least one layer. If you have a reservoir, you need at least two layers. Returning false."
        end
        return false
    end

    if num_layers == 1 && num_laminations > 1
        if verbose
            @warn "Number of laminations is greater than 1 but number of hidden layers is 1. This is just a single layer fully connected net. Returning false to avoid duplication."
        end
        return false 
    end

    if num_laminations > 1 && input_pool && output_pool && num_layers < 4
        if verbose
            @warn "Number of laminations is greater than 1 with a pooling layer at both ends, but the number of hidden layers is less than 4. This is just a 1-3 layer fully connected net. Returning false to avoid duplication."
        end
        return false
    end

    if num_laminations > 1 && (input_pool ⊻ output_pool) && num_layers < 3
        if verbose
            @warn "Number of laminations is greater than 1 with a pooling layer, but the number of hidden layers is less than 3. This is just a 1-2 layer fully connected net. Returning false to avoid duplication."
        end
        return false
    end

    if num_laminations == 1 && (input_pool || output_pool)
        if verbose
            @warn "Number of laminations is 1 but an input and/or an output pooling layer has been requested. Without laminations, these poolings don't make sense. Returning false to avoid duplication."
        end
        return false
    end

    if num_layers == 1 && recurrence
        if verbose
            @warn "Single layer recurrent network is not possible. Returning false to avoid duplication."
        end
        return false
    end

    lam_splits = Int.(sort([floor(num_neurons*(k+1)/num_laminations) - 
                    floor(num_neurons*k / num_laminations) for k in 1:num_laminations], rev=true))
    for lam_neurons in lam_splits
        if lam_neurons < num_layers
            if verbose
                @warn "You have defined too many layers for the number of neurons some layers will have no neurons. Returning false to avoid this."
            end
            return false
        end
    end
    layer_splits = []
    for lam_neurons in lam_splits
        splits = Int.(sort([floor(lam_neurons*(k+1)/num_layers) - floor(lam_neurons*k / num_layers) for k in 1:num_layers], rev=true))
        push!(layer_splits, splits)
    end
    branches = [] 

    if reservoir
        if recurrence
            input_dims = length_alphabet * reservoir_scaling
        else
            input_dims = length_strings*length_alphabet * reservoir_scaling
        end
    else
        if recurrence
            input_dims = length_alphabet
        else
            input_dims = length_strings*length_alphabet
        end
    end

    for splits in layer_splits
        if (length(splits) == 1)
            branch = Chain(
                Dense(input_dims, splits[1], relu),
            )
        else
            if (!input_pool && !output_pool)
                if recurrence
                    if gru
                        branch = Chain(
                            Recurrence(GRUCell(input_dims => splits[1]), return_sequence=true),
                            [Recurrence(GRUCell(splits[i] => splits[i+1]), return_sequence=true) for i in 1:(length(splits) - 2)]...,
                            Recurrence(GRUCell(splits[end-1] => splits[end]), return_sequence=false)
                        )
                    else
                        branch = Chain(
                            Recurrence(RNNCell(input_dims => splits[1], relu), return_sequence=true),
                            [Recurrence(RNNCell(splits[i] => splits[i+1], relu), return_sequence=true) for i in 1:(length(splits) - 2)]...,
                            Recurrence(RNNCell(splits[end-1] => splits[end], relu), return_sequence=false)
                        )
                    end
                else
                    branch = Chain(
                        Dense(input_dims => splits[1], relu),
                        [Dense(splits[i] => splits[i+1], relu) for i in 1:(length(splits) - 2)]...,
                        Dense(splits[end-1] => splits[end], relu)
                    )
                end
            elseif (input_pool && !output_pool)
                if recurrence
                    if gru
                        branch = Chain(Recurrence(GRUCell(sum(([splits[1] for splits in layer_splits])) => splits[2]), return_sequence=true),
                            [Recurrence(GRUCell(splits[i] => splits[i+1]), return_sequence=true) for i in 2:(length(splits) - 2)]...,
                            Recurrence(GRUCell(splits[end-1] => splits[end]), return_sequence=false)
                            )
                    else
                        branch = Chain(Recurrence(RNNCell(sum([splits[1] for splits in layer_splits]) => splits[2], relu), return_sequence=true),
                            [Recurrence(RNNCell(splits[i] => splits[i+1], relu), return_sequence=true) for i in 2:(length(splits) - 2)]...,
                            Recurrence(RNNCell(splits[end-1] => splits[end], relu), return_sequence=false)
                            )
                    end
                else
                    branch = Chain(Dense(sum([splits[1] for splits in layer_splits]) => splits[2], relu),
                                [Dense(splits[i] => splits[i+1], relu) for i in 2:(length(splits) - 2)]...,
                                Dense(splits[end-1] => splits[end], relu)
                                )
                end
            elseif (!input_pool && output_pool)
                if recurrence
                    if gru
                        branch = Chain(
                            Recurrence(GRUCell(input_dims => splits[1]), return_sequence=true),
                            [Recurrence(GRUCell(splits[i] => splits[i+1]), return_sequence=true) for i in 1:(length(splits) - 3)]...,
                            Recurrence(GRUCell(splits[end-2] => splits[end-1]), return_sequence=true)
                        )
                    else
                        branch = Chain(
                            Recurrence(RNNCell(input_dims => splits[1], relu), return_sequence=true),
                            [Recurrence(RNNCell(splits[i] => splits[i+1], relu), return_sequence=true) for i in 1:(length(splits) - 3)]...,
                            Recurrence(RNNCell(splits[end-2] => splits[end-1], relu), return_sequence=true)
                        )
                    end
                else
                    branch = Chain(
                        Dense(input_dims => splits[1], relu),
                        [Dense(splits[i] => splits[i+1], relu) for i in 1:(length(splits) - 3)]...,
                        Dense(splits[end-2] => splits[(length(splits) - 1)], relu)
                    )
                end
            elseif (input_pool && output_pool)
                if recurrence
                    if gru
                        branch = Chain(Recurrence(GRUCell(sum([splits[1] for splits in layer_splits]) => splits[2]), return_sequence=true),
                            [Recurrence(GRUCell(splits[i] => splits[i+1]), return_sequence=true) for i in 2:(length(splits)-3)]...,
                            Recurrence(GRUCell(splits[end-2] => splits[end-1]), return_sequence=true)
                        )
                    else
                        branch = Chain(Recurrence(RNNCell(sum([splits[1] for splits in layer_splits]) => splits[2], relu), return_sequence=true),
                            [Recurrence(RNNCell(splits[i] => splits[i+1], relu), return_sequence=true) for i in 2:(length(splits)-3)]...,
                            Recurrence(RNNCell(splits[end-2] => splits[end-1], relu), return_sequence=true)
                        )
                    end
                else
                    branch = Chain(Dense(sum([splits[1] for splits in layer_splits]) => splits[2], relu),
                        [Dense(splits[i] => splits[i+1], relu) for i in 2:(length(splits)-3)]...,
                        Dense(splits[end-2] => splits[end-1], relu)
                    )
                end
            else 
                error("Pooling failure...")
            end
        end
        push!(branches, branch)
    end

    if (!input_pool && !output_pool)
        if reservoir
            if recurrence
                if gru
                    model = RNNCellClassifier(
                        Chain(Lux.Experimental.freeze(Recurrence(GRUCell(length_alphabet => input_dims), return_sequence=true)), 
                        Parallel(vcat, branches...)),
                        Dense(sum([splits[end] for splits in layer_splits]) => num_classes, sigmoid)
                    )
                else
                    model = RNNCellClassifier(
                        Chain(Lux.Experimental.freeze(Recurrence(RNNCell(length_alphabet => input_dims, relu), return_sequence=true)), 
                        Parallel(vcat, branches...)),
                        Dense(sum([splits[end] for splits in layer_splits]) => num_classes, sigmoid)
                    )
                end
            else
                model = Chain(
                    Lux.Experimental.freeze(Dense(length_strings*length_alphabet, input_dims, relu)),
                    Parallel(vcat, branches...),
                    Dense(sum([splits[end] for splits in layer_splits]) => num_classes, sigmoid)
                    )
            end
        else
            if recurrence
                model = RNNCellClassifier(
                    Parallel(vcat, branches...),
                    Dense(sum([splits[end] for splits in layer_splits]) => num_classes, sigmoid)
                )
            else
                model = Chain(
                    Parallel(vcat, branches...),
                    Dense(sum([splits[end] for splits in layer_splits]) => num_classes, sigmoid)
                    )
            end
        end
    elseif (input_pool && !output_pool)
        if reservoir
            if recurrence
                if gru
                    model = RNNCellClassifier(
                        Chain(Lux.Experimental.freeze(
                            Recurrence(GRUCell(length_alphabet => input_dims), return_sequence=true)), 
                            Recurrence(GRUCell(input_dims => sum([splits[1] for splits in layer_splits])), return_sequence=true), Parallel(vcat, branches...)),
                        Dense(sum([splits[end] for splits in layer_splits]) => num_classes, sigmoid)
                        )
                else
                    model = RNNCellClassifier(
                        Chain(Lux.Experimental.freeze(
                            Recurrence(RNNCell(length_alphabet => input_dims, relu), return_sequence=true)), 
                            Recurrence(RNNCell(input_dims => sum([splits[1] for splits in layer_splits]), relu), return_sequence=true), Parallel(vcat, branches...)),
                        Dense(sum([splits[end] for splits in layer_splits]) => num_classes, sigmoid)
                        )
                end
            else
                model = Chain(
                    Lux.Experimental.freeze(Dense(length_strings*length_alphabet, input_dims, relu)),
                    Dense(input_dims => sum([splits[1] for splits in layer_splits]), relu),
                    Parallel(vcat, branches...),
                    Dense(sum([splits[end] for splits in layer_splits]) => num_classes, sigmoid)
                    )
            end
        else
            if recurrence
                if gru
                    model = RNNCellClassifier(
                        Chain(Recurrence(GRUCell(length_alphabet => sum([splits[1] for splits in layer_splits])), return_sequence=true), Parallel(vcat, branches...)),
                        Dense(sum([splits[end] for splits in layer_splits]) => num_classes, sigmoid)
                        )
                else
                    model = RNNCellClassifier(
                        Chain(Recurrence(RNNCell(length_alphabet => sum([splits[1] for splits in layer_splits]), relu), return_sequence=true), Parallel(vcat, branches...)),
                        Dense(sum([splits[end] for splits in layer_splits]) => num_classes, sigmoid)
                        )
                end
            else
                model = Chain(
                    Dense(length_strings*length_alphabet => sum([splits[1] for splits in layer_splits]), relu),
                    Parallel(vcat, branches...),
                    Dense(sum([splits[end] for splits in layer_splits]) => num_classes, sigmoid)
                    )
            end
        end
    elseif (!input_pool && output_pool)
        if reservoir
            if recurrence
                if gru
                    model = RNNCellClassifier(
                        Chain(Lux.Experimental.freeze(
                            Recurrence(GRUCell(length_alphabet => input_dims), return_sequence=true)), 
                        Parallel(vcat, branches...), 
                        Recurrence(GRUCell(sum([splits[end-1] for splits in layer_splits]) => sum([splits[end] for splits in layer_splits])), return_sequence=false)),
                        Dense(sum([splits[end] for splits in layer_splits]) => num_classes, sigmoid)
                        )
                else
                    model = RNNCellClassifier(
                        Chain(Lux.Experimental.freeze(
                            Recurrence(RNNCell(length_alphabet => input_dims, relu), return_sequence=true)), 
                        Parallel(vcat, branches...), 
                        Recurrence(RNNCell(sum([splits[end-1] for splits in layer_splits]) => sum([splits[end] for splits in layer_splits]), relu), return_sequence=false)),
                        Dense(sum([splits[end] for splits in layer_splits]) => num_classes, sigmoid)
                        )
                end
            else
                model = Chain(
                    Lux.Experimental.freeze(Dense(length_strings*length_alphabet => input_dims, relu)),
                    Parallel(vcat, branches...),
                    Dense(sum([splits[end-1] for splits in layer_splits]) => sum([splits[end] for splits in layer_splits]), relu),
                    Dense(sum([splits[end] for splits in layer_splits]) => num_classes, sigmoid)
                    )
            end
        else
            if recurrence
                if gru
                    model = RNNCellClassifier(
                        Chain(Parallel(vcat, branches...), 
                        Recurrence(GRUCell(sum([splits[end-1] for splits in layer_splits]) => sum([splits[end] for splits in layer_splits])), return_sequence=false)),
                        Dense(sum([splits[end] for splits in layer_splits]) => num_classes, sigmoid)
                        )
                else
                    model = RNNCellClassifier(
                        Chain(Parallel(vcat, branches...), 
                        Recurrence(RNNCell(sum([splits[end-1] for splits in layer_splits]) => sum([splits[end] for splits in layer_splits]), relu), return_sequence=false)),
                        Dense(sum([splits[end] for splits in layer_splits]) => num_classes, sigmoid)
                        )
                end
            else
                model = Chain(
                    Parallel(vcat, branches...),
                    Dense(sum([splits[end-1] for splits in layer_splits]) => sum([splits[end] for splits in layer_splits]), relu),
                    Dense(sum([splits[end] for splits in layer_splits]) => num_classes, sigmoid)
                    )
            end
        end
    else
        if reservoir
            if recurrence
                if gru
                    model = RNNCellClassifier(
                        Chain(Lux.Experimental.freeze(GRUCell(length_alphabet => input_dims)),
                        Recurrence(GRUCell(input_dims => sum([splits[1] for splits in layer_splits])), return_sequence=true),
                        Parallel(vcat, branches...),
                        Recurrence(GRUCell(sum([splits[end-1] for splits in layer_splits]) => sum([splits[end] for splits in layer_splits])), return_sequence=false),
                        ),
                        Dense(sum([splits[end] for splits in layer_splits]) => num_classes, sigmoid)
                    )
                else
                    model = RNNCellClassifier(
                        Chain(Lux.Experimental.freeze(RNNCell(length_alphabet => input_dims, relu)),
                        Recurrence(RNNCell(input_dims => sum([splits[1] for splits in layer_splits]), relu), return_sequence=true),
                        Parallel(vcat, branches...),
                        Recurrence(RNNCell(sum([splits[end-1] for splits in layer_splits]) => sum([splits[end] for splits in layer_splits]), relu), return_sequence=false),
                        ),
                        Dense(sum([splits[end] for splits in layer_splits]) => num_classes, sigmoid)
                    )
                end
            else
                model = Chain(
                    Lux.Experimental.freeze(Dense(length_strings*length_alphabet => input_dims, relu)),
                    Dense(input_dims => sum([splits[1] for splits in layer_splits]), relu),
                    Parallel(vcat, branches...),
                    Dense(sum([splits[end-1] for splits in layer_splits]) => sum([splits[end] for splits in layer_splits]), relu),
                    Dense(sum([splits[end] for splits in layer_splits]) => num_classes, sigmoid)
                    )
            end
        else
            if recurrence
                if gru
                    model = RNNCellClassifier(
                        Chain(Recurrence(GRUCell(length_alphabet => sum([splits[1] for splits in layer_splits])), return_sequence=true),
                        Parallel(vcat, branches...),
                        Recurrence(GRUCell(sum([splits[end-1] for splits in layer_splits]) => sum([splits[end] for splits in layer_splits])), return_sequence=false)
                        ),
                        Dense(sum([splits[end] for splits in layer_splits]) => num_classes, sigmoid)
                    )
                else
                    model = RNNCellClassifier(
                        Chain(Recurrence(RNNCell(length_alphabet => sum([splits[1] for splits in layer_splits]), relu), return_sequence=true),
                        Parallel(vcat, branches...),
                        Recurrence(RNNCell(sum([splits[end-1] for splits in layer_splits]) => sum([splits[end] for splits in layer_splits]), relu), return_sequence=false)
                        ),
                        Dense(sum([splits[end] for splits in layer_splits]) => num_classes, sigmoid)
                    )
                end
            else
                model = Chain(
                    Dense(length_strings*length_alphabet => sum([splits[1] for splits in layer_splits]), relu),
                    Parallel(vcat, branches...),
                    Dense(sum([splits[end-1] for splits in layer_splits]) => sum([splits[end] for splits in layer_splits]), relu),
                    Dense(sum([splits[end] for splits in layer_splits]) => num_classes, sigmoid)
                    )
            end
        end
    end
    return model
end

#==================================================================================#
# 4. Model training functions

# Train-test splitter
function train_test_split(training_data::DataFrame, prop::Float32, 
    alphabet_length::Int, string_length::Int, rec::Bool)::Tuple{AbstractArray, AbstractArray, AbstractArray, AbstractArray}

    alphabet = collect('a':'z')[1:Int(alphabet_length)]

    split_strings = [collect(s) for s in training_data.string]
    flattened_strings = vcat(split_strings...)
    encodings = Float32.(vec(onehotbatch(flattened_strings, String(alphabet)))) # cast types to avoid promotion

    if rec
        encodings_matrix = reshape(encodings, length(alphabet), string_length, :)
        labels = Float32.(training_data.error) # cast types to avoid promotion
    else
        encodings_matrix = reshape(encodings, length(alphabet)*string_length, :)
        labels = Float32.(training_data.error') # cast types to avoid promotion; transpose for the FF nets
    end

    (train_x, train_y), (test_x, test_y) = splitobs((encodings_matrix, labels); at=1-prop, shuffle=false)

    return train_x, train_y, test_x, test_y
end

const lbcelossfn = BinaryCrossEntropyLoss(; logits=Val(true));

function accuracy(y_pred::AbstractArray, y_true::AbstractArray)::Int
    return sum((y_pred .> 0.5f0) .== y_true)
end

function validate(model::AGLModel, tx::AbstractArray, train_state::Lux.Training.TrainState)::Vector
    predictions = []
    st_ = Lux.testmode(train_state.states)
    predictions, st_ = model(tx, train_state.parameters, st_)
    return vec(predictions)
end

# Define Brier Score function brier_score(preds, outs)
function brier_score(preds::AbstractArray, outs::AbstractArray)::Float32
    outs = vec(outs)
    @assert length(preds) == length(outs) "Preds and outs must be equal in length"
    n = length(preds)
    BS = 1/n * sum(sum(square.(preds .- outs), dims=1), dims=2)
    return Float32(BS[1,1])
end

function train_model(model::AGLModel, opt::Optimisers.AbstractRule, 
    train_x::AbstractArray, train_y::AbstractArray, test_x::AbstractArray, test_y::AbstractArray; 
    n_epochs::Int, batch_size::Int, seed::Int)::Dict

    # Setup model
    rng = Xoshiro(seed)
    ps, st = Lux.setup(rng, model)

    train_state = Training.TrainState(model, ps, st, opt)

    pretrain_probs_train = validate(model, train_x, train_state)
    pretrain_probs_test = validate(model, test_x, train_state)

    training_losses = [0.0f0]
    training_briers_train = [brier_score(pretrain_probs_train, train_y)]
    training_briers_test = [brier_score(pretrain_probs_test, test_y)]
    batches, epochs = [0], [0]

    training_loader = DataLoader(collect.((train_x, train_y)); batchsize=batch_size, shuffle=true)
    for e in 1:n_epochs
        # Train the model
        train_loss = nothing
        posttrain_probs_test = nothing
        batch = 0
        for (x, y) in training_loader
            (_, train_loss, _, train_state) = Training.single_train_step!(AutoZygote(), lbcelossfn, (x, y), train_state)
            push!(training_losses, Float32(train_loss))
            # Validate the model after each batch
            posttrain_probs_train = validate(model, train_x, train_state)
            posttrain_probs_test = validate(model, test_x, train_state)
            push!(training_briers_train, brier_score(posttrain_probs_train, train_y))
            push!(training_briers_test, brier_score(posttrain_probs_test, test_y))
            push!(epochs, e)
            batch += 1
            push!(batches, batch)
        end
        test_accuracy = accuracy(posttrain_probs_test, test_y)
        if test_accuracy == 1.0
            break
        end
    end
    pretrain_probs = vcat(pretrain_probs_train, pretrain_probs_test)
    posttrain_probs = vcat(validate(model, train_x, train_state), 
                            validate(model, test_x, train_state))

    output_dict = Dict(
        "losses" => training_losses,
        "briers_train" => training_briers_train,
        "briers_test" => training_briers_test,
        "pretrain_probs" => pretrain_probs,
        "posttrain_probs" => posttrain_probs,
        "batches" => batches,
        "epochs" => epochs
    )
    return output_dict
end

function train_and_store(model::AGLModel, opt::Optimisers.AbstractRule, training_data::DataFrame, prop_test::Float32, alphabet_length::Int;
    n_epochs::Int, batch_size::Int, seed::Int)::Tuple{DataFrame, DataFrame}
        
    train_x, train_y, test_x, test_y = train_test_split(training_data, prop_test, alphabet_length, 
                                                        string_length, isa(model, RNNCellClassifier))

    try
        outputs = train_model(model, opt, train_x, train_y, test_x, test_y; 
                            n_epochs=n_epochs, batch_size=batch_size, seed=seed)
        out_data = copy(training_data)
        out_data.pretrainprobs = outputs["pretrain_probs"]
        out_data.posttrainprobs = outputs["posttrain_probs"]
        train_str, test_str =  ["Train"], ["Test"]
        out_data.trainteststring = vcat(repeat(train_str, size(train_x)[end]), repeat(test_str, size(test_x)[end]))
        select!(out_data, Not([:string, :stringlength, :stringnumberencoding]))

        acc_losses = DataFrame(epoch = outputs["epochs"],
                                batch = outputs["batches"],
                                loss = outputs["losses"],
                                train_brier = outputs["briers_train"],
                                test_brier = outputs["briers_test"])

        return out_data, acc_losses
    catch
        return nothing, nothing
    end
end

#==================================================================================#