############################################# Plotting and Analysis of Results ##################################################
# Author: K. Voudouris
# Project Title: AGLProj
# R Version: 4.4.1
#################################################################################################################################

# Script Outline
# 0. Load packages & setup DB connection & define parameters
# 1. All sorts of plots and analyses.

#################################################################################################################################
# 0. Preamble

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
      dplyr::mutate(`Inverse Brier Score` = 1.0 - `Brier Score`,
                    recurrence = ifelse(recurrence == 0, "FFN",
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
                                      ),
                    `Brier Skill Score` = 1 - (`Brier Score`/0.25) # The reference is 0.25 assuming 500 grammatical and 500 ungrammatical strings per grammar.
                    )
    
    write.csv(post_training_data_summarised, "data/data_summary.csv", row.names = FALSE)

    DBI::dbDisconnect(myDB)

} else {
    cat("Loading data from file...\n")
    post_training_data_summarised <- read.csv("data/data_summary.csv", stringsAsFactors = FALSE) |>
      dplyr::rename(`Brier Score` = `Brier.Score`) |>
      dplyr::mutate(`Brier Score` = `Brier Score`,
                    `Inverse Brier Score` = 1.0 - `Brier Score`,
                    recurrence = factor(recurrence, levels = c("FFN", "RNN", "GRU")),
                    laminations = factor(laminations, levels = c("Dense", "Laminated")),
                    grammartype = factor(grammartype, levels = c("SL", "LT", "LTT", "LTTO", "MSO", "CS", "CF")),
                    `Brier Skill Score` = 1.0 - (`Brier Score` / 0.25))
}



#################################################################################################################################
# 1. Plotting

cat("Plotting architecture averages...\n")

post_training_data_summarised_architecture <- post_training_data_summarised |>
  dplyr::group_by(grammartype, recurrence, inputsize) |>
  dplyr::mutate(mean.brier = mean(`Brier Skill Score`)) |>
  dplyr::ungroup() |> dplyr::group_by(grammartype, recurrence) |>
  dplyr::filter(inputsize == inputsize[which.max(mean.brier)]) |>
  dplyr::ungroup()

# define the exact order of grammar types
levels_vec <- c("SL", "LT", "LTT", "LTTO", "MSO", "CF", "CS")

max_sizes <- post_training_data_summarised_architecture |>
  dplyr::group_by(recurrence, grammartype) |>
  dplyr::summarise(
    max_input = max(inputsize)/6,
    .groups   = "drop"
  )

# build the bar‐chart with mean, median, and 95% CI
plot <- ggplot2::ggplot(
  data = post_training_data_summarised_architecture,
  mapping = ggplot2::aes(
    x    = factor(grammartype, levels = levels_vec),
    y    = `Brier Skill Score`,
    fill = recurrence
  )
) +
  # 1) bars = mean
  ggplot2::geom_bar(
    stat     = "summary",
    fun      = "mean",
    position = ggplot2::position_dodge(width = 0.9),
    width    = 0.8
  ) +
  # 2) errorbars = 95% normal‐theory CI around the mean
  ggplot2::stat_summary(
    fun.data = ggplot2::mean_cl_normal,
    fun.args = list(conf.int = 0.95),
    geom     = "errorbar",
    position = ggplot2::position_dodge(width = 0.9),
    width    = 0.2,
    size     = 0.7,
    color    = "black"
  ) +
  # vertical dashed lines BETWEEN each grammar type
  ggplot2::geom_vline(
    xintercept = seq(1.5, length(levels_vec) - 0.5, by = 1),
    linetype   = "dashed",
    color      = "grey80",
    size       = 0.5,
    show.legend = FALSE
  ) +
  # annotate min_input at the base of each bar
  ggplot2::geom_text(
    data     = max_sizes,
    mapping  = ggplot2::aes(
      x     = factor(grammartype, levels = levels_vec),
      y     = 0.05,
      label = max_input,
      group = recurrence
    ),
    position = ggplot2::position_dodge(width = 0.9),
    vjust    = 1.5,
    color    = "white",
    size     = 5
  ) +
  # facets and theme
  # ggplot2::facet_grid(. ~ laminations) +
  ggplot2::theme_minimal(base_size = 20) +
  ggplot2::theme(
    axis.text.x       = ggplot2::element_text(angle = 90, vjust = 0.5, hjust = 1),
    panel.grid.major  = ggplot2::element_blank(),
    panel.grid.minor  = ggplot2::element_blank(),
    panel.border      = ggplot2::element_rect(color = "grey80", fill = NA, linewidth = 0.5),
    panel.spacing     = grid::unit(1, "lines"),
    legend.text       = ggplot2::element_text(size = 20),
    legend.title      = ggplot2::element_text(size = 20)
  ) +
  ggplot2::xlab("Grammar Type") +
  ggplot2::guides(fill = ggplot2::guide_legend(title = "Architecture Type"))

