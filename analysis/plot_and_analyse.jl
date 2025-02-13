############################################# Plotting and Analysis of Results ##################################################
# Author: K. Voudouris
# Project Title: AGLProj
# Julia Version: 1.11.1
# MySQL version: 8.0.31
#################################################################################################################################

# Script Outline
# 0. Load packages & setup DB connection & define parameters
# 1. All sorts of plots and analyses.

#################################################################################################################################
# 0. Preamble

using DrWatson, Gadfly
quickactivate(".", "AGLProj")
include(srcdir("database.jl"))

# Import settings
settings = load_yaml("settings.yaml")

# Load parameters from YAML
load_parameters(settings, "grammar_parameters")
load_parameters(settings, "string_parameters")
load_parameters(settings, "model_parameters")

# Determine which machine is running the script
println("Please indicate the machine you are using to run the script:")
println("Press 1 for a headless remote server, on which the data are stored in the database.")
println("Press 2 for a local machine, on which the data are stored in local CSV files just for the purposes of visualisation.")
machine = readline()
if machine == "1"
    headless = true
    println("You are using a headless remote server.")
elseif machine == "2"
    headless = false
    println("You are using a local machine.")
else
    println("Invalid input. Please run the script again.")
    exit()
end

if headless
    # Connect to database
    con = database_connect(settings["db_credentials_secret"]["path"])
end

#################################################################################################################################
# 1. Plotting and Analysis

if headless
    post_training_data_query = "SELECT o.$(settings["tables"]["modeloutputs"]["columns"][6][1]), \
                                    o.$(settings["tables"]["modeloutputs"]["columns"][end][1]), \
                                    s.$(settings["tables"]["strings"]["columns"][5][1]), \
                                    g.$(settings["tables"]["grammars"]["columns"][2][1]), \
                                    g.$(settings["tables"]["grammars"]["columns"][3][1]), \
                                    m.$(settings["tables"]["models"]["columns"][2][1]), \
                                    m.$(settings["tables"]["models"]["columns"][3][1]), \
                                    m.$(settings["tables"]["models"]["columns"][4][1]), \
                                    m.$(settings["tables"]["models"]["columns"][5][1]) \
                                    FROM $(settings["tables"]["modeloutputs"]["name"]) o \
                                INNER JOIN $(settings["tables"]["grammars"]["name"]) g ON \
                                g.$(settings["tables"]["grammars"]["columns"][1][1]) = o.$(settings["tables"]["modeloutputs"]["columns"][2][1]) \
                                INNER JOIN $(settings["tables"]["models"]["name"]) m ON \
                                m.$(settings["tables"]["models"]["columns"][1][1]) = o.$(settings["tables"]["modeloutputs"]["columns"][4][1]) \
                                INNER JOIN $(settings["tables"]["strings"]["name"]) s ON \
                                s.$(settings["tables"]["strings"]["columns"][end][1]) = o.$(settings["tables"]["modeloutputs"]["columns"][3][1]) \
                                WHERE o.$(settings["tables"]["modeloutputs"]["columns"][5][1]) = \"Test\";"

    post_training_data = DBInterface.execute(con, post_training_data_query) |> DataFrame

    transform!(post_training_data, [:error, :posttrainprobs] => ((error, posttrainprobs) -> sqrt.((error .- posttrainprobs) .^ 2)) => :root_squared_error)

    CSV.write("./analysis/data/post_training_data.csv", post_training_data) # Save data to CSV to use on machine with GUI
else
    DataFrame(CSV.File("./analysis/data/post_training_data.csv")) # Load data from CSV (must be downloaded manually)

    # Set default plot size
    set_default_plot_size(6inch, 4inch)

    p = plot(post_training_data, x = :grammartype, y = :root_squared_error,
        #  color = :origin, 
        #  #size = :weight, 
        #  alpha = [0.5], 
        Geom.point,
        Stat.x_jitter(range=0.4),
        Scale.x_discrete,
        Theme(background_color = "white"),
        )
end