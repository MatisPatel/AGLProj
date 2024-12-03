## Functions to export
using Combinatorics, CSV, DataFrames, Flux, LinearAlgebra, Logging, MySQL, Random, StatsBase, YAML

#==================================================================================#
# 0. General helper functions

#Square function
square(n) = n * n

# Database connection function
function database_connect(csv_name, checking=false) 
    csv_location = projectdir("src", csv_name)
    if isfile(csv_location)
        database_connection = CSV.File(csv_location) |> DataFrame

        dbName = database_connection.Value[1]
        dbUsername = database_connection.Value[2]
        dbPassword = database_connection.Value[3]
        dbHostname = database_connection.Value[4]

        println("Opening DB Connection")
        try
            con = DBInterface.connect(MySQL.Connection, 
                                    dbHostname,
                                    dbUsername, 
                                    dbPassword, 
                                    db = dbName) 
            if checking
                DBInterface.close!(con)
                println("Database exists and can be connected to!")
                return true
            else
                return con
            end
        catch
            println("Unable to connect to database. Please check credentials.")
            return false
        end
    else
        error("Database connection csv not found. Please add it to the src folder.")
    end
end

# Initialises the database based on a YAML file
function initialise_db(yaml_settings_name)
    settings = load_yaml(yaml_settings_name)

    db_connection_path = settings["db_credentials_secret"]["path"]
    con = database_connect(db_connection_path)
    
    println("Initialising database...")
    for t in keys(settings["tables"])
        table = settings["tables"][t]
        build = _build_db_table(table, con)
        if !build 
            println("Could not build $(table["name"]).")
        end
    end

    println("Closing DB Connection")
    DBInterface.close!(con)

    println("Running checks on database based on YAML settings...")
    check = check_database(yaml_settings_name)
    if check
        println("The database configuration matches the current YAML file.")
    else
        println("The database configuration does not match the current YAML file. Aborting...")
    end
    println("Closing DB Connection")
    return nothing
end

# Builds a database table from contents of YAML file
function _build_db_table(yaml_table_field_element, con)
    function _concatenate_colnames_constraints(col_list, constraint)
        out = join(["$(y[1]) $(y[2])" for y in col_list], ", ")
        if !isnothing(constraint)
            out = out * ", " * constraint
        end
        return out
    end

    name = yaml_table_field_element["name"]
    rebuild = yaml_table_field_element["delete_and_rebuild"]

    if "constraint" in keys(yaml_table_field_element)
        constraint = yaml_table_field_element["constraint"]
    else
        constraint = nothing
    end

    if rebuild
        dropquery = string("DROP TABLE IF EXISTS $(name)")
        DBInterface.execute(con, dropquery)
    end

    createquery = "CREATE TABLE IF NOT EXISTS $(name) ($(_concatenate_colnames_constraints(yaml_table_field_element["columns"], constraint)));"

    try
        DBInterface.execute(con, createquery)
        return true
    catch
        return false
    end
end

