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
load_parameters(settings, "grammar_parameters") # load global parameters from the settings file
load_parameters(settings, "string_parameters")  # load global parameters from the settings file
load_parameters(settings, "model_parameters")  # load global parameters from the settings file

##################################################################################################################################
# 1. Build grammars

# Make grammars and push to DB

## Make strictly k-local grammars
println("Generating grammars of type strictly k-local")
rng_seed = MersenneTwister(grammar_seed)
for k in 1:max_k_grams
    grammar_counter = 0
    if k == 1
        deterministic_grammars = true
        num_transitions_per_kgram = 1
    else
        deterministic_grammars = false
        num_transitions_per_kgram = 3
    end
    while grammar_counter < num_grammars 
        try
            grammar_dict = generate_skl_grammar(alphabet_length, k, deterministic_grammars, num_transitions_per_kgram, rng_seed)
            grammar_hash = bytes2hex(sha256(string(grammar_dict["grammar"])))
                        
            value_list = vcat(k, "\"regular\"", "\"slk\"", 0, "\"NA\"", "\"NA\"", 999, 0, "\"NA\"", "\"NA\"", 1, alphabet_length, "\"$(grammar_dict["grammar"])\"", "\"$(grammar_hash)\"", "\"$(grammar_dict["ungrammar"])\"", false)
            col_names = [x[1] for x in settings["tables"]["grammars"]["columns"][2:end]]
            query = build_insert_query(settings["tables"]["grammars"]["name"], col_names, value_list)
            DBInterface.execute(con, query) # push to DB - will fail if there is an identical transition matrix, as this has a unique constraint.

            grammar_counter += 1 # successfully added a grammar to the database, so add 1 to the counter
        catch
            println("A non-unique transition matrix was found for grammar with $(k)-grams.")
            continue
        end
    end
end

## Make k-locally testable grammars
println("Generating grammars of type k-locally testable")
rng_seed = MersenneTwister(grammar_seed+1) # plus one so we don't necessarily produce the same base grammars.
for k in 2:max_k_grams
    if k == 1
        deterministic_grammars = true
        num_transitions_per_kgram = 1
    else
        deterministic_grammars = false
        num_transitions_per_kgram = 3
    end
    for nc in max_num_constraints:max_num_constraints # only have one for now. 
        grammar_counter = 0
        while grammar_counter < num_grammars # only try more attempts if you have less than the desired number of grammars
            try
                grammar_dict = generate_ltk_grammar(alphabet_length, k, nc, deterministic_grammars, num_transitions_per_kgram, rng_seed)
                grammar_hash = bytes2hex(sha256(string(grammar_dict["grammar"])))
                constraints_hash = bytes2hex(sha256(string(grammar_dict["locally_testable_constraints"])))
                try            
                    value_list = vcat(k, "\"regular\"", "\"ltk\"", nc, "\"$(grammar_dict["locally_testable_constraints"])\"", "\"$(constraints_hash)\"", 999, 0, "\"NA\"", "\"NA\"", 1, alphabet_length, "\"$(grammar_dict["grammar"])\"", "\"$(grammar_hash)\"", "\"NA\"", false)
                    col_names = [x[1] for x in settings["tables"]["grammars"]["columns"][2:end]]
                    query = build_insert_query(settings["tables"]["grammars"]["name"], col_names, value_list)
                    DBInterface.execute(con, query) # push to DB - will fail if there is an identical transition matrix, as this has a unique constraint.

                    grammar_counter += 1 # successfully added a grammar to the database, so add 1 to the counter
                catch
                    println("A non-unique transition matrix was found for grammar with $(k)-grams.")
                    continue
                end
            catch
                println("Skipping grammar with $(k)-grams and $(nc) constraints.")
                break
            end
        end
    end
end