# save to pdf
ggplot2::ggsave(
  filename = "plots/grammar_by_architecture_type_bar.pdf",
  plot     = plot,
  width    = 10,
  height   = 8
)


cat("Plotting input sizes...\n")

post_training_data_summarised_inputs <- post_training_data_summarised |>
  dplyr::filter(recurrence != "FFN") |>
  dplyr::group_by(grammartype, inputsize, recurrence) |>
  dplyr::mutate(inputsize = factor(inputsize/6, levels = c(1:12)))

plot <- ggplot2::ggplot(
  data = post_training_data_summarised_inputs,
  mapping = ggplot2::aes(
    x    = factor(grammartype, levels = levels_vec),
    y    = `Brier Skill Score`,
    fill = inputsize
  )
) +
  # 1) bars = mean
  ggplot2::geom_bar(
    stat     = "summary",
    fun      = "mean",
    position = ggplot2::position_dodge(width = 0.9),
    width    = 0.8
  ) +
  # 2) errorbars = 95% normal‐theory CI around the mean
  ggplot2::stat_summary(
    fun.data = ggplot2::mean_cl_normal,
    fun.args = list(conf.int = 0.95),
    geom     = "errorbar",
    position = ggplot2::position_dodge(width = 0.9),
    width    = 0.2,
    size     = 0.7,
    color    = "black"
  ) +
  # vertical dashed lines BETWEEN each grammar type
  ggplot2::geom_vline(
    xintercept = seq(1.5, length(levels_vec) - 0.5, by = 1),
    linetype   = "dashed",
    color      = "grey80",
    size       = 0.5,
    show.legend = FALSE
  ) +
  ggplot2::facet_grid(. ~ recurrence) +
  ggplot2::theme_minimal(base_size = 20) +
  ggplot2::theme(
    axis.text.x       = ggplot2::element_text(angle = 90, vjust = 0.5, hjust = 1),
    panel.grid.major  = ggplot2::element_blank(),
    panel.grid.minor  = ggplot2::element_blank(),
    panel.border      = ggplot2::element_rect(color = "grey80", fill = NA, linewidth = 0.5),
    panel.spacing     = grid::unit(1, "lines"),
    legend.text       = ggplot2::element_text(size = 20),
    legend.title      = ggplot2::element_text(size = 20)
  ) +
  ggplot2::xlab("Grammar Type") +
  ggplot2::guides(fill = ggplot2::guide_legend(title = "Input Size"))


ggplot2::ggsave(file="plots/grammar_by_input_size.pdf", plot=plot, width=16, height=8)                                                                


cat("Plotting neurons...\n")

post_training_data_summarised_neurons <- post_training_data_summarised |>
  dplyr::mutate(neurons = factor(neurons, levels  = seq(32, 512, 32)))

plot <- ggplot2::ggplot(
  data = post_training_data_summarised_neurons,
  mapping = ggplot2::aes(
    x    = factor(grammartype, levels = levels_vec),
    y    = `Brier Skill Score`,
    fill = neurons
  )
) +
  # 1) bars = mean
  ggplot2::geom_bar(
    stat     = "summary",
    fun      = "mean",
    position = ggplot2::position_dodge(width = 0.9),
    width    = 0.8
  ) +
  # 2) errorbars = 95% normal‐theory CI around the mean
  ggplot2::stat_summary(
    fun.data = ggplot2::mean_cl_normal,
    fun.args = list(conf.int = 0.95),
    geom     = "errorbar",
    position = ggplot2::position_dodge(width = 0.9),
    width    = 0.2,
    size     = 0.7,
    color    = "black"
  ) +
  # vertical dashed lines BETWEEN each grammar type
  ggplot2::geom_vline(
    xintercept = seq(1.5, length(levels_vec) - 0.5, by = 1),
    linetype   = "dashed",
    color      = "grey80",
    size       = 0.5,
    show.legend = FALSE
  ) +
  ggplot2::facet_grid(. ~ recurrence) +
  ggplot2::theme_minimal(base_size = 20) +
  ggplot2::theme(
    axis.text.x       = ggplot2::element_text(angle = 90, vjust = 0.5, hjust = 1),
    panel.grid.major  = ggplot2::element_blank(),
    panel.grid.minor  = ggplot2::element_blank(),
    panel.border      = ggplot2::element_rect(color = "grey80", fill = NA, linewidth = 0.5),
    panel.spacing     = grid::unit(1, "lines"),
    legend.text       = ggplot2::element_text(size = 20),
    legend.title      = ggplot2::element_text(size = 20)
  ) +
  ggplot2::xlab("Grammar Type") +
  ggplot2::guides(fill = ggplot2::guide_legend(title = "Neurons"))