# Loads YAML file from file name and cleans it up
function load_yaml(yaml_file_name)
    function _interpret_yaml_code(yaml_dict)
        function _evaluate_strings(col_entry)
            if length(col_entry) == 3
                x = col_entry[3]
                m = match(r"%.*%", col_entry[2])
                interp = replace(replace(m.match, "x" => string(x)), "%" => "")
                out = eval(Meta.parse(interp))
                col_entry[2] = replace(col_entry[2], r"%.*%" => string(out))
            end
            return col_entry
        end
    
        for table in keys(yaml_dict["tables"])
            for column in 1:length(yaml_dict["tables"][table]["columns"])
                 replaced = _evaluate_strings(yaml_dict["tables"][table]["columns"][column])
                 yaml_dict["tables"][table]["columns"][column] = replaced
            end
        end
        return yaml_dict
    end

    yaml_location = projectdir("src", yaml_file_name)
    if isfile(yaml_location)
        settings = YAML.load_file(yaml_location)

        settings = _interpret_yaml_code(settings)

        major_fields = ["db_credentials_secret", "model_parameters",
                  "grammar_parameters", "tables", "string_parameters"]
        for f in major_fields
            if !(f in keys(settings))
                error("$(f) field is missing from YAML at $(yaml_location)! Please copy the template.")
            end
        end

        grammar_fields = ["alphabet_length", "num_grammars", "num_attempts", "entropy_rounding_precision", "seed"]
        for f in grammar_fields
            if !(f in keys(settings["grammar_parameters"]))
                error("$(f) field is missing from grammar_parameters in YAML at $(yaml_location)! Please copy the template.")
            end
        end

        string_fields = ["string_length", "num_strings", "num_errors", "seed"]
        for f in string_fields
            if !(f in keys(settings["string_parameters"]))
                error("$(f) field is missing from string_parameters in YAML at $(yaml_location)! Please copy the template.")
            end
        end

        model_fields = ["min_num_neurons", "max_num_neurons", "neuron_increments", 
                        "min_num_layers", "max_num_layers", "max_num_laminations", 
                        "num_errors", "alphabet_length", "string_length", "seed"]
        for f in model_fields
            if !(f in keys(settings["model_parameters"]))
                error("$(f) field is missing from model_parameters in YAML at $(yaml_location)! Please copy the template.")
            end
        end

        if !("path" in keys(settings["db_credentials_secret"]))
            error("path field is missing from db_credentials_secret in YAML at $(yaml_location)! Please copy the template.")
        end

        table_name_fields = ["strings", "modeloutputs", "grammars", "models", "accuracieslosses"]
        for f in table_name_fields
            if !(f in keys(settings["tables"]))
                error("$(f) field is missing from tables in YAML at $(yaml_location)! Please copy the template.")
            end
        end

        table_fields = ["name", "columns", "delete_and_rebuild"]
        for t in keys(settings["tables"])
            tb_keys = keys(settings["tables"][t])
            for f in table_fields
                if !(f in tb_keys)
                    if f != "name"
                        error("$(f) field is missing from table named $(t["name"]) in YAML at $(yaml_location)! Please copy the template.")
                    else
                        error("The $(f) is missing from one of the tables listed in YAML at $(yaml_location)! Please copy the template.")
                    end
                end
            end
        end

        return settings

    else
        error("YAML file not found. Please add it to the src folder.")
    end


end

# Checks that the database configuration matches the YAML file specification
function check_database(yaml_settings_name)
    settings = load_yaml(yaml_settings_name)
    db_connection_path = settings["db_credentials_secret"]["path"]

    _ = database_connect(db_connection_path, true) # db connection unit test

    con = database_connect(db_connection_path, false)

    tables = DBInterface.execute(con, "SHOW TABLES;") |> DataFrame

    for t in keys(settings["tables"])
        table = settings["tables"][t]
        if !(table["name"] in tables[!, 1])
            error("Table $(t["name"]) is not in the database.")
        end

        columns = DBInterface.execute(con, "SHOW COLUMNS FROM $(table["name"]);") |> DataFrame

        for c in table["columns"]
            if !(c[1] in columns.Field)
                error("Column $(c[1]) is not in Table $(table["name"]).")
            end
        end
    end

    DBInterface.close!(con)

    return true

end

function load_parameters(settings, type)
    if type == "grammar_parameters"
        global alphabet_length = settings["grammar_parameters"]["alphabet_length"]
        global num_grammars = settings["grammar_parameters"]["num_grammars"]
        global num_attempts = settings["grammar_parameters"]["num_attempts"]
        global entropy_rounding_precision = settings["grammar_parameters"]["entropy_rounding_precision"]
        global grammar_seed = settings["grammar_parameters"]["seed"]
        global alphabet = 'a':'z'
        grammar_connections = alphabet_length*2:alphabet_length^2-alphabet_length
        println("Loading grammar parameters: alphabet_length ($(alphabet_length)), num_grammars ($(num_grammars)), num_attempts ($(num_attempts)),\
        entropy_rounding_precision ($(entropy_rounding_precision)), grammar_seed ($(grammar_seed)), alphabet ($(alphabet)), grammar_connections ($(grammar_connections)).")
    elseif type == "string_parameters"
        global string_length = settings["string_parameters"]["string_length"]
        global num_strings = settings["string_parameters"]["num_strings"]
        global num_errors = settings["string_parameters"]["num_errors"]
        global string_seed = settings["string_parameters"]["seed"]
        global alphabet = 'a':'z'
        println("Loading string parameters: string_length ($(string_length)), num_strings ($(num_strings)), num_errors ($(num_errors)),\
        string_seed ($(string_seed)), alphabet ($(alphabet)).")
    elseif type == "model_parameters"
        global min_num_neurons = settings["model_parameters"]["min_num_neurons"]
        global max_num_neurons = settings["model_parameters"]["max_num_neurons"]
        global neuron_increments = settings["model_parameters"]["neuron_increments"]
        global min_num_layers = settings["model_parameters"]["min_num_layers"]
        global max_num_layers = settings["model_parameters"]["max_num_layers"]
        global max_num_laminations = settings["model_parameters"]["max_num_laminations"]
        global num_errors = settings["model_parameters"]["num_errors"]
        global alphabet_length = settings["model_parameters"]["alphabet_length"]
        global string_length = settings["model_parameters"]["string_length"]
        global model_seed = settings["model_parameters"]["seed"]
        global reservoir_scaling_factor = settings["model_parameters"]["reservoir_scaling_factor"]
        println("Loading string parameters: min_num_neurons ($(min_num_neurons)), max_num_neurons ($(max_num_neurons)), neuron_increments ($(neuron_increments)),\
        min_num_layers ($(min_num_layers)), max_num_layers ($(max_num_layers)), max_num_laminations ($(max_num_laminations)), num_errors ($(num_errors)),\
        alphabet_length ($(alphabet_length)), string_length ($(string_length)), model_seed ($(model_seed)), reservoir_scaling_factor ($(reservoir_scaling_factor)).")
    else 
        error("Parameters can only be loaded for one of: grammar_parameters, string_parameters, or model_parameters")
    end

    return nothing
