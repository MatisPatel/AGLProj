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

cat("Running beta regression...")

# 1. Prepare the data and model
post_training_data_summarised_analysis = post_training_data_summarised |>
  dplyr::mutate(
    `Brier Skill Score` = (`Brier Skill Score` + 3) / 4, # Scale to [0, 1] for the regression
    `Brier Skill Score` = ifelse(`Brier Skill Score` == 1, 0.99999, `Brier Skill Score`), # Ensure no negative values
  ) |>
  dplyr::rename(
    Brier_Skill_Score = `Brier Skill Score`)

model_beta <- brms::bf(
  Brier_Skill_Score ~ neurons + 
    laminations + 
    recurrence + 
    layers + 
    inputsize + 
    grammartype,
  phi ~ 1
  )

cat("Plotting priors...\n")

beta_priors <- c(
  brms::prior(normal(0, 0.5), class = "b"),                             # predictors are z-scored
  brms::prior(normal(logit(0.96), 0.6), class = "Intercept"),           # most data is around this region
  brms::prior(normal(log(20), 0.5), class = "Intercept", dpar = "phi")  # phi is the precision parameter, which we expect to be around 20
)

fit_prior <- brms::brm(
  model_beta,
  family = brms::Beta(link = "logit"),
  data   = post_training_data_summarised_analysis,              # empty data
  prior  = beta_priors,           # swap in a candidate set
  sample_prior = "only",
  iter   = 1000, chains = 1,
  backend = "cmdstanr", seed = 1997
)

yrep <- brms::posterior_predict(fit_prior, draws = 20) * 4 - 3
y_obs <- post_training_data_summarised_analysis$Brier_Skill_Score * 4 - 3

prior_plot <- bayesplot::ppc_dens_overlay(
  y    = y_obs,
  yrep = yrep
)

ggplot2::ggsave(
  filename = "plots/priors.pdf",
  plot     = prior_plot,
  width    = 5, height = 4,
  dpi      = 300
)

# 2. Fit the model
library(cmdstanr)
options(mc.cores = parallel::detectCores())  # for cmdstanr
cmdstanr::set_cmdstan_path()              
Sys.setenv(STAN_NUM_THREADS = 1)

fit_bss <- brms::brm(
  model_beta, family = brms::Beta(),
  data   = post_training_data_summarised_analysis, chains = 4, cores = 4,
  threads = brms::threading(3),
  iter   = 1500, seed = 1997,
  prior = beta_priors,
  control = list(adapt_delta = 0.95),
  backend  = "cmdstanr",
  save_model = "model_saves/bss.stan"
)

fit_bss  <- update(fit_bss, control = list(adapt_delta = 0.95), recompile = FALSE)

saveRDS(fit_bss, "model_saves/beta_regression.RDS")


# 3. Plot marginals
marginal_grid <- tidyr::expand_grid(
  recurrence = c("FFN", "RNN", "GRU"),
  neurons = seq(32, 512, 32),
  laminations = c("Dense", "Laminated"),
  layers = c(1, 2, 3),
  grammartype = levels_vec,
  inputsize = seq(1:12)
)

student_bayes_pred_type <- fit_bss |> 
  tidybayes::epred_draws(newdata = marginal_grid) |> 
  dplyr::group_by(recurrence, .draw) |> 
  dplyr::summarise(estimate = (mean(.epred) * 4) - 3, .groups = "drop") # Average over marginals

model_type_marginals <- ggplot2::ggplot(student_bayes_pred_type, ggplot2::aes(x = estimate, y = recurrence, fill = recurrence)) +
  ggdist::stat_halfeye(.width = c(0.8, 0.95), point_interval = "median_hdi") +
  ggplot2::scale_x_continuous(limits = c(-3, 1)) +
  ggplot2::scale_fill_viridis_d(option = "plasma", end = 0.8) +
  ggplot2::guides(fill = "none") +
  ggplot2::labs(x = "Predicted Brier Skill Score", y = NULL,
       caption = "80% and 95% credible intervals shown in black") +
  ggthemes::theme_clean() + 
    ggplot2::theme(text=ggplot2::element_text(size=20), 
          axis.text=ggplot2::element_text(size=20), 
          axis.title=ggplot2::element_text(size=20), 
          plot.title=ggplot2::element_text(size=20), 
          legend.text=ggplot2::element_text(size=20), 
          legend.title=ggplot2::element_text(size=20))

ggplot2::ggsave(file="plots/model_type_marginals.pdf", plot=model_type_marginals, width=10, height=8)

student_bayes_pred_grammars <- fit_bss |> 
  tidybayes::epred_draws(newdata = marginal_grid) |> 
  dplyr::group_by(grammartype, .draw) |> 
  dplyr::summarise(estimate = (mean(.epred) * 4) - 3, .groups = "drop") # Average over marginals

grammar_type_marginals <- ggplot2::ggplot(student_bayes_pred_grammars, ggplot2::aes(x = estimate, y = grammartype, fill = grammartype)) +
  ggdist::stat_halfeye(.width = c(0.8, 0.95), point_interval = "median_hdi") +
  ggplot2::scale_x_continuous(limits = c(0, 0.5)) +
  ggplot2::scale_fill_viridis_d(option = "plasma", end = 0.8) +
  ggplot2::guides(fill = "none") +
  ggplot2::labs(x = "Predicted Brier Skill Score", y = NULL,
       caption = "80% and 95% credible intervals shown in black") +
  ggthemes::theme_clean() + 
    ggplot2::theme(text=ggplot2::element_text(size=20), 
          axis.text=ggplot2::element_text(size=20), 
          axis.title=ggplot2::element_text(size=20), 
          plot.title=ggplot2::element_text(size=20), 
          legend.text=ggplot2::element_text(size=20), 
          legend.title=ggplot2::element_text(size=20))

