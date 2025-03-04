############################################# Full pipeline for grammars ########################################################
# Author: M. Patel, K. Voudouris
# Project Title: AGLProj
# Julia Version: 1.11.1
# MySQL version: 8.0.31
#################################################################################################################################

# Script Outline
# 0. Load packages & setup DB connection & define parameters
# 1. First we build the grammars. 
# 2. Then we make the strings. 
# 3. Then we define the models. 

#################################################################################################################################
# 0. Preamble

using DrWatson
@quickactivate "AGLProj"

include(srcdir("database.jl"))
include(srcdir("grammars.jl"))
include(srcdir("models.jl"))

# Import settings
settings = load_yaml("settings.yaml")

# Initialise database
initialise_db("settings.yaml")

# Connect to database
con = database_connect(settings["db_credentials_secret"]["path"])

# Load parameters from YAML
load_parameters(settings, "grammar_parameters")
load_parameters(settings, "string_parameters")
load_parameters(settings, "model_parameters")

##################################################################################################################################
# 1. Build grammars

# Make grammars and push to DB

## with loops
grammar_types = ["cfg_rep"; "cfg_mirr"; 1:max_k_grams]
loops = nothing
for gt in grammar_types
    if isa(gt, Int) && gt == 1
        grammar_type = "reg"
        k = 1
    elseif isa(gt, Int) && gt > 1
        grammar_type = "csg"
        k = gt
    else
        grammar_type = gt
        k = 1
    end
    println("Generating grammars of type ", grammar_type)
    println("Attempting to generate ", (num_grammars*((grammar_connections[end]-grammar_connections[1])+1)) ," grammars.")
    for num_conn in grammar_connections 
        grammar_counter = 0
        num_conn = num_conn^k
        for grammar_num in 1:num_grammars
            for attempt in 1:num_attempts
                if grammar_counter < num_grammars # only try more attempts if you have less than the desired number of grammars
                    try
                        grammar_dict = generate_grammar(alphabet_length, num_conn, k)
                        if sum(Diagonal(grammar_dict["grammar"])) >= 1
                            loops = true
                        else
                            loops = false
                        end
                        entropy_list = compute_grammar_entropy(grammar_dict["grammar"], grammar_dict["in_degree_laplacian"], grammar_dict["signless_in_degree_laplacian"])
                        entropy_list = [ifelse(isnan(e), "NULL", e) for e in entropy_list]

                        grammar_hash = bytes2hex(sha256(string(grammar_dict["grammar"])))

                        entropy_value_list = vcat(k, "\"$(grammar_type)\"", num_conn, Int(loops), entropy_list, alphabet_length, "\"$(grammar_dict["grammar"])\"", "\"$(grammar_hash)\"", false)
                        col_names = [x[1] for x in settings["tables"]["grammars"]["columns"][2:end]]
                        query = build_insert_query(settings["tables"]["grammars"]["name"], col_names, entropy_value_list)

                        DBInterface.execute(con, query) # push to DB - will fail if there is an identical transition matrix, as this has a unique constraint.

                        grammar_counter += 1 # successfully added a grammar to the database, so add 1 to the counter
                    catch
                        println("A non-unique transition matrix was found for grammar number ", grammar_num, " of grammars with ", num_conn, " connections and loops = ", loops, ". Attempt ", attempt, " of ", num_attempts)
                        continue
                    end
                else
                    break
                end
            end
        end
    end
end

#################################################################################################################################
# 2. Make grammar strings

# Grammars in DB
grammars_from_db = DBInterface.execute(con, "SELECT * FROM $(settings["tables"]["grammars"]["name"]);") |> DataFrame # get the grammars by unique transition matrix and convert to dataframe.
println("There are ", nrow(grammars_from_db), " grammars in the database. You may have asked for ", ((num_grammars*((grammar_connections[end]-grammar_connections[1])+1))*2)*(max_k_grams + 2), " grammars, but many of those would have been duplicated.")

println("Creating ", size(grammars_from_db)[1]*num_strings*(num_errors+1), " strings in the $(settings["tables"]["strings"]["name"]) table.")

if grammars_from_db[1, "$(settings["tables"]["grammars"]["columns"][end-2][1])"] != alphabet_length
    error("alphabet_length length in settings.yaml ($(alphabet_length)) does not match alphabet_length in $(settings["tables"]["grammars"]["name"]) table")
else
    alphabet = alphabet[1:alphabet_length]
end

col_names = [x[1] for x in settings["tables"]["strings"]["columns"][1:end-1]]
for i in 1:size(grammars_from_db)[1]
    grammar_id = grammars_from_db[i, "$(settings["tables"]["grammars"]["columns"][1][1])"]
    k = grammars_from_db[i, "$(settings["tables"]["grammars"]["columns"][2][1])"]
    g_type = grammars_from_db[i, "$(settings["tables"]["grammars"]["columns"][3][1])"]
    println("Generating strings for grammar $(grammar_id)")
    
    grammar_string = grammars_from_db[i, "$(settings["tables"]["grammars"]["columns"][end-1][1])"]
    grammar_chop = chop(grammar_string, head=1, tail=1)
    grammar_split = split(grammar_chop, "; ")
    adjacency_matrix = zeros(alphabet_length, alphabet_length)
    
    for j in 1:alphabet_length # for each row
        for h in 1:alphabet_length # for each column
            adjacency_matrix[j,h] = parse(Int, split(grammar_split[j])[h]) # take the integer from the grammarSplit at the right index
        end
    end

    err_adjacency_matrix = Float64.(adjacency_matrix .== 0.0) #make inverted transition matrix

    for _ in 1:num_strings
        for error_bool in [false, true]
            success = false
            attempts = 0
            while !success && attempts < 10
                try
                    output_string, output_string_num = make_string(alphabet, adjacency_matrix, err_adjacency_matrix, string_length, g_type, error_bool)
                    value_list = vcat(grammar_id, "\"$(output_string)\"", string_length, "\"$(output_string_num)\"", Int(error_bool))

                    query = build_insert_query(settings["tables"]["strings"]["name"], col_names, value_list)
                    DBInterface.execute(con, query)
                    success = true
                    break
                catch
                    attempts = attempts + 1
                    continue
                end
            end
        end
    end
end

##################################################################################################################################
# 3. Define models 

col_names = [x[1] for x in settings["tables"]["models"]["columns"][2:end]]
for neurs in min_num_neurons:neuron_increments:max_num_neurons
    for lays in min_num_layers:max_num_layers
        for lams in 1:max_num_laminations
            for ipool in [false] # [true, false]
                for opool in [false] # [true, false]
                    for rec in [true, false]
                        for gru in [true, false]
                            for res in [false] # [true, false]
                                println("Generating model with $(neurs) neurons, $(lays) layers, $(lams) laminations, recurrent = $(rec), gru = $(gru), input pooling = $(ipool), output pooling = $(opool), reservoir = $(res)")
                                model = build_model(neurs, lays, lams, rec, gru, ipool, opool, num_errors, string_length, alphabet_length, res, reservoir_scaling_factor)
                                if model != false
                                    value_list = vcat(neurs, lays, lams, rec, gru, ipool, opool, res, false)
                                    query = build_insert_query(settings["tables"]["models"]["name"], col_names, value_list)
                                    try
                                        DBInterface.execute(con, query)
                                    catch
                                        continue
                                    end
                                end
                            end
                        end
                    end
                end
            end
        end
    end
end

                                
DBInterface.close!(con) #close the connection