end


function build_insert_query(tab_name, col_names, values)
    if length(col_names) == length(values)
        query = """INSERT INTO $(tab_name) (\
                    $(join(col_names, ", "))\
                    ) VALUES (\
                    $(join(values, ", "))\
                    )\
                """
        return query
    else
        error("Number of columns and number of values do not match.")
    end
end

#==================================================================================#
# 1. Grammar functions

# Checking Connectedness of grammar - check whether the grammar is connected.
function check_connected(grammar)
    N = size(grammar)[1]
    gramN = grammar^N
    counts = sum(gramN .> 0, dims=2)
    return sum(counts .== N) > 0
end

# Check full transitions of grammar - check whether every state can be transitioned out of, no 0s on any rows
function check_full_transitions(grammar)
    # println("check trans")
    row_sums = sum(grammar, dims=2)
    full_trans = prod(row_sums .!= 0)
    return full_trans
end

# Generate fully connected, fully transitioned grammars with and without loops (loops = same state can be visited multiple times sequentially)
function generate_connected_grammar(N::Int, edges::Int, loops::Bool)
    done = false
    grammar = nothing

    if loops

        while !done
            grammar = reshape(shuffle(vcat(repeat([1], edges),
                    repeat([0], N^2 - edges))), N, N)
            if check_full_transitions(grammar)
                if check_connected(grammar)
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
            list_edges = shuffle(vcat(repeat([1], edges),
                    repeat([0], N^2-N - edges))) 
            grammar = vcat([[j==i ? 0 : pop!(list_edges) for j in 1:N] for i in 1:N])
            grammar = reduce(hcat, grammar)
            #println(sum(Diagonal(grammar)))
            if sum(Diagonal(grammar)) == 0
                if check_full_transitions(grammar)
                    if check_connected(grammar) # added constraint so that it must not have loops
                        done = true
                    end
                end
            end
        end
    end
    out_degree_matrix = diagm(vec(sum(grammar, dims=1)))
    in_degree_matrix = diagm(vec(sum(grammar, dims=2)))
    output_dict = Dict(
        "grammar"=>grammar,
        "out_degree_matrix"=>out_degree_matrix,
        "in_degree_matrix"=>in_degree_matrix,
        "out_degree_laplacian"=>(out_degree_matrix .- grammar),
        "in_degree_laplacian"=>(in_degree_matrix .- grammar),
        "signless_in_degree_laplacian"=>(in_degree_matrix .+ grammar) # For Sun et al. (2021) entropy calcs
    )
    return output_dict
end

""" 
Function to make a grammar and draw it. 

N is the alphabet size 
K is the length of the kgrams (2 or 3 usually)
edges are the num of edges max edges is (N^K)^2
"""
function drawRaisedGrammar(N, K, edges)
    if edges > (N^K)^2
        return "ERROR: Edges exceed the maximum possible, check edges is less than (N^K)^2"
    end
    alph_size = N
    mora_size = N^K
    listEdges = shuffle(vcat(repeat([1], edges),
                    repeat([0], mora_size^2-mora_size - edges))) 
    grammar = vcat([[j==i ? 0 : pop!(listEdges) for j in 1:mora_size] for i in 1:mora_size])
    grammar = reduce(hcat, grammar)
    # Input vector of characters
    chars = collect('A':'Z')[1:alph_size]
    # Form a vector of all possible bigram strings
    moras = generate_kgrams(chars, K)
    return graphplot(grammar, names = moras, nodesize=0.15, method=:grid, nodealpha=0)