ggplot2::ggsave(file="plots/grammars_marginals.pdf", plot=grammar_type_marginals, width=10, height=8)

student_bayes_pred_lams <- fit_bss |> 
  tidybayes::epred_draws(newdata = marginal_grid) |> 
  dplyr::group_by(laminations, .draw) |> 
  dplyr::summarise(estimate = (mean(.epred) * 4) - 3, .groups = "drop") # Average over marginals

laminations_marginals <- ggplot2::ggplot(student_bayes_pred_lams, ggplot2::aes(x = estimate, y = laminations, fill = laminations)) +
  ggdist::stat_halfeye(.width = c(0.8, 0.95), point_interval = "median_hdi") +
  ggplot2::scale_x_continuous(limits = c(-3, 1)) +
  ggplot2::scale_fill_viridis_d(option = "plasma", end = 0.8) +
  ggplot2::guides(fill = "none") +
  ggplot2::labs(x = "Predicted Brier Skill Score", y = NULL,
                caption = "80% and 95% credible intervals shown in black") +
  ggthemes::theme_clean() + 
  ggplot2::theme(text=ggplot2::element_text(size=20), 
                 axis.text=ggplot2::element_text(size=20), 
                 axis.title=ggplot2::element_text(size=20), 
                 plot.title=ggplot2::element_text(size=20), 
                 legend.text=ggplot2::element_text(size=20), 
                 legend.title=ggplot2::element_text(size=20))

ggplot2::ggsave(file="plots/laminations_marginals.pdf", plot=laminations_marginals, width=10, height=8)

student_bayes_pred_neurs <- fit_bss |> 
  tidybayes::epred_draws(newdata = marginal_grid) |> 
  dplyr::group_by(neurons, .draw) |> 
  dplyr::summarise(estimate = (mean(.epred) * 4) - 3, .groups = "drop") # Average over marginals

neurons_marginals <- ggplot2::ggplot(student_bayes_pred_neurs, ggplot2::aes(x = neurons, y = estimate)) +
  ggdist::stat_lineribbon() + 
  ggplot2::scale_y_continuous(limits = c(-3, 1)) +
  ggplot2::scale_fill_brewer(palette = "Purples") +
  ggplot2::labs(x = "Number of Neurons", y = "Predicted Brier Skill Score",
       fill = "Credible interval") +
  ggthemes::theme_clean() +
  ggplot2::theme(legend.position = "bottom",
        text=ggplot2::element_text(size=20), 
        axis.text=ggplot2::element_text(size=20), 
        axis.title=ggplot2::element_text(size=20), 
        plot.title=ggplot2::element_text(size=20), 
        legend.text=ggplot2::element_text(size=20), 
        legend.title=ggplot2::element_text(size=20))

ggplot2::ggsave(file="plots/neurons_marginals.pdf", plot=neurons_marginals, width=10, height=8)

student_bayes_pred_layers <- fit_bss |> 
  tidybayes::epred_draws(newdata = marginal_grid) |> 
  dplyr::group_by(layers, .draw) |> 
  dplyr::summarise(estimate = (mean(.epred) * 4) - 3, .groups = "drop") # Average over marginals

layers_marginals <- ggplot2::ggplot(student_bayes_pred_layers, ggplot2::aes(x = layers, y = estimate)) +
  ggdist::stat_lineribbon() + 
  ggplot2::scale_y_continuous(limits = c(-3, 1)) +
  ggplot2::scale_fill_brewer(palette = "Purples") +
  ggplot2::labs(x = "Number of Layers", y = "Predicted Brier Skill Score",
       fill = "Credible interval") +
  ggthemes::theme_clean() +
  ggplot2::theme(legend.position = "bottom",
        text=ggplot2::element_text(size=20), 
        axis.text=ggplot2::element_text(size=20), 
        axis.title=ggplot2::element_text(size=20), 
        plot.title=ggplot2::element_text(size=20), 
        legend.text=ggplot2::element_text(size=20), 
        legend.title=ggplot2::element_text(size=20))

ggplot2::ggsave(file="plots/layers_marginals.pdf", plot=layers_marginals, width=10, height=8)

student_bayes_pred_inputs <- fit_bss |> 
  tidybayes::epred_draws(newdata = marginal_grid) |> 
  dplyr::group_by(inputsize, .draw) |> 
  dplyr::summarise(estimate = (mean(.epred) * 4) - 3, .groups = "drop") # Average over marginals

inputs_marginals <- ggplot2::ggplot(student_bayes_pred_inputs, ggplot2::aes(x = inputsize, y = estimate)) +
  ggdist::stat_lineribbon() + 
  ggplot2::scale_y_continuous(limits = c(-3, 1)) +
  ggplot2::scale_fill_brewer(palette = "Purples") +
  ggplot2::labs(x = "Input size", y = "Predicted Brier Skill Score",
       fill = "Credible interval") +
  ggthemes::theme_clean() +
  ggplot2::theme(legend.position = "bottom",
        text=ggplot2::element_text(size=20), 
        axis.text=ggplot2::element_text(size=20), 
        axis.title=ggplot2::element_text(size=20), 
        plot.title=ggplot2::element_text(size=20), 
        legend.text=ggplot2::element_text(size=20), 
        legend.title=ggplot2::element_text(size=20))

ggplot2::ggsave(file="plots/inputs_marginals.pdf", plot=inputs_marginals, width=10, height=8)


sink("./results/regressions/student_regression.txt")

cat("Fixed effects Beta On Brier Skill Score\n")

summary(fit_brms_fixed)

sink()

cat("Done!")
