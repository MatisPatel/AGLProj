using CSV, DataFrames, MySQL, Optimisers, YAML

#==================================================================================#
# General helper functions

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
        else
            if settings["tables"][t]["delete_and_rebuild"]
                println("Rebuilt table $(table["name"]).")
            end
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
        println("Dropping table $(name)...")
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
        function _evaluate_strings(col_entry, type)
            if length(col_entry) == 3 && type == "column"
                x = col_entry[3]
                m = match(r"%.*%", col_entry[2])
                interp = replace(replace(m.match, "x" => string(x)), "%" => "")
                out = eval(Meta.parse(interp))
                col_entry[2] = replace(col_entry[2], r"%.*%" => string(out))
            elseif type == "constraint"
                x = col_entry[2]
                m = match(r"%.*%", col_entry[1])
                if length(col_entry) == 3
                    y = col_entry[3]
                    interp = replace(replace(m.match, "x" => string(x), "y" => string(y)), "%" => "")
                else
                    interp = replace(m.match, "x" => string(x), "%" => "")
                end
                out = eval(Meta.parse(interp))
                col_entry[1] = replace(col_entry[1], r"%.*%" => string(out))
            end
            return col_entry
        end
    
        for table in keys(yaml_dict["tables"])
            for column in 1:length(yaml_dict["tables"][table]["columns"])
                replaced = _evaluate_strings(yaml_dict["tables"][table]["columns"][column], "column")
                yaml_dict["tables"][table]["columns"][column] = replaced
            end
            if "constraint" in keys(yaml_dict["tables"][table])
                if isa(yaml_dict["tables"][table]["constraint"], Array) && length(yaml_dict["tables"][table]["constraint"]) > 1
                    replaced_constraint = _evaluate_strings(yaml_dict["tables"][table]["constraint"], "constraint")
                    yaml_dict["tables"][table]["constraint"] = replaced_constraint[1]
                end
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

        grammar_fields = ["alphabet_length", "max_k_grams", "max_num_constraints", "max_threshold", "max_num_precedence_relations", "num_grammars", "seed"]
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
                        "num_errors", "alphabet_length", "string_length", "n_epochs",
                        "batch_size", "prop_test", "opt", "seed"]
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
            error("Table $(t) is not in the database.")
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
        global max_k_grams = settings["grammar_parameters"]["max_k_grams"]
        global num_grammars = settings["grammar_parameters"]["num_grammars"]
        global max_num_constraints = settings["grammar_parameters"]["max_num_constraints"]
        global max_threshold = settings["grammar_parameters"]["max_threshold"]
        global max_num_precedence_relations = settings["grammar_parameters"]["max_num_precedence_relations"]
        global grammar_seed = settings["grammar_parameters"]["seed"]
        global alphabet = 'a':'z'
        global grammar_connections = alphabet_length*2:alphabet_length^2-alphabet_length
        println("Loading grammar parameters: alphabet_length ($(alphabet_length)), max_k_grams ($(max_k_grams)), num_grammars ($(num_grammars)),\
        max_num_constraints ($(max_num_constraints)), max_threshold ($(max_threshold)), max_num_precedence_relations ($(max_num_precedence_relations)),\
        grammar_seed ($(grammar_seed)), alphabet ($(alphabet)), grammar_connections ($(grammar_connections)).")
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
        global n_epochs = settings["model_parameters"]["n_epochs"]
        global batch_size = settings["model_parameters"]["batch_size"]
        global prop_test = Float32(settings["model_parameters"]["prop_test"])
        global opt = eval(Meta.parse(settings["model_parameters"]["opt"]))
        println("Loading model parameters: min_num_neurons ($(min_num_neurons)), max_num_neurons ($(max_num_neurons)), neuron_increments ($(neuron_increments)),\
        min_num_layers ($(min_num_layers)), max_num_layers ($(max_num_layers)), max_num_laminations ($(max_num_laminations)), num_errors ($(num_errors)),\
        alphabet_length ($(alphabet_length)), string_length ($(string_length)), model_seed ($(model_seed)), reservoir_scaling_factor ($(reservoir_scaling_factor)),\
        n_epochs ($(n_epochs)), batch_size ($(batch_size)), prop_test ($(prop_test)), opt ($(settings["model_parameters"]["opt"])).")
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

function build_batch_insert_query(tab_name, col_names, value_dataframe)
    if length(col_names) == size(value_dataframe)[2]
        values = join([join(collect(value_dataframe[i, :]), ", ") for i in 1:size(value_dataframe)[1]], "), (")
        query = """INSERT INTO $(tab_name) (\
                    $(join(col_names, ", "))\
                    ) VALUES \
                    ($(values));\
                    """
        return query
    else
        error("Number of columns and number of values do not match.")
    end
end