ggplot2::ggsave(file="plots/grammar_by_neurons.pdf", plot=plot, width=16, height=8)

cat("Plotting laminations...\n")

plot <- ggplot2::ggplot(
  data = post_training_data_summarised,
  mapping = ggplot2::aes(
    x    = factor(grammartype, levels = levels_vec),
    y    = `Brier Skill Score`,
    fill = laminations
  )
) +
  # 1) bars = mean
  ggplot2::geom_bar(
    stat     = "summary",
    fun      = "mean",
    position = ggplot2::position_dodge(width = 0.9),
    width    = 0.8
  ) +
  # 2) errorbars = 95% normal‐theory CI around the mean
  ggplot2::stat_summary(
    fun.data = ggplot2::mean_cl_normal,
    fun.args = list(conf.int = 0.95),
    geom     = "errorbar",
    position = ggplot2::position_dodge(width = 0.9),
    width    = 0.2,
    size     = 0.7,
    color    = "black"
  ) +
  # vertical dashed lines BETWEEN each grammar type
  ggplot2::geom_vline(
    xintercept = seq(1.5, length(levels_vec) - 0.5, by = 1),
    linetype   = "dashed",
    color      = "grey80",
    size       = 0.5,
    show.legend = FALSE
  ) +
  ggplot2::facet_grid(. ~ recurrence) +
  ggplot2::theme_minimal(base_size = 20) +
  ggplot2::theme(
    axis.text.x       = ggplot2::element_text(angle = 90, vjust = 0.5, hjust = 1),
    panel.grid.major  = ggplot2::element_blank(),
    panel.grid.minor  = ggplot2::element_blank(),
    panel.border      = ggplot2::element_rect(color = "grey80", fill = NA, linewidth = 0.5),
    panel.spacing     = grid::unit(1, "lines"),
    legend.text       = ggplot2::element_text(size = 20),
    legend.title      = ggplot2::element_text(size = 20)
  ) +
  ggplot2::xlab("Grammar Type") +
  ggplot2::guides(fill = ggplot2::guide_legend(title = "Lamination"))


ggplot2::ggsave(file="plots/grammar_by_lamination.pdf", plot=plot, width=16, height=8)

cat("Plotting layers...\n")

post_training_data_summarised_layers <- post_training_data_summarised |>
  dplyr::mutate(layers = factor(layers, levels  = c(1:3)))

plot <- ggplot2::ggplot(
  data = post_training_data_summarised_layers,
  mapping = ggplot2::aes(
    x    = factor(grammartype, levels = levels_vec),
    y    = `Brier Skill Score`,
    fill = layers
  )
) +
  # 1) bars = mean
  ggplot2::geom_bar(
    stat     = "summary",
    fun      = "mean",
    position = ggplot2::position_dodge(width = 0.9),
    width    = 0.8
  ) +
  # 2) errorbars = 95% normal‐theory CI around the mean
  ggplot2::stat_summary(
    fun.data = ggplot2::mean_cl_normal,
    fun.args = list(conf.int = 0.95),
    geom     = "errorbar",
    position = ggplot2::position_dodge(width = 0.9),
    width    = 0.2,
    size     = 0.7,
    color    = "black"
  ) +
  # vertical dashed lines BETWEEN each grammar type
  ggplot2::geom_vline(
    xintercept = seq(1.5, length(levels_vec) - 0.5, by = 1),
    linetype   = "dashed",
    color      = "grey80",
    size       = 0.5,
    show.legend = FALSE
  ) +
  ggplot2::facet_grid(. ~ recurrence) +
  ggplot2::theme_minimal(base_size = 20) +
  ggplot2::theme(
    axis.text.x       = ggplot2::element_text(angle = 90, vjust = 0.5, hjust = 1),
    panel.grid.major  = ggplot2::element_blank(),
    panel.grid.minor  = ggplot2::element_blank(),
    panel.border      = ggplot2::element_rect(color = "grey80", fill = NA, linewidth = 0.5),
    panel.spacing     = grid::unit(1, "lines"),
    legend.text       = ggplot2::element_text(size = 20),
    legend.title      = ggplot2::element_text(size = 20)
  ) +
  ggplot2::xlab("Grammar Type") +
  ggplot2::guides(fill = ggplot2::guide_legend(title = "Layers"))


