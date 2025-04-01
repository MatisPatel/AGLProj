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

myDB <- database.connect("database_connection.csv")

#################################################################################################################################
# 1. Plotting and Analysis

cat("Getting post training data...\n")

query <- glue::glue("SELECT g.{settings$tables$grammars$columns[[1]][1]}, m.{settings$tables$models$columns[[1]][1]}, 
o.{settings$tables$modeloutputs$columns[[6]][1]}, o.{settings$tables$modeloutputs$columns[[7]][1]}, 
s.{settings$tables$strings$columns[[5]][1]}, 
g.{settings$tables$grammars$columns[[2]][1]}, g.{settings$tables$grammars$columns[[3]][1]}, 
m.{settings$tables$models$columns[[2]][1]}, m.{settings$tables$models$columns[[3]][1]}, m.{settings$tables$models$columns[[4]][1]}, 
m.{settings$tables$models$columns[[5]][1]}, m.{settings$tables$models$columns[[6]][1]} FROM 
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
  dplyr::group_by(kgrams, grammartype, neurons, layers, laminations, recurrence, gru) |>
  dplyr::summarise(`Brier Score` = sum(root_squared_error)/dplyr::n()) |>
  dplyr::mutate(recurrence = ifelse(recurrence == 0, "FFN",
                            ifelse(gru == 1, "GRU", "RNN")),
                recurrence = factor(recurrence, levels = c("FFN", "RNN", "GRU")),
         laminations = ifelse(laminations == 1, "Dense",
                              ifelse(laminations == 2, "Laminated (2)", "Laminated (3)")),
         grammartype = ifelse(grammartype == "reg", "III",
                              ifelse(grammartype == "cfg_rep", "II",
                                     ifelse(grammartype == "cfg_mirr", "II",
                                            "I")))) 
                                            
post_training_data_summarised_for_plot <- post_training_data_summarised |>
  dplyr::filter(layers > 1)
 
cat("Plotting...\n")

plot <- ggplot2::ggplot(data = post_training_data_summarised_for_plot) +
  ggplot2::geom_boxplot(ggplot2::aes(x = factor(grammartype, level = c("III", 
                                                    "II", 
                                                    "I")), 
                  y = `Brier Score`, 
                  fill = factor(layers, level = c(1, 2, 3, 4, 5)))) +
  ggplot2::facet_grid(recurrence ~ laminations) + ggplot2::theme_minimal() + 
    ggplot2::theme(text=ggplot2::element_text(size=20), 
          axis.text=ggplot2::element_text(size=20), 
          axis.title=ggplot2::element_text(size=20), 
          plot.title=ggplot2::element_text(size=20), 
          legend.text=ggplot2::element_text(size=20), 
          legend.title=ggplot2::element_text(size=20)) +
    ggplot2::xlab("Grammar Type") + ggplot2::guides(fill=ggplot2::guide_legend(title="Num Layers"))

ggplot2::ggsave(file="plots/grammar_by_brier_all_no_layer_1.pdf", plot=plot, width=10, height=8)

plot <- ggplot2::ggplot(data = post_training_data_summarised) +
  ggplot2::geom_boxplot(ggplot2::aes(x = factor(grammartype, level = c("III`", 
                                                    "II", 
                                                    "I")), 
                  y = `Brier Score`, 
                  fill = factor(layers, level = c(1, 2, 3, 4, 5)))) +
  ggplot2::facet_grid(recurrence ~ laminations) + ggplot2::theme_minimal() + 
    ggplot2::theme(text=ggplot2::element_text(size=20), 
          axis.text=ggplot2::element_text(size=20), 
          axis.title=ggplot2::element_text(size=20), 
          plot.title=ggplot2::element_text(size=20), 
          legend.text=ggplot2::element_text(size=20), 
          legend.title=ggplot2::element_text(size=20)) +
    ggplot2::xlab("Grammar Type") + ggplot2::guides(fill=ggplot2::guide_legend(title="Num Layers"))

ggplot2::ggsave(file="plots/grammar_by_brier_all_layers.pdf", plot=plot, width=10, height=8)

post_training_data_summarized_neuron_256 <- post_training_data_summarised |>
  dplyr::filter(neurons == 256)

plot <- ggplot2::ggplot(data = post_training_data_summarized_neuron_256) +
  ggplot2::geom_boxplot(ggplot2::aes(x = factor(grammartype, level = c("III", 
                                                    "II", 
                                                    "I")), 
                  y = `Brier Score`, 
                  fill = factor(layers, level = c(1, 2, 3, 4, 5)))) +
  ggplot2::facet_grid(recurrence ~ laminations) + ggplot2::theme_minimal() + 
    ggplot2::theme(text=ggplot2::element_text(size=20), 
          axis.text=ggplot2::element_text(size=20), 
          axis.title=ggplot2::element_text(size=20), 
          plot.title=ggplot2::element_text(size=20), 
          legend.text=ggplot2::element_text(size=20), 
          legend.title=ggplot2::element_text(size=20)) +
    ggplot2::xlab("Grammar Type") + ggplot2::guides(fill=ggplot2::guide_legend(title="Num Layers"))

ggplot2::ggsave(file="plots/grammar_by_brier_256.pdf", plot=plot, width=10, height=8)

cat("Getting accuracy data...\n")

query <- glue::glue("SELECT a.{settings$tables$accuracieslosses$columns[[1]][1]}, a.{settings$tables$accuracieslosses$columns[[3]][1]}, a.{settings$tables$accuracieslosses$columns[[4]][1]}, 
a.{settings$tables$accuracieslosses$columns[[5]][1]}, a.{settings$tables$accuracieslosses$columns[[7]][1]},
g.{settings$tables$grammars$columns[[2]][1]}, g.{settings$tables$grammars$columns[[3]][1]}, 
m.{settings$tables$models$columns[[2]][1]}, m.{settings$tables$models$columns[[3]][1]}, m.{settings$tables$models$columns[[4]][1]}, 
m.{settings$tables$models$columns[[5]][1]}, m.{settings$tables$models$columns[[6]][1]} FROM 
{settings$tables$accuracieslosses$name} a INNER JOIN {settings$tables$grammars$name} g ON 
g.{settings$tables$grammars$columns[[1]][1]} = a.{settings$tables$accuracieslosses$columns[[2]][1]} INNER JOIN 
{settings$tables$models$name} m ON 
m.{settings$tables$models$columns[[1]][1]} = a.{settings$tables$accuracieslosses$columns[[1]][1]};")

learning_data <- DBI::dbGetQuery(myDB, query)

cat("Summarising...\n")

learning_data_clean <- learning_data |>
  dplyr::group_by(modelid) |>
  dplyr::mutate(Step = 1:dplyr::n()) |>
  dplyr::ungroup() |>
  dplyr::mutate(recurrence = ifelse(recurrence == 0, "FFN",
                            ifelse(gru == 1, "GRU", "RNN")),
                recurrence = factor(recurrence, levels = c("FFN", "RNN", "GRU")),
         laminations = ifelse(laminations == 1, "Dense",
                              ifelse(laminations == 2, "Laminated (2)", "Laminated (3)")),
         grammartype = ifelse(grammartype == "reg", "III",
                              ifelse(grammartype == "cfg_rep", "II",
                                     ifelse(grammartype == "cfg_mirr", "II",
                                            "I"))))  
  
cat("Plotting...\n")

plot <- ggplot2::ggplot(data = learning_data_clean) +
  ggplot2::geom_smooth(ggplot2::aes(x = Step, 
                  y = testbrier, 
                  fill = factor(layers, level = c(1, 2, 3, 4, 5)))) +
  ggplot2::facet_grid(recurrence ~ laminations) + ggplot2::theme_minimal() + 
    ggplot2::theme(text=ggplot2::element_text(size=20), 
          axis.text=ggplot2::element_text(size=20), 
          axis.title=ggplot2::element_text(size=20), 
          plot.title=ggplot2::element_text(size=20), 
          legend.text=ggplot2::element_text(size=20), 
          legend.title=ggplot2::element_text(size=20)) +
    ggplot2::xlab("Grammar Type") + ggplot2::guides(fill=ggplot2::guide_legend(title="Num Layers"))

ggplot2::ggsave(file="plots/learning_curves.pdf", plot=plot, width=10, height=8)

post_training_data_analysis_mixed <- post_training_data |>
  dplyr::mutate(root_squared_error = sqrt((posttrainprobs - error)^2)) |>
  dplyr::group_by(grammarid, modelid, kgrams, grammartype, neurons, layers, laminations, recurrence, gru) |>
  dplyr::summarise(Brier_Score = sum(root_squared_error)/dplyr::n()) |>
  dplyr::mutate(recurrence = ifelse(recurrence == 0, "FFN",
                            ifelse(gru == 1, "GRU", "RNN")),
                recurrence = factor(recurrence, levels = c("FFN", "RNN", "GRU")),
         grammartype = ifelse(grammartype == "reg", "III",
                              ifelse(grammartype == "cfg_rep", "II",
                                     ifelse(grammartype == "cfg_mirr", "II",
                                            "I"))))  

post_training_data_analysis_fixed <- post_training_data_analysis_mixed |>
  dplyr::ungroup() |>
  dplyr::group_by(grammartype, neurons, layers, laminations, recurrence) |>
  dplyr::summarise(Brier_Score = sum(Brier_Score)/dplyr::n()) 

cat("Running beta regression...")

# Fixed effects Bayesian beta regression

model_fixed <- brms::bf(Brier_Score ~ neurons + laminations + recurrence + layers + grammartype,
                phi ~ neurons + laminations + recurrence + layers + grammartype,
                zoi ~ neurons + laminations + recurrence + layers + grammartype,
                coi ~ neurons + laminations + recurrence + layers + grammartype)

fit_brms_fixed <- brms::brm(formula = model_fixed, 
                 family = brms::zero_one_inflated_beta(), 
                 data = post_training_data_analysis_fixed, inits = 0,
                 chains = 4, cores = 4, seed = 1997, iter = 1000, max_tree_depth = 20)

marginal_grid <- tidyr::expand_grid(
  recurrence = c("FFN", "RNN", "GRU"),
  neurons = seq(32, 512, 32),
  laminations = c(1, 2, 3),
  layers = c(1, 2, 3, 4, 5),
  grammartype = c("I", "II", "III")
)

beta_bayes_pred_type <- fit_brms_fixed |> 
  tidybayes::epred_draws(newdata = marginal_grid) |> 
  dplyr::group_by(recurrence, .draw) |> 
  dplyr::summarise(estimate = mean(.epred), .groups = "drop") # Average over marginals

model_type_marginals <- ggplot2::ggplot(beta_bayes_pred_type, ggplot2::aes(x = estimate, y = recurrence, fill = recurrence)) +
  ggdist::stat_halfeye(.width = c(0.8, 0.95), point_interval = "median_hdi") +
  ggplot2::scale_x_continuous(limits = c(0, 0.25)) +
  ggplot2::scale_fill_viridis_d(option = "plasma", end = 0.8) +
  ggplot2::guides(fill = "none") +
  ggplot2::labs(x = "Predicted Brier Score", y = NULL,
       caption = "80% and 95% credible intervals shown in black") +
  ggthemes::theme_clean() + 
    ggplot2::theme(text=ggplot2::element_text(size=20), 
          axis.text=ggplot2::element_text(size=20), 
          axis.title=ggplot2::element_text(size=20), 
          plot.title=ggplot2::element_text(size=20), 
          legend.text=ggplot2::element_text(size=20), 
          legend.title=ggplot2::element_text(size=20))

ggplot2::ggsave(file="plots/model_type_marginals.pdf", plot=model_type_marginals, width=10, height=8)

beta_bayes_pred_grammars <- fit_brms_fixed |> 
  tidybayes::epred_draws(newdata = marginal_grid) |> 
  dplyr::group_by(grammartype, .draw) |> 
  dplyr::summarise(estimate = mean(.epred), .groups = "drop") # Average over marginals

grammar_type_marginals <- ggplot2::ggplot(beta_bayes_pred_grammars, ggplot2::aes(x = estimate, y = grammartype, fill = grammartype)) +
  ggdist::stat_halfeye(.width = c(0.8, 0.95), point_interval = "median_hdi") +
  ggplot2::scale_x_continuous(limits = c(0, 0.5)) +
  ggplot2::scale_fill_viridis_d(option = "plasma", end = 0.8) +
  ggplot2::guides(fill = "none") +
  ggplot2::labs(x = "Predicted Brier Score", y = NULL,
       caption = "80% and 95% credible intervals shown in black") +
  ggthemes::theme_clean() + 
    ggplot2::theme(text=ggplot2::element_text(size=20), 
          axis.text=ggplot2::element_text(size=20), 
          axis.title=ggplot2::element_text(size=20), 
          plot.title=ggplot2::element_text(size=20), 
          legend.text=ggplot2::element_text(size=20), 
          legend.title=ggplot2::element_text(size=20))

ggplot2::ggsave(file="plots/grammars_marginals.pdf", plot=grammar_type_marginals, width=10, height=8)

beta_bayes_pred_lams <- fit_brms_fixed |> 
  tidybayes::epred_draws(newdata = marginal_grid) |> 
  dplyr::group_by(laminations, .draw) |> 
  dplyr::summarise(estimate = mean(.epred), .groups = "drop") # Average over marginals

laminations_marginals <- ggplot2::ggplot(beta_bayes_pred_lams, ggplot2::aes(x = laminations, y = estimate)) +
  ggdist::stat_lineribbon() + 
  ggplot2::scale_y_continuous(limits = c(0, 0.25)) +
  ggplot2::scale_fill_brewer(palette = "Purples") +
  ggplot2::labs(x = "Number of Laminations", y = "Predicted Brier Score",
       fill = "Credible interval") +
  ggthemes::theme_clean() +
  ggplot2::theme(legend.position = "bottom",
        text=ggplot2::element_text(size=20), 
        axis.text=ggplot2::element_text(size=20), 
        axis.title=ggplot2::element_text(size=20), 
        plot.title=ggplot2::element_text(size=20), 
        legend.text=ggplot2::element_text(size=20), 
        legend.title=ggplot2::element_text(size=20))

ggplot2::ggsave(file="plots/laminations_marginals.pdf", plot=laminations_marginals, width=10, height=8)

beta_bayes_pred_neurs <- fit_brms_fixed |> 
  tidybayes::epred_draws(newdata = marginal_grid) |> 
  dplyr::group_by(neurons, .draw) |> 
  dplyr::summarise(estimate = mean(.epred), .groups = "drop") # Average over marginals

neurons_marginals <- ggplot2::ggplot(beta_bayes_pred_neurs, ggplot2::aes(x = neurons, y = estimate)) +
  ggdist::stat_lineribbon() + 
  ggplot2::scale_y_continuous(limits = c(0, 0.25)) +
  ggplot2::scale_fill_brewer(palette = "Purples") +
  ggplot2::labs(x = "Number of Neurons", y = "Predicted Brier Score",
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

beta_bayes_pred_layers <- fit_brms_fixed |> 
  tidybayes::epred_draws(newdata = marginal_grid) |> 
  dplyr::group_by(layers, .draw) |> 
  dplyr::summarise(estimate = mean(.epred), .groups = "drop") # Average over marginals

layers_marginals <- ggplot2::ggplot(beta_bayes_pred_layers, ggplot2::aes(x = layers, y = estimate)) +
  ggdist::stat_lineribbon() + 
  ggplot2::scale_y_continuous(limits = c(0, 0.25)) +
  ggplot2::scale_fill_brewer(palette = "Purples") +
  ggplot2::labs(x = "Number of Layers", y = "Predicted Brier Score",
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

# Mixed effects  Bayesian beta regression

model <- brms::bf(Brier_Score ~ neurons + laminations + recurrence + layers + grammartype + (1|grammarid) + (1|modelid),
                phi ~ neurons + laminations + recurrence + layers + grammartype + (1|grammarid) + (1|modelid),
                zoi ~ neurons + laminations + recurrence + layers + grammartype + (1|grammarid) + (1|modelid),
                coi ~ neurons + laminations + recurrence + layers + grammartype + (1|grammarid) + (1|modelid))

fit_brms <- brms::brm(formula = model, 
                 family = brms::zero_one_inflated_beta(), 
                 data = post_training_data_analysis, inits = 0,
                 chains = 4, cores = 4, seed = 1997)

summary(fit_brms)

sink("./results/regressions/beta_regression.txt")

cat("Fixed effects ZOIB\n")

summary(fit_brms_fixed)

cat("Mixed effects ZOIB\n")

summary(fit_brms)

sink()

DBI::dbDisconnect(myDB)

cat("Done!")