## Make k-locally t-threshold testable grammars
println("Generating grammars of type k-locally t-threshold testable")
rng_seed = MersenneTwister(grammar_seed+2) # plus two so we don't necessarily produce the same base grammars.
for k in 2:max_k_grams
    if k == 1
        deterministic_grammars = true
        num_transitions_per_kgram = 1
    else
        deterministic_grammars = false
        num_transitions_per_kgram = 3
    end
    for nc in max_num_constraints:max_num_constraints # only have one for now. 
        for t in max_threshold:max_threshold # only have one for now. 
            grammar_counter = 0
            while grammar_counter < num_grammars
                try
                    grammar_dict = generate_lttk_grammar(alphabet_length, k, nc, t, deterministic_grammars, num_transitions_per_kgram, rng_seed)
                    grammar_hash = bytes2hex(sha256(string(grammar_dict["grammar"])))
                    constraints_hash = bytes2hex(sha256(string(grammar_dict["locally_threshold_testable_constraints"])))
                    try
                        value_list = vcat(k, "\"regular\"", "\"lttk\"", nc, "\"$(grammar_dict["locally_threshold_testable_constraints"])\"", "\"$(constraints_hash)\"", t, 0, "\"NA\"", "\"NA\"", 1, alphabet_length, "\"$(grammar_dict["grammar"])\"", "\"$(grammar_hash)\"", "\"NA\"", false)
                        col_names = [x[1] for x in settings["tables"]["grammars"]["columns"][2:end]]
                        query = build_insert_query(settings["tables"]["grammars"]["name"], col_names, value_list)
                        DBInterface.execute(con, query) # push to DB - will fail if there is an identical transition matrix, as this has a unique constraint.

                        grammar_counter += 1 # successfully added a grammar to the database, so add 1 to the counter

                    catch
                        println("A non-unique transition matrix was found for grammar with $(k)-grams.")
                        continue
                    end
                catch
                    println("Skipping grammar with $(k)-grams and $(nc) constraints and $(t) threshold.")
                    break
                end
            end
        end
    end
end

## Make k-locally t-threshold testable grammars
println("Generating grammars of type k-locally t-threshold testable with order constraints")
rng_seed = MersenneTwister(grammar_seed+3) # plus three so we don't necessarily produce the same base grammars.
for k in 2:max_k_grams
    if k == 1
        deterministic_grammars = true
        num_transitions_per_kgram = 1
    else
        deterministic_grammars = false
        num_transitions_per_kgram = 5 # to escape some states we need more transitions to generate these grammars.
    end
    for nc in max_num_constraints:max_num_constraints # only have one for now. 
        for t in max_threshold:max_threshold # only have one for now. 
            for prec in max_num_precedence_relations:max_num_precedence_relations # only have one for now. 
                grammar_counter = 0
                while grammar_counter < num_grammars
                    try
                        grammar_dict = generate_lttko_grammar(alphabet_length, k, nc, t, prec, deterministic_grammars, num_transitions_per_kgram, rng_seed)
                        grammar_hash = bytes2hex(sha256(string(grammar_dict["grammar"])))
                        constraints_hash = bytes2hex(sha256(string(grammar_dict["locally_threshold_testable_constraints"])))
                        prec_hash = bytes2hex(sha256(string(grammar_dict["precedence_relations_grammar"])))
                        try
                            value_list = vcat(k, "\"regular\"", "\"lttko\"", nc, "\"$(grammar_dict["locally_threshold_testable_constraints"])\"", "\"$(constraints_hash)\"", t, prec, "\"$(grammar_dict["precedence_relations_grammar"])\"", "\"$(prec_hash)\"", 1, alphabet_length, "\"$(grammar_dict["grammar"])\"", "\"$(grammar_hash)\"", "\"NA\"", false)
                            col_names = [x[1] for x in settings["tables"]["grammars"]["columns"][2:end]]
                            query = build_insert_query(settings["tables"]["grammars"]["name"], col_names, value_list)
                            DBInterface.execute(con, query) # push to DB - will fail if there is an identical transition matrix, as this has a unique constraint.

                            grammar_counter += 1 # successfully added a grammar to the database, so add 1 to the counter

                        catch
                            println("A non-unique transition matrix was found for grammar with $(k)-grams.")
                            continue
                        end
                    catch
                        println("Skipping grammar with $(k)-grams and $(nc) constraints and $(t) threshold and $(prec) precedence constraints.")
                        break
                    end
                end
            end
        end
    end
end

