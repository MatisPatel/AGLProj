#################################################################################################################################

# Script Outline
# 0. Load packages & setup DB connection & define parameters
# 1. All sorts of plots and analyses.

#################################################################################################################################
# 0. Preamble
library(tidyverse)
library(here)

here::i_am("scripts/R/plotting_and_analysis.R")

database.connect <- function(csv.name, dbPort = 3306){
    database_connection <- utils::read.csv(paste0("./src/", csv.name))

    dbName = database_connection$Value[1]
    dbUsername = database_connection$Value[2]
    dbPassword = database_connection$Value[3]
    dbHostname = database_connection$Value[4]

    myDB <- DBI::dbConnect(RMariaDB::MariaDB(), 
                           user = dbUsername, 
                           password = dbPassword, 
                           dbname = dbName, 
                           host = dbHostname, 
                           port = dbPort)
    cat("Connected to database!\n")
    return(myDB)
}

settings <- yaml::read_yaml(paste0("./src/settings.yaml"))

recollect_database_data <- FALSE

#################################################################################################################################
# 0. Summarise data and store

if (recollect_database_data || !file.exists("data/data_summary.csv")) {
    cat("Recollecting database data...\n")
    myDB <- database.connect("database_connection.csv")

    cat("Getting post training data...\n")

    query <- glue::glue("SELECT g.{settings$tables$grammars$columns[[1]][1]}, m.{settings$tables$models$columns[[1]][1]}, 
    o.{settings$tables$modeloutputs$columns[[6]][1]}, o.{settings$tables$modeloutputs$columns[[7]][1]}, 
    s.{settings$tables$strings$columns[[5]][1]}, 
    g.{settings$tables$grammars$columns[[2]][1]}, g.{settings$tables$grammars$columns[[3]][1]}, g.{settings$tables$grammars$columns[[4]][1]},
    m.{settings$tables$models$columns[[2]][1]}, m.{settings$tables$models$columns[[3]][1]}, m.{settings$tables$models$columns[[4]][1]}, 
    m.{settings$tables$models$columns[[5]][1]}, m.{settings$tables$models$columns[[6]][1]}, m.{settings$tables$models$columns[[10]][1]} FROM 
    {settings$tables$modeloutputs$name} o INNER JOIN {settings$tables$grammars$name} g ON 
    g.{settings$tables$grammars$columns[[1]][1]} = o.{settings$tables$modeloutputs$columns[[2]][1]} INNER JOIN 
    {settings$tables$models$name} m ON 
    m.{settings$tables$models$columns[[1]][1]} = o.{settings$tables$modeloutputs$columns[[4]][1]} INNER JOIN 
    {settings$tables$strings$name} s ON 
    s.{settings$tables$strings$columns[[6]][1]} = o.{settings$tables$modeloutputs$columns[[3]][1]} WHERE o.{settings$tables$modeloutputs$columns[[5]][1]} = \"Test\";")

    post_training_data <- DBI::dbGetQuery(myDB, query)

    cat("Summarising...\n")

    post_training_data_summarised <- post_training_data |>
      dplyr::mutate(root_squared_error = sqrt((posttrainprobs - error)^2)) |>
      dplyr::group_by(grammarid, modelid, kgrams, grammarsubtype, neurons, layers, inputsize, laminations, recurrence, gru) |>
      dplyr::summarise(`Brier Score` = sum(root_squared_error)/dplyr::n()) |>
      dplyr::mutate(recurrence = ifelse(recurrence == 0, "FFN",
                                ifelse(gru == 1, "GRU", "RNN")),
                    recurrence = factor(recurrence, levels = c("FFN", "RNN", "GRU")),
                    laminations = ifelse(laminations == 1, "Dense", "Laminated"),
                    grammartype = dplyr::case_when(
                                        grammarsubtype == "slk"    ~ "SL",
                                        grammarsubtype == "ltk"    ~ "LT",
                                        grammarsubtype == "lttk"   ~ "LTT",
                                        grammarsubtype == "lttko"  ~ "LTTO",
                                        grammarsubtype == "mso"    ~ "MSO",
                                        grammarsubtype == "AnBnCn" ~ "CS",
                                        TRUE                       ~ "CF"
                                      )
                    ) 
    
    write.csv(post_training_data_summarised, "data/data_summary.csv", row.names = FALSE)

    DBI::dbDisconnect(myDB)

} else {
    cat("Loading data from file...\n")
    post_training_data_summarised <- read.csv("data/data_summary.csv", stringsAsFactors = FALSE) |>
      dplyr::rename(`Brier Score` = `Brier.Score`) |>
      dplyr::mutate(recurrence = factor(recurrence, levels = c("FFN", "RNN", "GRU")),
                    laminations = factor(laminations, levels = c("Dense", "Laminated")),
                    grammartype = factor(grammartype, levels = c("SL", "LT", "LTT", "LTTO", "MSO", "CS", "CF")))
}