ggplot2::ggsave(file="plots/grammar_by_layers.pdf", plot=plot, width=16, height=8)
 

#################################################################################################################################
# 2. Analysis

# 1. Prepare the data and model
post_training_data_summarised_analysis = post_training_data_summarised |>
  dplyr::mutate(
    Brier_Skill_Score = (`Brier Skill Score` + 3) / 4, # Scale to [0, 1] for the regression
    Brier_Skill_Score = (Brier_Skill_Score * (dplyr::n() - 1) + 0.5) / dplyr::n(), # Apply Smithson-Verkuilen shrinkage to transform 0s and 1s.
  ) 

form_beta_main <- Brier_Skill_Score ~ recurrence + laminations + inputsize + grammartype

sink("results/beta_regression_output.txt", split = TRUE)

cat("Fitting Beta regression with no interactions...\n")
beta_fit_main <- betareg::betareg(
  form_beta_main,
  data   = post_training_data_summarised_analysis,
  link   = "logit",        # mean link
  link.phi = "log",        # precision parameter
  type   = "ML"            # maximum‑likelihood estimation
)

cat("\n=====  Model summary  =====\n")
print(summary(beta_fit_main))

emm_rec <- emmeans::emmeans(beta_fit_main, ~ recurrence)
cat("\n=====  EMMEANS: recurrence  =====\n")
print(emm_rec)

cat("\n=====  Pairwise contrasts (recurrence) =====\n")
print(pairs(emm_rec))

emm_lams <- emmeans::emmeans(beta_fit_main, ~ laminations)
cat("\n=====  EMMEANS: lamination  =====\n")
print(emm_lams)

cat("\n=====  Pairwise contrasts (lamination) =====\n")
print(pairs(emm_lams))

emm_gram <- emmeans::emmeans(beta_fit_main, ~ grammartype)
cat("\n=====  EMMEANS: grammartype  =====\n")
print(emm_gram)

cat("\n=====  Pairwise contrasts (grammartype) =====\n")
print(pairs(emm_gram))

emm_input <- emmeans::emtrends(beta_fit_main, specs = ~ 1, var = "inputsize")
cat("\n=====  EMTREND: input size  =====\n")
summary(emm_input)

form_beta_interaction <- Brier_Skill_Score ~ recurrence + laminations + inputsize + grammartype + (recurrence*grammartype) + (laminations*grammartype) + (inputsize*grammartype)

cat("Fitting Beta regression with interactions with grammartype and laminations/recurrence...\n")
beta_fit_interaction <- betareg::betareg(
  form_beta_interaction,
  data   = post_training_data_summarised_analysis,
  link   = "logit",        # mean link
  link.phi = "log",        # precision parameter
  type   = "ML"            # maximum‑likelihood estimation
)

cat("\n=====  Model summary  =====\n")
print(summary(beta_fit_interaction))

emm_rec_gram <- emmeans::emmeans(beta_fit_interaction, ~ recurrence * grammartype)
cat("\n=====  EMMEANS: recurrence × grammartype  =====\n")
print(emm_rec_gram)

cat("\n=====  Pairwise contrasts (recurrence)  =====\n")
print(pairs(emm_rec_gram, by = "grammartype"))

emm_lams_gram <- emmeans::emmeans(beta_fit_interaction, ~ laminations * grammartype)
cat("\n=====  EMMEANS: laminations × grammartype  =====\n")
print(emm_lams_gram)

cat("\n=====  Pairwise contrasts (laminations)  =====\n")
print(pairs(emm_lams_gram, by = "grammartype"))

emm_input_gram <- emmeans::emtrends(beta_fit_interaction, specs = ~ grammartype, var = "inputsize")
cat("\n=====  EMTREND: input size  =====\n")
summary(emm_input_gram)

sink()