end

""" 
Function to make a grammar returns the grammar and the list of ordered moras. 

N is the alphabet size 
K is the length of the kgrams (2 or 3 usually)
edges are the num of edges max edges is (N^K)^2
"""
function makeRaisedGrammar(N, K, edges)
    if edges > (N^K)^2
        return "ERROR: Edges exceed the maximum possible, check edges is less than (N^K)^2"
    end
    alph_size = N
    mora_size = N^K
    listEdges = shuffle(vcat(repeat([1], edges),
                    repeat([0], mora_size^2-mora_size - edges))) 
    grammar = vcat([[j==i ? 0 : pop!(listEdges) for j in 1:mora_size] for i in 1:mora_size])
    grammar = reduce(hcat, grammar)
    # Input vector of characters
    chars = collect('A':'Z')[1:alph_size]
    # Form a vector of all possible bigram strings
    moras = generate_kgrams(chars, K)
    return (grammar, moras)
end


"""
Function to make a string with errros from a raised grammar. 
"""
function makeRaisedStringErrors(N, K, grammar, moras, string_length, errors)
    morasLength = length(moras)
    num_moras = div(string_length, K)
    @assert grammar.size[1] == morasLength "size of grammar and number of kgrams do not match"
    @assert string_length % K == 0 "Can't make strings not divisible by K"
    @assert errors < num_moras-1 "Number of errors exceeds the possible transitions"

    initial_mora = nothing 
    while isnothing(initial_mora)
        candidate_mora = rand(1:morasLength)
        if sum(grammar[candidate_mora, :]) > 0
            initial_mora = candidate_mora
        end
    end
    # println(moras[candidate_mora])
    string_idxs = Vector(undef, num_moras)
    string_idxs[1] = initial_mora
    where_errors = sample(2:num_moras, errors, replace=false)

    for i in 2:num_moras
        if i in where_errors
            next = sample(1:morasLength, Weights(error_grammar[string_idxs[i-1], :]))
            string_idxs[i] = next
            # println("error ", i)
        else 
            next = sample(1:morasLength, Weights(grammar[string_idxs[i-1], :]))
            string_idxs[i] = next
        end
    end

    string = join(moras[string_idxs])

    return string, string_idxs, where_errors
end

# Grammar Entropy function - get the entropy of the grammar as defined by Sun et al. (2021)
function compute_eigenvalue_entropy(eigenvalues)
    # Following Sun et al. (2021) https://doi.org/10.1371/journal.pone.0251993

    absolute_values = abs.(eigenvalues)
    sum_values = sum(abs.(eigenvalues))

    scaled_logged_values = (absolute_values./sum_values) .* log.(absolute_values./sum_values)

    entropy = -1 * (sum(scaled_logged_values))

    return entropy
end