my_theme <- theme_bw() +
    theme(
    axis.text.x       = ggplot2::element_text(angle = 90, vjust = 0.5, hjust = 1),
    panel.grid.major  = ggplot2::element_blank(),
    panel.grid.minor  = ggplot2::element_blank(),
    panel.border      = ggplot2::element_rect(color = "grey80", fill = NA, size = 0.5),
    panel.spacing     = grid::unit(1, "lines"),
    legend.text       = ggplot2::element_text(size = 16),
    legend.title      = ggplot2::element_text(size = 16)
  )


#################################################################################################################################

print("Plotting architecture averages...\n")

post_training_data_summarised_architecture <- post_training_data_summarised |>
  group_by(grammartype, recurrence, inputsize) |>
  mutate(mean.brier = mean(`Brier Score`)) |>
  ungroup() |> group_by(grammartype, recurrence) |>
  filter(inputsize == inputsize[which.min(mean.brier)]) |>
  ungroup()

# define the exact order of grammar types
levels_vec <- c("SL", "LT", "LTT", "LTTO", "MSO", "CF", "CS")

min_sizes <- post_training_data_summarised_architecture |>
  dplyr::group_by(recurrence, grammartype) |>
  dplyr::summarise(
    min_input = min(inputsize)/6,
    .groups   = "drop"
  )

plt <- ggplot(post_training_data_summarised_architecture) +
    geom_boxplot(aes(grammartype, brier, fill=recurrence), outlier.shape=NA, notch=TRUE, position=position_dodge(width=1)) +
    facet_wrap(~ recurrence, scales="free_x") +
    scale_y_continuous(limits=c(0, 0.3)) +
    my_theme
plt


print("Plotting input sizes...\n")

post_training_data_summarised_inputs <- post_training_data_summarised |>
    filter(recurrence != "FFN") |>
    group_by(grammartype, inputsize, recurrence) |>
    mutate(inputsize = factor(inputsize/6, levels = c(1:12)))|>
    mutate(brier = `Brier Score`) |>
    summarise(
        mean_brier = mean(brier),
        sd_brier = sd(brier),
        n = n(),
        se_brier = sd_brier / sqrt(n),
        ci_lower = mean_brier - qt(0.975, df = n - 1) * se_brier,
        ci_upper = mean_brier + qt(0.975, df = n - 1) * se_brier
    )

plt <- ggplot(post_training_data_summarised_inputs)+
    geom_path(aes(as.numeric(inputsize), mean_brier, colour=grammartype)) +
    geom_ribbon(aes(as.numeric(inputsize), ymin=ci_lower, ymax=ci_upper, fill=grammartype), alpha=0.2) +
    facet_wrap(~ recurrence) +
    scale_x_continuous(breaks = c(1, 2, 3, 4, 5, 6, 7, 8, 9, 10, 11, 12)) +
    my_theme
plt 

