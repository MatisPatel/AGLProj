############################################# Full pipeline for model training ###################################################
# Author: M. Patel, K. Voudouris
# Project Title: AGLProj
# Julia Version: 1.11.1
# MySQL version: 8.0.31
#################################################################################################################################

# Script Outline
# 0. Load packages & setup DB connection & define parameters
# 1. We define the models from what is in the database.
# 2. We train the models in parallel and then pass the results to the database serially. 

#################################################################################################################################
# 0. Preamble

using Distributed
n_procs = 50
addprocs(n_procs-1)

@everywhere begin
    using DrWatson
    quickactivate(".", "AGLProj")
    using CSV, Combinatorics, DataFrames, IterTools, LinearAlgebra, Logging, Lux, MySQL, Optimisers, Octavian, Random, StatsBase
    include(srcdir("database.jl"))
    include(srcdir("models.jl"))
    
    # Import settings
    settings = load_yaml("settings.yaml")

    # Load parameters from YAML
    load_parameters(settings, "model_parameters")
end

# Initialise database
initialise_db("settings.yaml")

# Connect to database
con = database_connect(settings["db_credentials_secret"]["path"])

# Load grammars
grammars_from_db = DBInterface.execute(con, "SELECT * FROM $(settings["tables"]["grammars"]["name"]) WHERE $(settings["tables"]["grammars"]["columns"][end][1]) = FALSE;") |> DataFrame |> shuffle

# Delete any existing outputs from failed runs
println("Deleting any partially completed runs from relevant tables")
acc_losses_query = "DELETE t FROM $(settings["tables"]["accuracieslosses"]["name"]) t INNER JOIN \
                    $(settings["tables"]["grammars"]["name"]) g ON \
                    t.$(settings["tables"]["accuracieslosses"]["columns"][2][1]) = g.$(settings["tables"]["grammars"]["columns"][1][1]) WHERE \
                    g.$(settings["tables"]["grammars"]["columns"][end][1]) = FALSE;"
DBInterface.execute(con, acc_losses_query)

outputs_query = "DELETE t FROM $(settings["tables"]["modeloutputs"]["name"]) t INNER JOIN \
                $(settings["tables"]["grammars"]["name"]) g ON \
                t.$(settings["tables"]["modeloutputs"]["columns"][2][1]) = g.$(settings["tables"]["grammars"]["columns"][1][1]) WHERE \
                g.$(settings["tables"]["grammars"]["columns"][end][1]) = FALSE;"
DBInterface.execute(con, outputs_query)
println("Done! Loading models...")

# Load models
model_table = DBInterface.execute(con, "SELECT * FROM $(settings["tables"]["models"]["name"]) WHERE run = FALSE;") |> DataFrame

#############################################################################################################

## Build models

model_list = []
for row in 1:nrow(model_table) # quicker to do on one worker
    if row % 100 == 0
        println("Model ID: ", model_table.modelid[row], " loaded.")
    end
    model_chain = build_model(model_table.neurons[row],
                            model_table.layers[row],
                            model_table.laminations[row],
                            Bool(model_table.recurrence[row]),
                            Bool(model_table.gru[row]),
                            Bool(model_table.inpool[row]),
                            Bool(model_table.outpool[row]),
                            num_errors, string_length, alphabet_length,
                            Bool(model_table.reservoir[row]), reservoir_scaling_factor)
        
    push!(model_list, (model_chain, model_table.modelid[row]))
end

### Train

output_col_names = [x[1] for x in settings["tables"]["modeloutputs"]["columns"][2:end]]
acc_col_names = [x[1] for x in settings["tables"]["accuracieslosses"]["columns"][1:end]]

if nrow(grammars_from_db) > 0
    for gn in 1:nrow(grammars_from_db)
        grammar_id = grammars_from_db.grammarid[gn]
        println("Commencing training on grammar ", grammar_id)
        grammar_query = string("SELECT * FROM strings WHERE grammarid = $(grammar_id) AND stringlength = $(string_length);") 
        training_data = DBInterface.execute(con, grammar_query) |> DataFrame |> shuffle # get the strings for the ith grammar
        
        for models in collect(Iterators.partition(model_list, n_procs*6)) # batch up the models 
            results = @distributed (vcat) for m in models
                model = m[1]
                model_id = m[2]
                next_output, next_acc_loss =  train_and_store(model, opt, training_data, prop_test, alphabet_length;
                                                                n_epochs=n_epochs,
                                                                batch_size=batch_size, 
                                                                seed=model_seed,
                                                                )
                next_output.modelid = vcat(repeat([model_id], nrow(next_output)))
                next_acc_loss.modelid = vcat(repeat([model_id], nrow(next_acc_loss)))
                next_acc_loss.grammarid = vcat(repeat([grammar_id], nrow(next_acc_loss)))
                (next_output, next_acc_loss)
            end

            println("Training complete for batch of $(length(results)) models. Pushing to DB...")
            output_list = [x[1] for x in results if !isnothing(x)]
            acc_loss_list = [x[2] for x in results if !isnothing(x)]
            model_outputs = vcat(output_list...)
            unique!(model_outputs)
            model_accuracies = vcat(acc_loss_list...)

            if nrow(model_accuracies) > 0
                select!(model_accuracies, :modelid, :grammarid, :epoch, :batch, :loss, :train_brier, :test_brier)
                for batch in collect(Iterators.partition(1:size(model_accuracies)[1], 100))
                    batch_df = model_accuracies[batch, :]
                    query = build_batch_insert_query(settings["tables"]["accuracieslosses"]["name"], acc_col_names, batch_df)
                    DBInterface.execute(con, query) # push to DB
                end
            end

            if nrow(model_outputs) > 0
                select!(model_outputs, :grammarid, :stringid, :modelid, :trainteststring, :pretrainprobs, :posttrainprobs)
                model_outputs.trainteststring .= replace(model_outputs.trainteststring, "Test" => "\"Test\"", "Train" => "\"Train\"")
                for batch in collect(Iterators.partition(1:size(model_outputs)[1], 100))
                    batch_df = model_outputs[batch, :]
                    query = build_batch_insert_query(settings["tables"]["modeloutputs"]["name"], output_col_names, batch_df)
                    DBInterface.execute(con, query) # push to DB
                end
            end
            println("Data pushed to DB.")
        end
        query = "UPDATE $(settings["tables"]["grammars"]["name"]) SET $(settings["tables"]["grammars"]["columns"][end][1]) = TRUE \
                WHERE $(settings["tables"]["grammars"]["columns"][1][1]) = $(grammar_id);"
        DBInterface.execute(con, query)
        println("Run status updated.")
    end
else
    println("All grammars have been trained on. Closing...")
end
DBInterface.close!(con)