# Grammar Entropy function - get the various entropies of the grammar
function compute_grammar_entropy(adjacency_matrix, in_degree_laplacian=nothing, signless_in_degree_laplacian=nothing, rounding_precision=3)
    
    if isnothing(in_degree_laplacian) && isnothing(signless_in_degree_laplacian)
        top_entropy = abs(eigvals(adjacency_matrix)[end])
        return top_entropy

    elseif isnothing(in_degree_laplacian) ⊻ isnothing(signless_in_degree_laplacian)
        error("Supply both an indegree laplacian and a signless in degree laplacian to compute entropy.") 

    else 
        top_entropy = abs(eigvals(adjacency_matrix)[end])

        adjacency_matrix_eigenvalues = eigvals(adjacency_matrix)
        adjacency_matrix_real_entropy = compute_eigenvalue_entropy(real.(adjacency_matrix_eigenvalues))
        adjacency_matrix_imaginary_entropy = compute_eigenvalue_entropy(imag.(adjacency_matrix_eigenvalues))
        adjacency_matrix_modulus_entropy = compute_eigenvalue_entropy(abs.(adjacency_matrix_eigenvalues))

        in_degree_laplacian_eigenvalues = eigvals(in_degree_laplacian)
        in_degree_laplacian_real_entropy = compute_eigenvalue_entropy(real.(in_degree_laplacian_eigenvalues))
        in_degree_laplacian_imaginary_entropy = compute_eigenvalue_entropy(imag.(in_degree_laplacian_eigenvalues))
        in_degree_laplacian_modulus_entropy = compute_eigenvalue_entropy(abs.(in_degree_laplacian_eigenvalues))

        signless_in_degree_laplacian_eigenvalues = eigvals(signless_in_degree_laplacian)
        signless_in_degree_laplacian_real_entropy = compute_eigenvalue_entropy(real.(signless_in_degree_laplacian_eigenvalues))
        signless_in_degree_laplacian_imaginary_entropy = compute_eigenvalue_entropy(imag.(signless_in_degree_laplacian_eigenvalues))
        signless_in_degree_laplacian_modulus_entropy = compute_eigenvalue_entropy(abs.(signless_in_degree_laplacian_eigenvalues))

        output_list = [
            round(top_entropy, digits=rounding_precision),
            round(adjacency_matrix_real_entropy, digits=rounding_precision),
            round(adjacency_matrix_imaginary_entropy, digits=rounding_precision),
            round(adjacency_matrix_modulus_entropy, digits=rounding_precision),
            round(in_degree_laplacian_real_entropy, digits=rounding_precision),
            round(in_degree_laplacian_imaginary_entropy, digits=rounding_precision),
            round(in_degree_laplacian_modulus_entropy, digits=rounding_precision),
            round(signless_in_degree_laplacian_real_entropy, digits=rounding_precision),
            round(signless_in_degree_laplacian_imaginary_entropy, digits=rounding_precision),
            round(signless_in_degree_laplacian_modulus_entropy, digits=rounding_precision)
        ]

        return output_list
    end
end

#==================================================================================#
# 2. Generate strings

# String maker function
function make_string(alphabet, grammar, err_grammar, str_len, errors) # takes an alphabet, a grammar, an error_grammar which is a transformation of that grammar, the length of the strings you want to build, and the number of errors you want
    str_idxs = Vector{Int64}(undef, str_len) # make vector of undefined values
    alph_size = length(alphabet) # get length of alphabet
    str_idxs[1] = rand(1:alph_size) # assign first index to be a random letter in alphabet
    where_errors = nothing
    if (errors < str_len-1)
        where_errors = sample(2:str_len, errors, replace=false)
    else
        where_errors = 2:str_len
    end
    for n in 2:str_len 
        if n in where_errors
            next = sample(1:alph_size, Weights(err_grammar[str_idxs[n-1], :]))
            str_idxs[n] = next
        else 
            next = sample(1:alph_size, Weights(grammar[str_idxs[n-1], :]))
            str_idxs[n] = next
        end
    end 
    return join(alphabet[str_idxs]), str_idxs, where_errors
end

# Make grammar strings from raised grammar
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

#==================================================================================#
# 3. Define models

# Ref: https://jldc.ch/post/seq2one-flux/
struct rnnClassifier
    recurrent
    dense 
end
Flux.@functor rnnClassifier # Differentiable

function (model::rnnClassifier)(input)
    [model.recurrent(i) for i in input[1:end-1]]
    model.dense(model.recurrent(input[end]))
end