## Make monadic second-order grammars
println("Generating grammars of type monadic second-order")
rng_seed = MersenneTwister(grammar_seed+4) # plus four so we don't necessarily produce the same base grammars.
for k in 2:max_k_grams
    if k == 1
        deterministic_grammars = true
        num_transitions_per_kgram = 1
    else
        deterministic_grammars = false
        num_transitions_per_kgram = 5 # since we are making smaller strings.
    end
    for mod_val in [2, 3]
        grammar_counter = 0
        while grammar_counter < num_grammars
            try
                grammar_dict = generate_monadic_second_grammar(alphabet_length, k, mod_val, deterministic_grammars, num_transitions_per_kgram, rng_seed)
                grammar_hash = bytes2hex(sha256(string(grammar_dict["grammar"])))
                try
                    value_list = vcat(k, "\"regular\"", "\"mso\"", 0, "\"NA\"", "\"NA\"", 999, 0, "\"NA\"", "\"NA\"", mod_val, alphabet_length, "\"$(grammar_dict["grammar"])\"", "\"$(grammar_hash)\"", "\"NA\"", false)
                    col_names = [x[1] for x in settings["tables"]["grammars"]["columns"][2:end]]
                    query = build_insert_query(settings["tables"]["grammars"]["name"], col_names, value_list)
                    DBInterface.execute(con, query) # push to DB - will fail if there is an identical transition matrix, as this has a unique constraint.

                    grammar_counter += 1 # successfully added a grammar to the database, so add 1 to the counter

                catch
                    println("A non-unique transition matrix was found for grammar with $(k)-grams.")
                    continue
                end
            catch
                println("Skipping grammar with $(k)-grams and $(mod_val) mod.")
                break
            end
        end
    end
end

## Make context-free and context-sensitive grammars
println("Generating grammars of type context-free and context-sensitive")
rng_seed = MersenneTwister(grammar_seed+5) # plus five so we don't necessarily produce the same base grammars.
k_gram_size = 2 # first order transition matrices
grammar_types = ["rep", "mirr", "AnBn", "AnBnCn"]

for g_subtype in grammar_types
    grammar_counter = 0
    if g_subtype == "AnBnCn"
        g_type = "csg"
        num_grammars_context_langs = num_grammars * 3 * max_k_grams # to make up for the imbalance with k-grams and the three types of cfg
    else
        g_type = "cfg"
        num_grammars_context_langs = num_grammars * max_k_grams # to make up for the imbalance with k-grams
    end
    while grammar_counter < num_grammars_context_langs
        try 
            grammar_dict = generate_skl_grammar(alphabet_length, k_gram_size, false, 3, rng_seed)
            grammar_hash = bytes2hex(sha256(string(grammar_dict["grammar"])))
                        
            value_list = vcat(k_gram_size, "\"$(g_type)\"", "\"$(g_subtype)\"", 0, "\"NA\"", "\"NA\"", 999, 0, "\"NA\"", "\"NA\"", 1, alphabet_length, "\"$(grammar_dict["grammar"])\"", "\"$(grammar_hash)\"", "\"$(grammar_dict["ungrammar"])\"", false)
            col_names = [x[1] for x in settings["tables"]["grammars"]["columns"][2:end]]
            query = build_insert_query(settings["tables"]["grammars"]["name"], col_names, value_list)
            DBInterface.execute(con, query) # push to DB - will fail if there is an identical transition matrix, as this has a unique constraint.

            grammar_counter += 1 # successfully added a grammar to the database, so add 1 to the counter
        catch
            println("A non-unique transition matrix was found for grammar of type $(g_subtype).")
            continue
        end
    end
end

#################################################################################################################################
# 2. Make grammar strings

# Grammars in DB
grammars_from_db = DBInterface.execute(con, "SELECT * FROM $(settings["tables"]["grammars"]["name"]);") |> DataFrame # get the grammars by unique transition matrix and convert to dataframe.
println("There are ", nrow(grammars_from_db), " grammars in the database. ")

println("Creating ", size(grammars_from_db)[1]*num_strings*(num_errors+1), " strings in the $(settings["tables"]["strings"]["name"]) table.")

if grammars_from_db[1, "$(settings["tables"]["grammars"]["columns"][end-4][1])"] != alphabet_length
    error("alphabet_length length in settings.yaml ($(alphabet_length)) does not match alphabet_length in $(settings["tables"]["grammars"]["name"]) table")
else
    alphabet = alphabet[1:alphabet_length]
end

col_names = [x[1] for x in settings["tables"]["strings"]["columns"][1:end-1]]
string_rng = MersenneTwister(string_seed) # seed for the string generation

