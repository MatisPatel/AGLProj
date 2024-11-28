############################################# Full pipeline for grammars ########################################################
# Author: M. Patel, K. Voudouris
# Project Title: AGLProj
# Julia Version: 1.8.2
# MySQL version: 8.0.31
#################################################################################################################################

# Script Outline
# 0. Load packages & setup DB connection & define parameters
# 1. We define the models from what is in the database.
# 2. We train the models in parallel and then pass the results to the database serially. 

#################################################################################################################################
# 0. Preamble

using Distributed
n_procs = 10
addprocs(n_procs-1)

@everywhere begin
    using DrWatson
    quickactivate(".", "AGLProj")
    using Combinatorics, DataFrames, Flux, LinearAlgebra, Logging, Random, StatsBase, CSV, MySQL
    include(srcdir("utils.jl"))
    
    # Import settings
    settings = load_yaml("settings.yaml")

    # Load parameters from YAML
    load_parameters(settings, "grammar_parameters")
    load_parameters(settings, "string_parameters")
    load_parameters(settings, "model_parameters")
end

# Initialise database
initialise_db("settings.yaml")

# Connect to database
con = database_connect(settings["db_credentials_secret"]["path"])

# Load grammars
grammars_from_db = DBInterface.execute(con, "SELECT * FROM $(settings["tables"]["grammars"]["name"]);") |> DataFrame

# Load models
model_table = DBInterface.execute(con, "SELECT * FROM $(settings["tables"]["models"]["name"]);") |> DataFrame

#######################
## SCRIPT PARAMETERS ##
#######################

@everywhere begin
    Random.seed!(2022)

    # Training parameters
    n_epochs = 500
    throttle = 0.000001
    batch_size = 10
    prop_tests = 0.3
    opt = Momentum(0.01, 0.95)

    # Print messages
    verbose = true
end

#############################################################################################################

## Build models

model_list = []
for row in 1:nrow(model_table) # quicker to do on one worker
    if !Bool(model_table.run[row])
        if verbose && row % 1000 == 0
            println("Model ID: ", model_table.modelid[row], " loaded.")
        end
        model_chain = build_model(model_table.neurons[row],
                                model_table.layers[row],
                                model_table.laminations[row],
                                Bool(model_table.recurrence[row]),
                                Bool(model_table.inpool[row]),
                                Bool(model_table.outpool[row]),
                                num_errors, string_length, alphabet_length,
                                Bool(model_table.reservoir[row]), reservoir_scaling_factor)
        
        push!(model_list, (model_chain, model_table.modelid[row], Bool(model_table.recurrence[row]), Bool(model_table.reservoir[row])))
    end
end

### Train

output_col_names = [x[1] for x in settings["tables"]["modeloutputs"]["columns"][2:end]]
acc_col_names = [x[1] for x in settings["tables"]["accuracieslosses"]["columns"][1:end]]

for gn in 1:nrow(grammars_from_db)
    if length(model_list) > 0
        grammar_query = string("SELECT * FROM strings WHERE grammarid = $(grammars_from_db.grammarid[gn]) AND stringlength = $(string_length);") 
        training_data = DBInterface.execute(con, grammar_query) |> DataFrame # get the strings for the ith grammar
        
        for models in collect(Iterators.partition(model_list, n_procs*3)) # batch up the models 
            results = @distributed (vcat) for m in models
                model = m[1]
                modelID = m[2]
                recurrence = m[3]
                reservoir = m[4]
                Flux.reset!(model)
                try
                    nextOutput, nextAccLoss = train_model(training_data, model, alphabet_length, string_length, n_epochs, modelID, 
                                                                recurrence, reservoir, throttle, batch_size, prop_tests, opt, false)
                    (nextOutput, nextAccLoss)
                catch
                    nothing
                end
            end

            output_list = [x[1] for x in results if !isnothing(x)]
            acc_loss_list = [x[2] for x in results if !isnothing(x)]
            model_outputs = vcat(output_list...)
            unique!(model_outputs)
            model_accuracies = vcat(acc_loss_list...)

            


            if nrow(model_accuracies) > 0
                for row in 1:nrow(model_accuracies)
                    value_list = vcat(model_accuracies.modelID[row], model_accuracies.grammarid[row], model_accuracies.epoch[row],
                                    model_accuracies.batch[row], model_accuracies.loss[row], model_accuracies.train_brier[row], model_accuracies.test_brier[row],
                                    model_accuracies.throttle[row])
                    query = build_insert_query(settings["tables"]["accuracieslosses"]["name"], acc_col_names, value_list)
                    DBInterface.execute(con, query) # push to DB
                end
            end

            if nrow(model_outputs) > 0
                for row in 1:nrow(model_outputs)
                    value_list = vcat(model_outputs.grammarid[row], model_outputs.stringid[row], model_outputs.modelID[row], 
                                      "\"$(model_outputs.TrainOrTest[row])\"", model_outputs.initialProbs[row], model_outputs.trainedProbs[row], 
                                      model_outputs.epochs[row])
                    query = build_insert_query(settings["tables"]["modeloutputs"]["name"], output_col_names, value_list)
                    DBInterface.execute(con, query) # push to DB 
                end
            end
            for id in unique(model_outputs.modelID)
                query = "UPDATE $(settings["tables"]["models"]["name"]) SET $(settings["tables"]["models"]["columns"][end][1]) = TRUE \
                        WHERE $(settings["tables"]["models"]["columns"][1][1]) = $(id);"
                DBInterface.execute(con, query)
            end
        end
    else
        println("All models have been evaluated on grammar $(grammars_from_db.grammarid[gn]). Moving on...")
    end
end
DBInterface.close!(con)