# Build models function
function build_model(num_neurons, num_layers, num_laminations, recurrence, input_pool, output_pool, num_classes, length_strings, length_alphabet, reservoir, reservoir_scaling, verbose=false)
    # Takes number of neurons, number of layers, number of splits in the hidden layers, number of classes (i.e., errors), length of strings, and length of alphabet 
    @assert (num_laminations >= 1) "Number of laminations must be greater than or equal to 1 (single lamination is just a densely connected network)."
    
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
                    branch = Chain(
                        RNN(input_dims, splits[1], relu),
                        [RNN(splits[i], splits[i+1], relu) for i in 1:(length(splits) - 2)]...,
                        RNN(splits[end-1], splits[end], relu)
                    )
                else
                    branch = Chain(
                        Dense(input_dims, splits[1], relu),
                        [Dense(splits[i], splits[i+1], relu) for i in 1:(length(splits) - 2)]...,
                        Dense(splits[end-1], splits[end], relu)
                    )
                end
            elseif (input_pool && !output_pool)
                if recurrence
                    branch = Chain(RNN(sum([splits[1] for splits in layer_splits]), splits[2], relu),
                        [RNN(splits[i], splits[i+1], relu) for i in 2:(length(splits) - 2)]...,
                        RNN(splits[end-1], splits[end], relu)
                        )
                else
                    branch = Chain(Dense(sum([splits[1] for splits in layer_splits]), splits[2], relu),
                                [Dense(splits[i], splits[i+1], relu) for i in 2:(length(splits) - 2)]...,
                                Dense(splits[end-1], splits[end], relu)
                                )
                end
            elseif (!input_pool && output_pool)
                if recurrence
                    branch = Chain(
                        RNN(input_dims, splits[1], relu),
                        [RNN(splits[i], splits[i+1], relu) for i in 1:(length(splits) - 2)]...,
                        RNN(splits[end-2], splits[end-1], relu)
                    )
                else
                    branch = Chain(
                        Dense(input_dims, splits[1], relu),
                        [Dense(splits[i], splits[i+1], relu) for i in 1:(length(splits) - 3)]...,
                        Dense(splits[end-2], splits[(length(splits) - 1)], relu)
                    )
                end
            elseif (input_pool && output_pool)
                if recurrence
                    branch = Chain(RNN(sum([splits[1] for splits in layer_splits]), splits[2], relu),
                        [RNN(splits[i], splits[i+1], relu) for i in 2:(length(splits)-3)]...,
                        RNN(splits[end-2], splits[end-1], relu)
                    )
                else
                    branch = Chain(Dense(sum([splits[1] for splits in layer_splits]), splits[2], relu),
                        [Dense(splits[i], splits[i+1], relu) for i in 2:(length(splits)-3)]...,
                        Dense(splits[end-2], splits[end-1], relu)
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
                model = rnnClassifier(
                    Chain(RNN(length_alphabet, input_dims, relu), Parallel(vcat, branches...)),
                    Dense(sum([splits[end] for splits in layer_splits]), num_classes, sigmoid)
                )
            else
                model = Chain(
                    Dense(length_strings*length_alphabet, input_dims, relu),
                    Parallel(vcat, branches...),
                    Dense(sum([splits[end] for splits in layer_splits]), num_classes, sigmoid)
                    )
            end
        else
            if recurrence
                model = rnnClassifier(
                    Parallel(vcat, branches...),
                    Dense(sum([splits[end] for splits in layer_splits]), num_classes, sigmoid)
                )
            else
                model = Chain(
                    Parallel(vcat, branches...),
                    Dense(sum([splits[end] for splits in layer_splits]), num_classes, sigmoid)
                    )
            end
        end
    elseif (input_pool && !output_pool)
        if reservoir
            if recurrence
                model = rnnClassifier(
                    Chain(RNN(length_alphabet, input_dims, relu), RNN(input_dims, sum([splits[1] for splits in layer_splits]), relu), Parallel(vcat, branches...)),
                    Dense(sum([splits[end] for splits in layer_splits]), num_classes, sigmoid)
                    )
            else
                model = Chain(
                    Dense(length_strings*length_alphabet, input_dims, relu),
                    Dense(input_dims, sum([splits[1] for splits in layer_splits]), relu),
                    Parallel(vcat, branches...),
                    Dense(sum([splits[end] for splits in layer_splits]), num_classes, sigmoid)
                    )
            end
        else
            if recurrence
                model = rnnClassifier(
                    Chain(RNN(length_alphabet, sum([splits[1] for splits in layer_splits]), relu), Parallel(vcat, branches...)),
                    Dense(sum([splits[end] for splits in layer_splits]), num_classes, sigmoid)
                    )
            else
                model = Chain(
                    Dense(length_strings*length_alphabet, sum([splits[1] for splits in layer_splits]), relu),
                    Parallel(vcat, branches...),
                    Dense(sum([splits[end] for splits in layer_splits]), num_classes, sigmoid)
                    )
            end
        end
    elseif (!input_pool && output_pool)
        if reservoir
            if recurrence
                model = rnnClassifier(
                    Chain(RNN(length_alphabet, input_dims, relu), Parallel(vcat, branches...), RNN(sum([splits[end-1] for splits in layer_splits]), sum([splits[end] for splits in layer_splits]), relu)),
                    Dense(sum([splits[end] for splits in layer_splits]), num_classes, sigmoid)
                    )
            else
                model = Chain(
                    Dense(length_strings*length_alphabet, input_dims, relu),
                    Parallel(vcat, branches...),
                    Dense(sum([splits[end-1] for splits in layer_splits]), sum([splits[end] for splits in layer_splits]), relu),
                    Dense(sum([splits[end] for splits in layer_splits]), num_classes, sigmoid)
                    )
            end
        else
            if recurrence
                model = rnnClassifier(
                    Chain(Parallel(vcat, branches...), RNN(sum([splits[end-1] for splits in layer_splits]), sum([splits[end] for splits in layer_splits]), relu)),
                    Dense(sum([splits[end] for splits in layer_splits]), num_classes, sigmoid)
                    )
            else
                model = Chain(
                    Parallel(vcat, branches...),
                    Dense(sum([splits[end-1] for splits in layer_splits]), sum([splits[end] for splits in layer_splits]), relu),
                    Dense(sum([splits[end] for splits in layer_splits]), num_classes, sigmoid)
                    )
            end
        end
    else
        if reservoir
            if recurrence
                model = rnnClassifier(
                    Chain(RNN(length_alphabet, input_dims, relu),
                    RNN(input_dims, sum([splits[1] for splits in layer_splits]), relu),
                    Parallel(vcat, branches...),
                    RNN(sum([splits[end-1] for splits in layer_splits]), sum([splits[end] for splits in layer_splits]), relu)
                    ),
                    Dense(sum([splits[end] for splits in layer_splits]), num_classes, sigmoid)
                )
            else
                model = Chain(
                    Dense(length_strings*length_alphabet, input_dims, relu),
                    Dense(input_dims, sum([splits[1] for splits in layer_splits]), relu),
                    Parallel(vcat, branches...),
                    Dense(sum([splits[end-1] for splits in layer_splits]), sum([splits[end] for splits in layer_splits]), relu),
                    Dense(sum([splits[end] for splits in layer_splits]), num_classes, sigmoid)
                    )
            end
        else
            if recurrence
                model = rnnClassifier(
                    Chain(RNN(length_alphabet, sum([splits[1] for splits in layer_splits]), relu),
                    Parallel(vcat, branches...),
                    RNN(sum([splits[end-1] for splits in layer_splits]), sum([splits[end] for splits in layer_splits]), relu)
                    ),
                    Dense(sum([splits[end] for splits in layer_splits]), num_classes, sigmoid)
                )
            else
                model = Chain(
                    Dense(length_strings*length_alphabet, sum([splits[1] for splits in layer_splits]), relu),
                    Parallel(vcat, branches...),
                    Dense(sum([splits[end-1] for splits in layer_splits]), sum([splits[end] for splits in layer_splits]), relu),
                    Dense(sum([splits[end] for splits in layer_splits]), num_classes, sigmoid)
                    )
            end
        end
    end
    return model
end

#==================================================================================#
# 4. Model training functions

# Train-test splitter
function train_test_split(grammar_strings, prop, alphabetLength)
    indx  = Int(floor(length(grammar_strings.string)*(1-prop)))

    alphabet = collect('a':'z')[1:Int(alphabetLength)]

    split_strings = [collect(s) for s in grammar_strings.string]

    encodings = map(x -> Flux.onehot.(x, String(alphabet)), split_strings)
    labels = grammar_strings.error

    # splitting the data ito train/test and strings and truth. 
    train_x = encodings[1:indx]
    train_y = labels[1:indx]
    test_x = encodings[indx+1:end]
    test_y = labels[indx+1:end]

    return train_x, train_y, test_x, test_y
end

# Early stopping function when loss stops changing
function stop_early(prev_loss, current_loss, min_diff)
    diff = abs(prev_loss - current_loss)
    if diff < min_diff
        return true
    else
        return false
    end
end

# Define Brier Score functionction brier_score(preds, outs)
function brier_score(preds, outs)
    BS = 1/length(outs) * sum(sum(square.(preds - outs), dims=1), dims=2)
    return BS[1,1]
end

function agl_predict(model, tx, ty, recurrence, stringLength)
    if recurrence
        Flux.reset!(model)
        tx = [hcat([x[i] for x in tx]...) for i in 1:stringLength]
    else
        tx = hcat([vcat(x...) for x in tx]...)
    end
    
    preds = model(tx)
    outs = ty
    return preds, outs
end

function training_loop(model, opt, train_x, train_y, test_x, test_y, n_epochs, batch_size, 
    modelID, grammarid, recurrence, reservoir, string_length, throttle = 0.000001, verbose = true)

    acc_losses = DataFrame(modelID = Int32[],
                            grammarid = Int32[], 
                            epoch = Int32[],
                            batch = Int32[],
                            loss = Float32[],
                            train_brier = Float32[],
                            test_brier = Float32[],
                            throttle = Float32[])
    
    opt_state = Flux.setup(opt, model)
    if reservoir && recurrence
        Flux.freeze!(opt_state.recurrent.layers[1])
    elseif reservoir && !recurrence
        Flux.freeze!(opt_state.layers[1])
    end
    
    prev_loss = 100 #set it high so training runs for at least one epoch
    batch = 1
    train_y = hcat(train_y...)
    test_y = hcat(test_y...)
    if recurrence
        x_train = train_x 
        x_test = test_x
    else
        x_train = hcat([vcat(x...) for x ∈ train_x]...)
        x_test = hcat([vcat(x...) for x ∈ test_x]...)
    end

    break_train = false
    for epoch in 1:n_epochs
        for idx in Iterators.partition(shuffle(1:size(x_train, 1)), batch_size)
            if recurrence
                Flux.reset!(model)
                x, y = x_train[idx], train_y[:, idx]
                x = [hcat([χ[i] for χ in x]...) for i in 1:string_length] # Reshape X for RNN format
            else
                x, y = x_train[:, idx], train_y[:, idx]
            end
            curr_loss, gs = Flux.withgradient(m -> Flux.logitbinarycrossentropy(m(x), y), model)
            opt_state, model = Flux.update!(opt_state, model, gs[1]) 

            train_preds, train_outs = agl_predict(model, train_x, train_y, recurrence, string_length)
            test_preds, test_outs = agl_predict(model, test_x, test_y, recurrence, string_length)

            dataframe = DataFrame(modelID = modelID,
                                    grammarid = grammarid,
                                    epoch = epoch,
                                    batch = batch,
                                    loss = curr_loss,
                                    train_brier = brier_score(train_preds, train_outs),
                                    test_brier = brier_score(test_preds, test_outs),
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
            @info "After epoch = $epoch" acc_losses.loss[end] acc_losses.train_brier[end] acc_losses.test_brier[end]
        end
        if break_train
            break
        end
    end
    if recurrence
        Flux.reset!(model)
    end
    return model, acc_losses
end

# L2 Regularizer helper function
pen_l2(x::AbstractArray) = sum(abs2, x)/2

# train model function
function train_model(grammar_strings, model, alphabet_length, string_length, n_epochs, modelID, recurrence, reservoir, 
                             throttle = 0.000001, batch_size = 10, prop_tests = 0.3, opt = Momentum(0.01, 0.95), verbose = true)

    # get train test split
    train_x, train_y, test_x, test_y = train_test_split(grammar_strings, prop_tests, alphabet_length)

    # make train/test columns for pretraining
    Train_str =  ["Train"]
    Test_str = ["Test"]
    grammar_strings.TrainOrTest = vcat(repeat(Train_str, length(train_x)), repeat(Test_str, length(test_x)))

    # test the model out on the strings we have, before we train the model
    probs_trainX, _ = agl_predict(model, train_x, train_y, recurrence, string_length)
    probs_testX, _ = agl_predict(model, test_x, test_y, recurrence, string_length)

    grammar_strings.initialProbs = Float32.(vec(hcat(probs_trainX, probs_testX)))

    ## Need to massage the train_x data into sequences of one-hot encoded vectors for each character: https://jldc.ch/post/seq2one-flux/
    model, acc_and_losses = training_loop(model, opt, train_x, train_y, test_x, test_y, n_epochs, batch_size,
                                          modelID, grammar_strings.grammarid[1], recurrence, reservoir, throttle, verbose)

    probs_trainX, _ = agl_predict(model, train_x, train_y, recurrence, string_length)
    probs_testX, _ = agl_predict(model, test_x, test_y, recurrence, string_length)

    grammar_strings.trainedProbs = Float32.(vec(hcat(probs_trainX, probs_testX)))

    # make column of modelIDs
    grammar_strings.modelID = vcat(repeat([modelID], nrow(grammar_strings)))

    grammar_strings.epochs = vcat(repeat([maximum(acc_and_losses.epoch)], nrow(grammar_strings)))

    return grammar_strings, acc_and_losses
end

#==================================================================================#