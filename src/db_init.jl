## Functions for initialising database

using DrWatson
@quickactivate "AGLProj"
using CSV, DataFrames
using MySQL
using YAML

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

db_connection = settings["db_credentials_secret"]["path"]

con = database_connect(db_connection)

DBInterface.close!(con)

function _yaml_code_interpreter(yaml_dict)
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

    for table in 1:length(yaml_dict["tables"])
        for column in 1:length(yaml_dict["tables"][table]["columns"])
             replaced = _evaluate_strings(yaml_dict["tables"][table]["columns"][column])
             yaml_dict["tables"][table]["columns"][column] = replaced
        end
    end
    return yaml_dict
end


function _db_table_builder(yaml_table_field_element, con)
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

function _yaml_loader(yaml_file_name)
    yaml_location = projectdir("src", yaml_file_name)
    if isfile(yaml_location)
        settings = YAML.load_file(yaml_location)

        settings = _yaml_code_interpreter(settings)

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
                        "min_num_layers", "max_num_layers", "max_num_laminations", "seed"]
        for f in model_fields
            if !(f in keys(settings["model_parameters"]))
                error("$(f) field is missing from model_parameters in YAML at $(yaml_location)! Please copy the template.")
            end
        end

        if !("path" in keys(settings["db_credentials_secret"]))
            error("path field is missing from db_credentials_secret in YAML at $(yaml_location)! Please copy the template.")
        end

        table_fields = ["name", "columns", "delete_and_rebuild"]
        for t in settings["tables"]
            for f in table_fields
                if !(f in keys(t))
                    if f != "name"
                        error("$(f) field is missing from table named $(t["name"]) in YAML at $(yaml_location)! Please copy the template.")
                    else
                        error("The $(f) is missing from one of the tables listed in YAML at $(yaml_location)! Please copy the template.")
                    end
                end
            end
        end

        if length(settings["tables"]) != 5
            error("Only $(length(settings["tables"])) found in YAML at $(yaml_location)! There should be 5. Please copy the template.")
        end

        return settings

    else
        error("YAML file not found. Please add it to the src folder.")
    end


end

function check_database(yaml_settings_name)
    settings = _yaml_loader(yaml_settings_name)
    db_connection_path = settings["db_credentials_secret"]["path"]

    _ = database_connect(db_connection_path, true) # db connection unit test

    con = database_connect(db_connection_path, false)

    tables = DBInterface.execute(con, "SHOW TABLES;") |> DataFrame

    for t in settings["tables"]
        if !(t["name"] in tables[!, 1])
            error("Table $(t["name"]) is not in the database.")
        end

        columns = DBInterface.execute(con, "SHOW COLUMNS FROM $(t["name"]);") |> DataFrame

        for c in t["columns"]
            if !(c[1] in columns.Field)
                error("Column $(c[1]) is not in Table $(t["name"]).")
            end
        end
    end

    DBInterface.close!(con)

    return true

end


function db_initialiser(yaml_settings_name)
    settings = _yaml_loader(yaml_settings_name)

    db_connection_path = settings["db_credentials_secret"]["path"]
    con = database_connect(db_connection_path)
    
    println("Initialising database...")
    for table in settings["tables"]
        build = _db_table_builder(table, con)
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
    return nothing
end