for i in 1:size(grammars_from_db)[1] # for each row in the grammars table (i.e. each grammar)
    # Get the grammar ID, k-gram size, and grammar string from the database
    grammar_id = grammars_from_db[i, "$(settings["tables"]["grammars"]["columns"][1][1])"]
    grammar_type = grammars_from_db[i, "$(settings["tables"]["grammars"]["columns"][3][1])"]
    grammar_subtype = grammars_from_db[i, "$(settings["tables"]["grammars"]["columns"][4][1])"]
    kgram_size = grammars_from_db[i, "$(settings["tables"]["grammars"]["columns"][2][1])"]
    println("Generating strings for grammar ID $(grammar_id) of type $(grammar_type) with $(kgram_size)-grams and $(grammar_subtype) subtype.")

    # Process the grammar string to get the adjacency matrix
    grammar_string = grammars_from_db[i, "$(settings["tables"]["grammars"]["columns"][end-3][1])"]
    grammar_chop = chop(grammar_string, head=1, tail=1)
    grammar_split = split(grammar_chop, "; ")

    (kgram_size == 1) && (kgram_size = 2) # handle the 0 exponent below using idiomatic conditional assignment.
    adjacency_matrix = zeros(alphabet_length^(kgram_size - 1), alphabet_length)
    for j in 1:alphabet_length^(kgram_size - 1) # for each row
        for h in 1:alphabet_length # for each column
            adjacency_matrix[j,h] = parse(Int, split(grammar_split[j])[h]) # take the integer from the grammar_split at the right index
        end
    end

    # Process the database entry into a grammar dictionary so that the generate_string function can use it (and still be used without being dependent on MySQL output structure).
    if grammar_type == "regular"
        if grammar_subtype == "slk"
            ungrammar_string = grammars_from_db[i, "$(settings["tables"]["grammars"]["columns"][end-1][1])"]
            ungrammar_chop = chop(ungrammar_string, head=1, tail=1)
            ungrammar_split = split(ungrammar_chop, "; ")
            unadjacency_matrix = zeros(alphabet_length^(kgram_size - 1), alphabet_length)
            for j in 1:alphabet_length^(kgram_size - 1) # for each row
                for h in 1:alphabet_length # for each column
                    unadjacency_matrix[j,h] = parse(Int, split(ungrammar_split[j])[h]) # take the integer from the grammarSplit at the right index
                end
            end
            grammar_dict = Dict(
                            "grammar"=>adjacency_matrix,
                            "ungrammar"=>unadjacency_matrix,
                            "kgram_size"=>grammars_from_db[i, "$(settings["tables"]["grammars"]["columns"][2][1])"],
                        )
        elseif grammar_subtype == "ltk"
            grammar_dict = Dict(
                            "grammar"=>adjacency_matrix,
                            "locally_testable_constraints"=>eval(Meta.parse(grammars_from_db[i, "$(settings["tables"]["grammars"]["columns"][6][1])"])),
                            "kgram_size"=>grammars_from_db[i, "$(settings["tables"]["grammars"]["columns"][2][1])"],
                        )
        elseif grammar_subtype == "lttk"
            grammar_dict = Dict(
                            "grammar"=>adjacency_matrix,
                            "locally_threshold_testable_constraints"=>eval(Meta.parse(grammars_from_db[i, "$(settings["tables"]["grammars"]["columns"][6][1])"])),
                            "threshold"=>grammars_from_db[i, "$(settings["tables"]["grammars"]["columns"][8][1])"],
                            "kgram_size"=>grammars_from_db[i, "$(settings["tables"]["grammars"]["columns"][2][1])"],
                        )
        elseif grammar_subtype == "lttko"
            grammar_dict = Dict(
                            "grammar"=>adjacency_matrix,
                            "precedence_relations_grammar"=>eval(Meta.parse(grammars_from_db[i, "$(settings["tables"]["grammars"]["columns"][10][1])"])),
                            "kgram_size"=>grammars_from_db[i, "$(settings["tables"]["grammars"]["columns"][2][1])"],
                        )
        elseif grammar_subtype == "mso"
            grammar_dict = Dict(
                            "grammar"=>adjacency_matrix,
                            "mod"=>grammars_from_db[i, "$(settings["tables"]["grammars"]["columns"][12][1])"],
                            "kgram_size"=>grammars_from_db[i, "$(settings["tables"]["grammars"]["columns"][2][1])"],
                        )
        else
            error("Unknown grammar subtype $(grammar_subtype) for grammar ID $(grammar_id).")
        end
        
        # Generate strings for the regular grammars
        for error_bool in [false, true]
            string_counter = 0
            while string_counter < num_strings
                letter_string, string_idxs = generate_reg_lang_string(grammar_dict, string_length, error_bool, alphabet, string_rng)
                try
                    value_list = vcat(grammar_id, "\"$(letter_string)\"", string_length, "\"$(string_idxs)\"", Int(error_bool))
                    query = build_insert_query(settings["tables"]["strings"]["name"], col_names, value_list)
                    DBInterface.execute(con, query)
                    string_counter += 1
                catch
                    continue
                end
            end
        end
    else
        if grammar_type == "cfg"
            if grammar_subtype == "AnBn"
                ungrammar_string = grammars_from_db[i, "$(settings["tables"]["grammars"]["columns"][end-1][1])"]
                ungrammar_chop = chop(ungrammar_string, head=1, tail=1)
                ungrammar_split = split(ungrammar_chop, "; ")
                unadjacency_matrix = zeros(alphabet_length^(kgram_size - 1), alphabet_length)
                for j in 1:alphabet_length^(kgram_size - 1) # for each row
                    for h in 1:alphabet_length # for each column
                        unadjacency_matrix[j,h] = parse(Int, split(ungrammar_split[j])[h]) # take the integer from the grammarSplit at the right index
                    end
                end
                grammar_dict = Dict(
                                "grammar"=>adjacency_matrix,
                                "ungrammar"=>unadjacency_matrix,
                                "kgram_size"=>grammars_from_db[i, "$(settings["tables"]["grammars"]["columns"][2][1])"],
                            )
            else
                grammar_dict = Dict(
                                "grammar"=>adjacency_matrix,
                                "kgram_size"=>grammars_from_db[i, "$(settings["tables"]["grammars"]["columns"][2][1])"],
                            )
            end

            # Generate strings for the grammar
            for error_bool in [false, true]
                string_counter = 0
                while string_counter < num_strings
                    letter_string, string_idxs = generate_context_free_string(grammar_dict, grammar_subtype, string_length, error_bool, alphabet, string_rng)
                    try
                        value_list = vcat(grammar_id, "\"$(letter_string)\"", string_length, "\"$(string_idxs)\"", Int(error_bool))
                        query = build_insert_query(settings["tables"]["strings"]["name"], col_names, value_list)
                        DBInterface.execute(con, query)
                        string_counter += 1
                    catch
                        continue
                    end
                end
            end
        elseif grammar_type == "csg"
            ungrammar_string = grammars_from_db[i, "$(settings["tables"]["grammars"]["columns"][end-1][1])"]
            ungrammar_chop = chop(ungrammar_string, head=1, tail=1)
            ungrammar_split = split(ungrammar_chop, "; ")
            unadjacency_matrix = zeros(alphabet_length^(kgram_size - 1), alphabet_length)
            for j in 1:alphabet_length^(kgram_size - 1) # for each row
                for h in 1:alphabet_length # for each column
                    unadjacency_matrix[j,h] = parse(Int, split(ungrammar_split[j])[h]) # take the integer from the grammarSplit at the right index
                end
            end
            grammar_dict = Dict(
                            "grammar"=>adjacency_matrix,
                            "ungrammar"=>unadjacency_matrix,
                            "kgram_size"=>grammars_from_db[i, "$(settings["tables"]["grammars"]["columns"][2][1])"],
                        )
                    
            # Generate strings for the grammar
            for error_bool in [false, true]
                string_counter = 0
                while string_counter < num_strings
                    letter_string, string_idxs = generate_context_sensitive_string(grammar_dict, string_length, error_bool, alphabet, string_rng)
                    try
                        value_list = vcat(grammar_id, "\"$(letter_string)\"", string_length, "\"$(string_idxs)\"", Int(error_bool))
                        query = build_insert_query(settings["tables"]["strings"]["name"], col_names, value_list)
                        DBInterface.execute(con, query)
                        string_counter += 1
                    catch
                        continue
                    end
                end
            end
        else
            error("Unknown grammar type $(grammar_type) for grammar ID $(grammar_id).")
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
                                model = build_model(neurs, lays, lams, rec, gru, ipool, opool, num_errors, string_length, alphabet_length, res, reservoir_scaling_factor)
                                if model != false
                                    println("Generating model with $(neurs) neurons, $(lays) layers, $(lams) laminations, recurrent = $(rec), gru = $(gru), input pooling = $(ipool), output pooling = $(opool), reservoir = $(res)")
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