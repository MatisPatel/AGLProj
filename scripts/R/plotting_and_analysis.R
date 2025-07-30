############################################# Plotting and Analysis of Results ##################################################
# Author: K. Voudouris
# Project Title: AGLProj
# R Version: 4.5.1
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

# general plotter with mean ± CI
plot_results <- function(data,
                             y,                 # string – column to plot on the y‑axis
                             colour,            # string – column that defines colour / legend
                             facet = NULL,      # string (optional) – column for facet_grid
                             x_levels = c("SL","LT","LTT","LTTO","MSO","CF","CS"),
                             ci = 0.99,         # width of the normal‑theory CI
                             xlab = "Grammar Type",
                             ylab = NULL,       # defaults to `y` if missing
                             col_lab = NULL,   # defaults to `fill` if missing
                             facet_lab = NULL,  # defaults to `facet` if missing
                             file = NULL,       # file name to save (NULL → don’t save)
                             width = 16,
                             height = 8) {
  
  ## convert strings → symbols for tidy‑eval
  xsym   <- rlang::sym("grammartype")
  ysym   <- rlang::sym(y)
  csym   <- rlang::sym(colour)
  facet_sym <- if (!is.null(facet)) rlang::sym(facet) else NULL
  
  ## build the plot -----------------------------------------------------------
  p <- ggplot2::ggplot(data, ggplot2::aes(x = factor(!!xsym, levels = x_levels),
                        y = !!ysym,
                        col = !!csym)) +
    
    # 1) bar = mean
    # ggplot2::geom_bar(stat = "summary",
    #          fun  = "mean",
    #          position = ggplot2::position_dodge(width = 0.9),
    #          width = 0.8
    #          ) +
    ggplot2::stat_summary(fun = mean,
                 geom = "point",
                 size = 3,
                 position = ggplot2::position_dodge(width = 0.9)) +
    
    # 2) error bar = mean +- CI
    ggplot2::stat_summary(fun.data = ggplot2::mean_cl_boot,
                 fun.args = list(conf.int = ci),
                 geom = "errorbar",
                 position = ggplot2::position_dodge(width = 0.9),
                 width = 0.2,
                 linewidth = 0.7) +
    
    # dashed separators between grammar categories
    ggplot2::geom_vline(xintercept = seq(1.5, length(x_levels) - 0.5, by = 1),
               linetype = "dashed",
               colour = "grey80",
               linewidth = 0.5,
               show.legend = FALSE)
  
    ## add facets, if requested
    if (!is.null(facet_sym)) {
      p <- p + ggplot2::facet_grid(cols = ggplot2::vars(!!facet_sym))
    }

    # theme and labels
    p <- p + ggplot2::theme_minimal(base_size = 20) +
    ggplot2::theme(
      axis.text.x      = ggplot2::element_text(angle = 0, vjust = 0.5, hjust = 0.5),
      panel.grid.major = ggplot2::element_blank(),
      panel.grid.minor = ggplot2::element_blank(),
      panel.border     = ggplot2::element_rect(colour = "grey80", fill = NA, linewidth = 0.5),
      panel.spacing    = grid::unit(1, "lines"),
      legend.text      = ggplot2::element_text(size = 20),
      legend.title     = ggplot2::element_text(size = 20)
    ) +
    ggplot2::xlab(xlab) +
    ggplot2::ylab(if (is.null(ylab)) y else ylab) +
    ggplot2::guides(colour = ggplot2::guide_legend(title = if (is.null(col_lab) ) colour else col_lab))
  
  ## save, if asked -----------------------------------------------------------
  if (!is.null(file)) ggplot2::ggsave(filename = file, plot = p, width = width, height = height)
  
  return(p)
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
      dplyr::mutate(root_squared_error = sqrt((posttrainprobs - error)^2),
                    correct_binary = (posttrainprobs >= 0.5) == error) |>
      dplyr::group_by(grammarid, modelid, kgrams, grammarsubtype, neurons, layers, inputsize, laminations, recurrence, gru) |>
      dplyr::summarise(`Brier Score` = sum(root_squared_error)/dplyr::n(),
                      `Proportion Correct` = sum(correct_binary)/dplyr::n()) |>
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
    
    post_training_data_summarised <- post_training_data_summarised |>
      dplyr::mutate(inputsize/6)

} else {
    cat("Loading data from file...\n")
    post_training_data_summarised <- read.csv("data/data_summary.csv", stringsAsFactors = FALSE) |>
      dplyr::rename(`Brier Score` = `Brier.Score`,
                    `Inverse Brier Score` = `Inverse.Brier.Score`,
                    `Proportion Correct` = `Proportion.Correct`,
                    `Brier Skill Score` = `Brier.Skill.Score`) |>
      dplyr::mutate(recurrence = factor(recurrence, levels = c("FFN", "RNN", "GRU")),
                    laminations = factor(laminations, levels = c("Dense", "Laminated")),
                    grammartype = factor(grammartype, levels = c("SL", "LT", "LTT", "LTTO", "MSO", "CS", "CF")),
                    inputsize = inputsize/6)

}



#################################################################################################################################
# 1. Plotting

cat("Plotting architecture means...\n")

plot_results(
  post_training_data_summarised,
  y     = "Brier Skill Score",
  colour  = "recurrence",
  col_lab = "Architecture Type",
  file  = "plots/grammar_by_architecture_type_point_brier_skill_score.svg",
  width = 15, height = 8
)

plot_results(
  post_training_data_summarised,
  y     = "Brier Score",
  colour  = "recurrence",
  col_lab = "Architecture Type",
  file  = "plots/grammar_by_architecture_type_point_brier_score_raw.svg",
  width = 15, height = 8
)

plot_results(
  post_training_data_summarised,
  y     = "Inverse Brier Score",
  colour  = "recurrence",
  col_lab = "Architecture Type",
  file  = "plots/grammar_by_architecture_type_point_brier_score_inverse.svg",
  width = 15, height = 8
)

plot_results(
  post_training_data_summarised,
  y     = "Proportion Correct",
  colour  = "recurrence",
  col_lab = "Architecture Type",
  file  = "plots/grammar_by_architecture_type_point_proportion.svg",
  width = 15, height = 8
)

cat("Plotting input sizes...\n")

plot_results(
  dplyr::filter(post_training_data_summarised, recurrence != "FFN"),
  y     = "Brier Skill Score",
  colour  = "inputsize",
  facet = "recurrence",
  col_lab = "Input Size",
  file  = "plots/grammar_by_input_size_point_brier_skill_score.svg",
  width = 16, height = 8
)

plot_results(
  dplyr::filter(post_training_data_summarised, recurrence != "FFN"),
  y     = "Brier Score",
  colour  = "inputsize",
  facet = "recurrence",
  col_lab = "Input Size",
  file  = "plots/grammar_by_input_size_point_brier_score_raw.svg",
  width = 16, height = 8
)

plot_results(
  dplyr::filter(post_training_data_summarised, recurrence != "FFN"),
  y     = "Inverse Brier Score",
  colour  = "inputsize",
  facet = "recurrence",
  col_lab = "Input Size",
  file  = "plots/grammar_by_input_size_point_brier_score_inverse.svg",
  width = 16, height = 8
)

plot_results(
  dplyr::filter(post_training_data_summarised, recurrence != "FFN"),
  y     = "Proportion Correct",
  colour  = "inputsize",
  facet = "recurrence",
  col_lab = "Input Size",
  file  = "plots/grammar_by_input_size_point_proportion.svg",
  width = 16, height = 8
)

cat("Plotting neurons...\n")

plot_results(
  dplyr::mutate(post_training_data_summarised, 
                neurons = factor(neurons, levels = seq(32, 512, 32))),
  y     = "Brier Skill Score",
  colour  = "neurons",
  facet = "recurrence",
  col_lab = "Neurons",
  file  = "plots/grammar_by_neurons_point_brier_skill_score.svg",
  width = 24, height = 8
)

plot_results(
  dplyr::mutate(post_training_data_summarised, 
                neurons = factor(neurons, levels = seq(32, 512, 32))),
  y     = "Brier Score",
  colour  = "neurons",
  facet = "recurrence",
  col_lab = "Neurons",
  file  = "plots/grammar_by_neurons_point_brier_score_raw.svg",
  width = 24, height = 8
)

plot_results(
  dplyr::mutate(post_training_data_summarised, 
                neurons = factor(neurons, levels = seq(32, 512, 32))),
  y     = "Inverse Brier Score",
  colour  = "neurons",
  facet = "recurrence",
  col_lab = "Neurons",
  file  = "plots/grammar_by_neurons_point_brier_score_inverse.svg",
  width = 24, height = 8
)

plot_results(
  dplyr::mutate(post_training_data_summarised, 
                neurons = factor(neurons, levels = seq(32, 512, 32))),
  y     = "Proportion Correct",
  colour  = "neurons",
  facet = "recurrence",
  col_lab = "Neurons",
  file  = "plots/grammar_by_neurons_point_proportion.svg",
  width = 24, height = 8
)

cat("Plotting laminations...\n")

plot_results(
  post_training_data_summarised,
  y     = "Brier Skill Score",
  colour  = "laminations",
  facet = "recurrence",
  col_lab = "Laminations",
  file  = "plots/grammar_by_laminations_point_brier_skill_score.svg",
  width = 24, height = 8
)

plot_results(
  post_training_data_summarised,
  y     = "Brier Score",
  colour  = "laminations",
  facet = "recurrence",
  col_lab = "Laminations",
  file  = "plots/grammar_by_laminations_point_brier_score_raw.svg",
  width = 24, height = 8
)

plot_results(
  post_training_data_summarised,
  y     = "Inverse Brier Score",
  colour  = "laminations",
  facet = "recurrence",
  col_lab = "Laminations",
  file  = "plots/grammar_by_laminations_point_brier_score_inverse.svg",
  width = 24, height = 8
)

plot_results(
  post_training_data_summarised,
  y     = "Proportion Correct",
  colour  = "laminations",
  facet = "recurrence",
  col_lab = "Laminations",
  file  = "plots/grammar_by_laminations_point_proportion.svg",
  width = 24, height = 8
)

cat("Plotting layers...\n")

plot_results(
  dplyr::mutate(post_training_data_summarised, layers = factor(layers, levels = c(1:3))),
  y     = "Brier Skill Score",
  colour  = "layers",
  facet = "recurrence",
  col_lab = "Layers",
  file  = "plots/grammar_by_layers_point_brier_skill_score.svg",
  width = 24, height = 8
)

plot_results(
  dplyr::mutate(post_training_data_summarised, layers = factor(layers, levels = c(1:3))),
  y     = "Brier Score",
  colour  = "layers",
  facet = "recurrence",
  col_lab = "Layers",
  file  = "plots/grammar_by_layers_point_brier_score_raw.svg",
  width = 24, height = 8
)

plot_results(
  dplyr::mutate(post_training_data_summarised, layers = factor(layers, levels = c(1:3))),
  y     = "Inverse Brier Score",
  colour  = "layers",
  facet = "recurrence",
  col_lab = "Layers",
  file  = "plots/grammar_by_layers_point_brier_score_inverse.svg",
  width = 24, height = 8
)

plot_results(
  dplyr::mutate(post_training_data_summarised, layers = factor(layers, levels = c(1:3))),
  y     = "Proportion Correct",
  colour  = "layers",
  facet = "recurrence",
  col_lab = "Layers",
  file  = "plots/grammar_by_layers_point_proportion.svg",
  width = 24, height = 8
)

#################################################################################################################################
# 2. Analysis
#################################################################################################################################

## 0.  Reformat data set for ease of use

sv_shrinkage <- 0.5 # Smithson-Verkuilen shrinkage factor (default setting)

df <- post_training_data_summarised |>
  dplyr::mutate(Inverse_Brier_Score = (`Inverse Brier Score` * (dplyr::n() - 1) + sv_shrinkage) / dplyr::n(), # Apply S-V shrinkage. Fitting extended beta models takes too long.
                Proportion_Correct = (`Proportion Correct` * (dplyr::n() - 1) + sv_shrinkage) / dplyr::n()) # Apply S-V shrinkage. Fitting extended beta models takes too long.

future::plan(strategy = future::multisession,
             workers = parallel::detectCores() - 1) # Plan for multisession

## 1.  Define useful functions

# Cross-validation function

compute_cv_block_parallel <- function(df, formulas, response_name,
                                      link_fun = "logit", k = 5) {
  
  # map over models in parallel
  cv_list <- furrr::future_imap(formulas, function(form, mod_name) {
    
    # generate fold ids once per model (so each model sees identical splits)
    set.seed(1)
    fold_id <- sample(rep(1:k, length.out = nrow(df)))
    df$fold_id <- fold_id
    
    # map over folds in parallel as well (nested futures are OK)
    rmse_vec <- furrr::future_map_dbl(1:k, function(f) {
      train <- df[ fold_id != f, ]
      test  <- df[ fold_id == f, ]
      
      mod   <- betareg::betareg(form, data = train, link = link_fun)
      preds <- predict(mod, test)
      
      ModelMetrics::rmse(test[[response_name]], preds)
    }, .options = furrr::furrr_options(seed = 1))
    
    dplyr::tibble(Fold = 1:k, RMSE = rmse_vec, Model = mod_name)
  }, .options = furrr::furrr_options(seed = 1), .progress = TRUE)
  
  output <- dplyr::bind_rows(cv_list) |>
    tidyr::pivot_wider(names_from = Model,
                values_from = RMSE,
                names_prefix = "RMSE ")
  
  means <- output |>
    dplyr::summarise(across(-Fold, mean)) |>
    dplyr::mutate(Fold = "Mean", .before = 1)    
  
  output_tibble <- output |>
    dplyr::mutate(Fold = as.character(Fold)) |>
    dplyr::bind_rows(means)
  
  return(output_tibble)
}

# Residuals plotter

plot_resid <- function(mod){
  plot <- ggplot2::ggplot(data.frame(fit = fitted(mod),
                                     res = residuals(mod, type = "deviance")),
                          ggplot2::aes(fit, res)) +
    ggplot2::geom_point(alpha = .25) +
    ggplot2::geom_hline(yintercept = 0) +
    ggplot2::labs(x = "Fitted", y = "Deviance residual") 
  return(plot)
}


## 2.  Model specifications, starting with the maximal model, keeping phi model as all main effects for now

formulas_inverse_brier <- list(
  M1 = Inverse_Brier_Score ~ recurrence:grammartype + laminations:grammartype + recurrence:laminations + inputsize:grammartype + recurrence + laminations + inputsize + grammartype + neurons + layers |
    recurrence + laminations + inputsize + grammartype + neurons + layers, # maximal model
  M2 = Inverse_Brier_Score ~ recurrence:grammartype + laminations:grammartype + inputsize:grammartype + recurrence + laminations + inputsize + grammartype + neurons + layers |
    recurrence + laminations + inputsize + grammartype + neurons + layers, # maximal model without recurrence:laminations
  M3 = Inverse_Brier_Score ~ recurrence:grammartype + recurrence:laminations + inputsize:grammartype + recurrence + laminations + inputsize + grammartype + neurons + layers |
    recurrence + laminations + inputsize + grammartype + neurons + layers, # maximal model without laminations:grammartype
  M4 = Inverse_Brier_Score ~ laminations:grammartype + recurrence:laminations + inputsize:grammartype + recurrence + laminations + inputsize + grammartype + neurons + layers |
    recurrence + laminations + inputsize + grammartype + neurons + layers, # maximal model without recurrence:grammartype
  M5 = Inverse_Brier_Score ~ recurrence:grammartype + laminations:grammartype + recurrence:laminations + recurrence + laminations + inputsize + grammartype + neurons + layers |
    recurrence + laminations + inputsize + grammartype + neurons + layers, # maximal model without inputsize:grammartype
  M6 = Inverse_Brier_Score ~ recurrence:grammartype + laminations:grammartype + recurrence:laminations + inputsize:grammartype + recurrence + laminations + inputsize + grammartype + neurons |
    recurrence + laminations + inputsize + grammartype + neurons + layers, # maximal model without layers
  M7 = Inverse_Brier_Score ~ recurrence:grammartype + laminations:grammartype + recurrence:laminations + inputsize:grammartype + recurrence + laminations + inputsize + grammartype + layers |
    recurrence + laminations + inputsize + grammartype + neurons + layers, # maximal model without neurons
  M8 = Inverse_Brier_Score ~ recurrence:grammartype + laminations:grammartype + recurrence:laminations + inputsize:grammartype + recurrence + laminations + inputsize + grammartype|
    recurrence + laminations + inputsize + grammartype + neurons + layers # maximal model without layers and neurons
)

formulas_proportion <- list(
  M1 = Proportion_Correct ~ recurrence:grammartype + laminations:grammartype + recurrence:laminations + inputsize:grammartype + recurrence + laminations + inputsize + grammartype + neurons + layers |
    recurrence + laminations + inputsize + grammartype + neurons + layers, # maximal model
  M2 = Proportion_Correct ~ recurrence:grammartype + laminations:grammartype + inputsize:grammartype + recurrence + laminations + inputsize + grammartype + neurons + layers |
    recurrence + laminations + inputsize + grammartype + neurons + layers, # maximal model without recurrence:laminations
  M3 = Proportion_Correct ~ recurrence:grammartype + recurrence:laminations + inputsize:grammartype + recurrence + laminations + inputsize + grammartype + neurons + layers |
    recurrence + laminations + inputsize + grammartype + neurons + layers, # maximal model without laminations:grammartype
  M4 = Proportion_Correct ~ laminations:grammartype + recurrence:laminations + inputsize:grammartype + recurrence + laminations + inputsize + grammartype + neurons + layers |
    recurrence + laminations + inputsize + grammartype + neurons + layers, # maximal model without recurrence:grammartype
  M5 = Proportion_Correct ~ recurrence:grammartype + laminations:grammartype + recurrence:laminations + recurrence + laminations + inputsize + grammartype + neurons + layers |
    recurrence + laminations + inputsize + grammartype + neurons + layers, # maximal model without inputsize:grammartype
  M6 = Proportion_Correct ~ recurrence:grammartype + laminations:grammartype + recurrence:laminations + inputsize:grammartype + recurrence + laminations + inputsize + grammartype + neurons |
    recurrence + laminations + inputsize + grammartype + neurons + layers, # maximal model without layers
  M7 = Proportion_Correct ~ recurrence:grammartype + laminations:grammartype + recurrence:laminations + inputsize:grammartype + recurrence + laminations + inputsize + grammartype + layers |
    recurrence + laminations + inputsize + grammartype + neurons + layers, # maximal model without neurons
  M8 = Proportion_Correct ~ recurrence:grammartype + laminations:grammartype + recurrence:laminations + inputsize:grammartype + recurrence + laminations + inputsize + grammartype|
    recurrence + laminations + inputsize + grammartype + neurons + layers # maximal model without layers and neurons
)


## 3.  Fit all models (logit link)

fits_inverse_brier <- furrr::future_map(formulas_inverse_brier, ~ betareg::betareg(.x, data = df, link = "logit"), .progress = TRUE)

fits_proportion <- furrr::future_map(formulas_proportion, ~ betareg::betareg(.x, data = df, link = "logit"), .progress = TRUE)

## 4.  Collect fit statistics 

fit_inverse_brier_tbl <- purrr::map_dfr(fits_inverse_brier, ~ broom::glance(.x), .id = "Model") |>
  dplyr::select(Model, logLik, df.residual, AIC, BIC, pseudo.r.squared) 

fit_proportion_tbl <- purrr::map_dfr(fits_proportion, ~ broom::glance(.x), .id = "Model") |>
  dplyr::select(Model, logLik, df.residual, AIC, BIC, pseudo.r.squared) 

cv_inverse_brier <- compute_cv_block_parallel(df, formulas_inverse_brier, "Inverse_Brier_Score", link_fun = "logit", k = 5)
cv_proportion <- compute_cv_block_parallel(df, formulas_inverse_brier, "Proportion Correct", link_fun = "logit", k = 5)

## 5.  Likelihood Ratios of nested models

ratios_inverse_brier <- list(
  "M1 vs. M2" = lmtest::lrtest(fits_inverse_brier$M1, fits_inverse_brier$M2), # M1 adds recurrence:laminations
  "M1 vs. M3" = lmtest::lrtest(fits_inverse_brier$M1, fits_inverse_brier$M3), # M1 adds laminations:grammartype
  "M1 vs. M4" = lmtest::lrtest(fits_inverse_brier$M1, fits_inverse_brier$M4), # M1 adds recurrence:grammartype
  "M1 vs. M5" = lmtest::lrtest(fits_inverse_brier$M1, fits_inverse_brier$M5), # M1 adds inputsize:grammartype
  "M1 vs. M6" = lmtest::lrtest(fits_inverse_brier$M1, fits_inverse_brier$M6), # M1 adds layers
  "M1 vs. M7" = lmtest::lrtest(fits_inverse_brier$M1, fits_inverse_brier$M7), # M1 adds neurons
  "M1 vs. M8" = lmtest::lrtest(fits_inverse_brier$M1, fits_inverse_brier$M8)  # M1 adds layers and neurons
)


lr_progression_inverse_brier <- purrr::imap_dfr(
  ratios_inverse_brier,                      
  ~ {
    m <- as.data.frame(.x)     # lrtest → data‑frame
    dplyr::tibble(
      Comparison        = .y,                  # list name: "M0 vs. M1", …
      `DF Small`          = m$`#Df`[1],          # parameters in smaller model
      `DF Big`            = m$`#Df`[2],          # parameters in bigger  model
      `Δdf`             = m$Df[2],             # difference in df (= test df)
      `Log‑Likelihood Small`  = m$LogLik[1],         # log‑lik of smaller model
      `Log‑Likelihood Big`  = m$LogLik[2],         # log‑lik of bigger model
      Chisq             = m$Chisq[2],          # LR χ²
      `p‑value`         = m$`Pr(>Chisq)`[2]    # p‑value
    )
  }
) |>
  dplyr::transmute(
    Comparison = Comparison,
    `Δdf` = `Δdf`,
    `Δloglik` = `Log‑Likelihood Big` - `Log‑Likelihood Small`,
    Chisq = Chisq,
    `p‑value` = `p‑value`
  )

ratios_proportion <- list(
  "M1 vs. M2" = lmtest::lrtest(fits_proportion$M1, fits_inverse_brier$M2), # M1 adds recurrence:laminations
  "M1 vs. M3" = lmtest::lrtest(fits_proportion$M1, fits_inverse_brier$M3), # M1 adds laminations:grammartype
  "M1 vs. M4" = lmtest::lrtest(fits_proportion$M1, fits_inverse_brier$M4), # M1 adds recurrence:grammartype
  "M1 vs. M5" = lmtest::lrtest(fits_proportion$M1, fits_inverse_brier$M5), # M1 adds inputsize:grammartype
  "M1 vs. M6" = lmtest::lrtest(fits_proportion$M1, fits_inverse_brier$M6), # M1 adds layers
  "M1 vs. M7" = lmtest::lrtest(fits_proportion$M1, fits_inverse_brier$M7), # M1 adds neurons
  "M1 vs. M8" = lmtest::lrtest(fits_proportion$M1, fits_inverse_brier$M8)  # M1 adds layers and neurons
)


lr_progression_proportion <- purrr::imap_dfr(
  ratios_proportion,                      
  ~ {
    m <- as.data.frame(.x)     # lrtest → data‑frame
    dplyr::tibble(
      Comparison        = .y,                  # list name: "M0 vs. M1", …
      `DF Small`          = m$`#Df`[1],          # parameters in smaller model
      `DF Big`            = m$`#Df`[2],          # parameters in bigger  model
      `Δdf`             = m$Df[2],             # difference in df (= test df)
      `Log‑Likelihood Small`  = m$LogLik[1],         # log‑lik of smaller model
      `Log‑Likelihood Big`  = m$LogLik[2],         # log‑lik of bigger model
      Chisq             = m$Chisq[2],          # LR χ²
      `p‑value`         = m$`Pr(>Chisq)`[2]    # p‑value
    )
  }
) |>
  dplyr::transmute(
    Comparison = Comparison,
    `Δdf` = `Δdf`,
    `Δloglik` = `Log‑Likelihood Big` - `Log‑Likelihood Small`,
    Chisq = Chisq,
    `p‑value` = `p‑value`
  )

best_mod_inverse_brier <- fits_inverse_brier$M1 # The maximal model is the best on AIC, BIC, and cross-validation
best_mod_proportion <- fits_proportion$M1 # The maximal model is the best on AIC, BIC, and cross-validation

## 6.  Compare link functions (logit vs log‑log) 

# Now let's check if the link function is appropriate. \n 
# Cribari-Neto and Lima (2007; A Misspecification Test for Beta Regressions)
# suggest that loglog link can be better for handling extreme values close to 0 or 1, 
# which we have in this data.

M1_inverse_brier_loglog <- betareg::betareg(
  formulas_inverse_brier$M1,
  data = df, link = "loglog"
)

M1_proportion_loglog <- betareg::betareg(
  formulas_proportion$M1,
  data = df, link = "loglog"
)

link_tbl <- dplyr::bind_rows(
  broom::glance(best_mod_inverse_brier) |> dplyr::mutate(Model = "M7 (Inverse Brier)", Link = "logit"),
  broom::glance(M1_inverse_brier_loglog) |> dplyr::mutate(Model = "M7 (Inverse Brier)", Link = "loglog"),
  broom::glance(best_mod_proportion) |> dplyr::mutate(Model = "M7 (Proportion)", Link = "logit"),
  broom::glance(M1_proportion_loglog) |> dplyr::mutate(Model = "M7 (Proportion)", Link = "loglog")
) |>
  dplyr::select(Model, Link, logLik, AIC, BIC, pseudo.r.squared)

link_kable <- kableExtra::kable(link_tbl, digits = 3, caption = "Link‑function comparison for M1 (Maximal Model)") |>
  kableExtra::kable_styling(full_width = FALSE) #loglog link is best

best_mod_inverse_brier <- M1_inverse_brier_loglog
best_mod_proportion <- M1_proportion_loglog

## 8.  Dispersion (phi) variants 

M7_inverse_brier_nophi <- betareg::betareg(
  Inverse_Brier_Score ~ recurrence:grammartype + laminations:grammartype + recurrence:laminations +
    recurrence + laminations + inputsize + grammartype + neurons + layers, # no phi sub-model
  data = df, link = "loglog"
)

M7_proportion_nophi <- betareg::betareg(
  Proportion_Correct ~ recurrence:grammartype + laminations:grammartype + recurrence:laminations +
    recurrence + laminations + inputsize + grammartype + neurons + layers, # no phi sub-model
  data = df, link = "loglog"
)

phi_tbl <- dplyr::bind_rows(
  broom::glance(best_mod_inverse_brier) |> dplyr::mutate(Model = "M7 (Inverse Brier; dispersion φ sub-model)"),
  broom::glance(M7_inverse_brier_nophi) |> dplyr::mutate(Model = "M7 (Inverse Brier; φ constant)"),
  broom::glance(best_mod_proportion) |> dplyr::mutate(Model = "M7 (Proportion; dispersion φ sub-model)"),
  broom::glance(M7_proportion_nophi) |> dplyr::mutate(Model = "M7 (Proportion; φ constant)")
) |>
  dplyr::select(Model, logLik, AIC, BIC, pseudo.r.squared)

phi_kable <- kableExtra::kable(phi_tbl, digits = 3, caption = "Dispersion vs equi‑dispersion") |>
  kableExtra::kable_styling(full_width = FALSE) 

nophi_inverse_brier_lrtest <- lmtest::lrtest(M7_inverse_brier_nophi, best_mod_inverse_brier)
nophi_proportion_lrtest <- lmtest::lrtest(M7_proportion_nophi, best_mod_proportion)

formulas_inverse_brier_phi <- list(
  "M1a" = Inverse_Brier_Score ~ recurrence:grammartype + laminations:grammartype + recurrence:laminations + inputsize:grammartype + recurrence + laminations + inputsize + grammartype + neurons + layers |
    recurrence:grammartype + recurrence + laminations + inputsize + grammartype + neurons + layers, # Add recurrence:grammartype interaction
  "M1b" = Inverse_Brier_Score ~ recurrence:grammartype + laminations:grammartype + recurrence:laminations + inputsize:grammartype + recurrence + laminations + inputsize + grammartype + neurons + layers |
    laminations:grammartype + recurrence + laminations + inputsize + grammartype + neurons + layers, # Add laminations:grammartype interaction
  "M1c" = Inverse_Brier_Score ~ recurrence:grammartype + laminations:grammartype + recurrence:laminations + inputsize:grammartype + recurrence + laminations + inputsize + grammartype + neurons + layers |
    recurrence:laminations + recurrence + laminations + inputsize + grammartype + neurons + layers, # Add recurrence:laminations interaction
  "M1d" = Inverse_Brier_Score ~ recurrence:grammartype + laminations:grammartype + recurrence:laminations + inputsize:grammartype + recurrence + laminations + inputsize + grammartype + neurons + layers |
    inputsize:grammartype + recurrence + laminations + inputsize + grammartype + neurons + layers, # Add inputsize:grammartype interaction
  "M1e" = Inverse_Brier_Score ~ recurrence:grammartype + laminations:grammartype + recurrence:laminations + inputsize:grammartype + recurrence + laminations + inputsize + grammartype + neurons + layers |
    recurrence:grammartype + laminations:grammartype + recurrence + laminations + inputsize + grammartype + neurons + layers, # Add recurrence:grammartype and laminations:grammartype interactions
  "M1f" = Inverse_Brier_Score ~ recurrence:grammartype + laminations:grammartype + recurrence:laminations + inputsize:grammartype + recurrence + laminations + inputsize + grammartype + neurons + layers |
    recurrence:grammartype + laminations:grammartype + recurrence:laminations + recurrence + laminations + inputsize + grammartype + neurons + layers, # Add recurrence:grammartype, laminations:grammartype and recurrence:laminations interactions
  "M1g" = Inverse_Brier_Score ~ recurrence:grammartype + laminations:grammartype + recurrence:laminations + inputsize:grammartype + recurrence + laminations + inputsize + grammartype + neurons + layers |
    recurrence:grammartype + laminations:grammartype + recurrence:laminations + inputsize:grammartype + recurrence + laminations + inputsize + grammartype + neurons + layers # Add all interactions
)

formulas_proportion_phi <- list(
  "M1a" = Proportion_Correct ~ recurrence:grammartype + laminations:grammartype + recurrence:laminations + inputsize:grammartype + recurrence + laminations + inputsize + grammartype + neurons + layers |
    recurrence:grammartype + recurrence + laminations + inputsize + grammartype + neurons + layers, # Add recurrence:grammartype interaction
  "M1b" = Proportion_Correct ~ recurrence:grammartype + laminations:grammartype + recurrence:laminations + inputsize:grammartype + recurrence + laminations + inputsize + grammartype + neurons + layers |
    laminations:grammartype + recurrence + laminations + inputsize + grammartype + neurons + layers, # Add laminations:grammartype interaction
  "M1c" = Proportion_Correct ~ recurrence:grammartype + laminations:grammartype + recurrence:laminations + inputsize:grammartype + recurrence + laminations + inputsize + grammartype + neurons + layers |
    recurrence:laminations + recurrence + laminations + inputsize + grammartype + neurons + layers, # Add recurrence:laminations interaction
  "M1d" = Proportion_Correct ~ recurrence:grammartype + laminations:grammartype + recurrence:laminations + inputsize:grammartype + recurrence + laminations + inputsize + grammartype + neurons + layers |
    inputsize:grammartype + recurrence + laminations + inputsize + grammartype + neurons + layers, # Add inputsize:grammartype interaction
  "M1e" = Proportion_Correct ~ recurrence:grammartype + laminations:grammartype + recurrence:laminations + inputsize:grammartype + recurrence + laminations + inputsize + grammartype + neurons + layers |
    recurrence:grammartype + laminations:grammartype + recurrence + laminations + inputsize + grammartype + neurons + layers, # Add recurrence:grammartype and laminations:grammartype interactions
  "M1f" = Proportion_Correct ~ recurrence:grammartype + laminations:grammartype + recurrence:laminations + inputsize:grammartype + recurrence + laminations + inputsize + grammartype + neurons + layers |
    recurrence:grammartype + laminations:grammartype + recurrence:laminations + recurrence + laminations + inputsize + grammartype + neurons + layers, # Add recurrence:grammartype, laminations:grammartype and recurrence:laminations interactions
  "M1g" = Proportion_Correct ~ recurrence:grammartype + laminations:grammartype + recurrence:laminations + inputsize:grammartype + recurrence + laminations + inputsize + grammartype + neurons + layers |
    recurrence:grammartype + laminations:grammartype + recurrence:laminations + inputsize:grammartype + recurrence + laminations + inputsize + grammartype + neurons + layers # Add all interactions
)

fits_inverse_brier_phi <- purrr::map(formulas_inverse_brier_phi, ~ betareg::betareg(.x, data = df, link = "loglog"), .progress = TRUE)
fits_proportion_phi <- purrr::map(formulas_proportion_phi, ~ betareg::betareg(.x, data = df, link = "loglog"), .progress = TRUE)

cv_inverse_brier_phi <- compute_cv_block_parallel(df, formulas_inverse_brier_phi, "Inverse_Brier_Score", link_fun = "loglog", k = 5)
cv_proportion_phi <- compute_cv_block_parallel(df, formulas_proportion_phi, "Proportion Correct", link_fun = "loglog", k = 5)

fits_inverse_brier_phi$M1 <- best_mod_inverse_brier
fits_proportion_phi$M1 <- best_mod_proportion

cv_inverse_brier_phi <- cv_inverse_brier_phi |>
  dplyr::mutate(`RMSE M1 (Logit link)` = cv_inverse_brier$`RMSE M1`)

cv_proportion_phi <- cv_proportion_phi |>
  dplyr::mutate(`RMSE M1 (Logit link)` = cv_proportion$`RMSE M1`)

fit_tbl_phi <- purrr::map_dfr(fits_inverse_brier_phi, ~ broom::glance(.x), .id = "Model") |>
  dplyr::mutate(`Response Variable` = "Inverse Brier Score") |>
  dplyr::bind_rows(
    dplyr::mutate(purrr::map_dfr(fits_proportion_phi, ~ broom::glance(.x), .id = "Model"),
                  `Response Variable` = "Proportion Correct")
    ) |>
  dplyr::select(Model, `Response Variable`, logLik, df.residual, AIC, BIC, pseudo.r.squared) 

kable_table_phi <- kableExtra::kable(fit_tbl_phi, digits = 3, caption = "Fit statistics for all candidate models with phi modelling") |>
  kableExtra::kable_styling(full_width = FALSE)

best_mod_inverse_brier <- fits_inverse_brier_phi$M1g # This is better on AIC/BIC and better on cross-validation.
best_mod_proportion <- fits_proportion_phi$M1g # This is better on AIC/BIC and better on cross-validation.

## 9.  Residuals check 

best_mod_residuals_inverse_brier <- plot_resid(best_mod_inverse_brier)
ggplot2::ggsave("plots/best_model_inverse_brier_dispersion.svg", plot = best_mod_residuals_inverse_brier)

breusch_pagan_inverse_brier <- lmtest::bptest(best_mod_inverse_brier) # heteroskedastic

best_mod_residuals_proportion <- plot_resid(best_mod_proportion)
ggplot2::ggsave("plots/best_model_proportion_dispersion.svg", plot = best_mod_residuals_proportion)

breusch_pagan_proportion <- lmtest::bptest(best_mod_proportion) # heteroskedastic

# There is a lot of heteroskedasticity, but this might not be a problem for Beta regression, which is explicitly designed for handling heteroskedasticity

## 10.  Final model summary & EMMs 

# Recurrence Grammar Type interaction

emm_rec_gram_inverse_brier <- emmeans::emmeans(best_mod_inverse_brier, ~ recurrence * grammartype, type = "response")
emm_rec_gram_inverse_brier_kable <- kableExtra::kable(as.data.frame(emm_rec_gram_inverse_brier),
      digits = 8, caption = "Recurrence × Grammar Type EMMs (Inverse Brier Score)") |>
  kableExtra::kable_styling(full_width = FALSE) 

emm_rec_gram_pairwise_inverse_brier <- kableExtra::kable(as.data.frame(pairs(emm_rec_gram_inverse_brier, by = "grammartype")),
      digits = 8, caption = "Pairwise Contrasts Between Architectures By Grammar Type (Inverse Brier Score)") |>
  kableExtra::kable_styling(full_width = FALSE) 

emm_gram_rec_pairwise_inverse_brier <- kableExtra::kable(as.data.frame(pairs(emm_rec_gram_inverse_brier, by = "recurrence")),
      digits = 8, caption = "Pairwise Contrasts Between Grammar Types By Architecture (Inverse Brier Score)") |>
  kableExtra::kable_styling(full_width = FALSE) 

emm_rec_gram_proportion <- emmeans::emmeans(best_mod_proportion, ~ recurrence * grammartype, type = "response")
emm_rec_gram_proportion_kable <- kableExtra::kable(as.data.frame(emm_rec_gram_proportion),
                                                      digits = 8, caption = "Recurrence × Grammar Type EMMs (Proportion Correct)") |>
  kableExtra::kable_styling(full_width = FALSE) 

emm_rec_gram_pairwise_proportion <- kableExtra::kable(as.data.frame(pairs(emm_rec_gram_proportion, by = "grammartype")),
                                                         digits = 8, caption = "Pairwise Contrasts Between Architectures By Grammar Type (Proportion Correct)") |>
  kableExtra::kable_styling(full_width = FALSE) 

emm_gram_rec_pairwise_proportion <- kableExtra::kable(as.data.frame(pairs(emm_rec_gram_proportion, by = "recurrence")),
                                                         digits = 8, caption = "Pairwise Contrasts Between Grammar Types By Architecture (Proportion Correct)") |>
  kableExtra::kable_styling(full_width = FALSE) 


# Laminations Grammar Type Interaction

emm_lams_gram_inverse_brier <- emmeans::emmeans(best_mod_inverse_brier, ~ laminations * grammartype, type = "response")
emm_lams_gram_inverse_brier_kable <- kableExtra::kable(as.data.frame(emm_lams_gram_inverse_brier),
                                                      digits = 8, caption = "Laminations × Grammar Type EMMs (Inverse Brier Score)") |>
  kableExtra::kable_styling(full_width = FALSE) 

emm_lams_gram_pairwise_inverse_brier <- kableExtra::kable(as.data.frame(pairs(emm_lams_gram_inverse_brier, by = "grammartype")),
                                                         digits = 8, caption = "Pairwise Contrasts Between Laminations By Grammar Type (Inverse Brier Score)") |>
  kableExtra::kable_styling(full_width = FALSE) 

emm_gram_lams_pairwise_inverse_brier <- kableExtra::kable(as.data.frame(pairs(emm_lams_gram_inverse_brier, by = "laminations")),
                                                         digits = 8, caption = "Pairwise Contrasts Between Grammar Types By Laminations (Inverse Brier Score)") |>
  kableExtra::kable_styling(full_width = FALSE) 

emm_lams_gram_proportion <- emmeans::emmeans(best_mod_proportion, ~ laminations * grammartype, type = "response")
emm_lams_gram_proportion_kable <- kableExtra::kable(as.data.frame(emm_lams_gram_proportion),
                                                   digits = 8, caption = "Laminations × Grammar Type EMMs (Proportion Correct)") |>
  kableExtra::kable_styling(full_width = FALSE) 

emm_lams_gram_pairwise_proportion <- kableExtra::kable(as.data.frame(pairs(emm_lams_gram_proportion, by = "grammartype")),
                                                      digits = 8, caption = "Pairwise Contrasts Between Laminations By Grammar Type (Proportion Correct)") |>
  kableExtra::kable_styling(full_width = FALSE) 

emm_gram_lams_pairwise_proportion <- kableExtra::kable(as.data.frame(pairs(emm_lams_gram_proportion, by = "laminations")),
                                                      digits = 8, caption = "Pairwise Contrasts Between Grammar Types By Laminations (Proportion Correct)") |>
  kableExtra::kable_styling(full_width = FALSE) 


# Laminations Recurrence Interaction

emm_lams_rec_inverse_brier <- emmeans::emmeans(best_mod_inverse_brier, ~ laminations * recurrence, type = "response")
emm_lams_rec_inverse_brier_kable <- kableExtra::kable(as.data.frame(emm_lams_rec_inverse_brier),
                                                       digits = 8, caption = "Laminations × Recurrence EMMs (Inverse Brier Score)") |>
  kableExtra::kable_styling(full_width = FALSE) 

emm_lams_rec_pairwise_inverse_brier <- kableExtra::kable(as.data.frame(pairs(emm_lams_rec_inverse_brier, by = "laminations")),
                                                          digits = 8, caption = "Pairwise Contrasts Between Recurrence By Lamination (Inverse Brier Score)") |>
  kableExtra::kable_styling(full_width = FALSE) 

emm_rec_lams_pairwise_inverse_brier <- kableExtra::kable(as.data.frame(pairs(emm_lams_rec_inverse_brier, by = "recurrence")),
                                                          digits = 8, caption = "Pairwise Contrasts Between Grammar Types By Architecture (Inverse Brier Score)") |>
  kableExtra::kable_styling(full_width = FALSE) 

emm_lams_rec_proportion <- emmeans::emmeans(best_mod_proportion, ~ laminations * recurrence, type = "response")
emm_lams_rec_proportion_kable <- kableExtra::kable(as.data.frame(emm_lams_rec_proportion),
                                                      digits = 8, caption = "Laminations × Recurrence EMMs (Proportion Correct)") |>
  kableExtra::kable_styling(full_width = FALSE) 

emm_lams_rec_pairwise_proportion <- kableExtra::kable(as.data.frame(pairs(emm_lams_rec_proportion, by = "laminations")),
                                                         digits = 8, caption = "Pairwise Contrasts Between Recurrence By Lamination (Proportion Correct)") |>
  kableExtra::kable_styling(full_width = FALSE) 

emm_rec_lams_pairwise_proportion <- kableExtra::kable(as.data.frame(pairs(emm_lams_rec_proportion, by = "recurrence")),
                                                         digits = 8, caption = "Pairwise Contrasts Between Grammar Types By Architecture (Proportion Correct)") |>
  kableExtra::kable_styling(full_width = FALSE)


# Input size

emm_input_inverse_brier <- emmeans::emmeans(best_mod_inverse_brier, ~ inputsize * grammartype,
                     at   = list(inputsize = seq(1, 12, by = 1)),
                     type = "response")

inputsize_kabel_inverse_brier <- kableExtra::kable(as.data.frame(emm_input_inverse_brier), digits = 8,
      caption = "Predicted mean inverse Brier score across input‑size grid\nResults averaged over the levels of: recurrence, laminations\nConfidence level used: 0.95") |>
  kableExtra::kable_styling(full_width = FALSE) 

emm_input_proportion <- emmeans::emmeans(best_mod_proportion, ~ inputsize * grammartype,
                                            at   = list(inputsize = seq(1, 12, by = 1)),
                                            type = "response")

inputsize_kabel_proportion <- kableExtra::kable(as.data.frame(emm_input_proportion), digits = 8,
                                                   caption = "Predicted mean proportion correct across input‑size grid\nResults averaged over the levels of: recurrence, laminations\nConfidence level used: 0.95") |>
  kableExtra::kable_styling(full_width = FALSE)

layers_tr_inverse_brier <- emmeans::emtrends(best_mod_inverse_brier, specs = ~ 1, var = "layers")
layers_kable_table_inverse_brier <- kableExtra::kable(as.data.frame(layers_tr_inverse_brier), digits = 8) |>
  kableExtra::kable_styling(full_width = FALSE) 

layers_tr_proportion <- emmeans::emtrends(best_mod_proportion, specs = ~ 1, var = "layers")
layers_kable_table_proportion <- kableExtra::kable(as.data.frame(layers_tr_proportion), digits = 8) |>
  kableExtra::kable_styling(full_width = FALSE) 

neurons_tr_inverse_brier <- emmeans::emtrends(best_mod_inverse_brier, specs = ~ 1, var = "neurons")
neurons_kable_table_inverse_brier <- kableExtra::kable(as.data.frame(neurons_tr_inverse_brier), digits = 8) |>
  kableExtra::kable_styling(full_width = FALSE) 

neurons_tr_proportion <- emmeans::emtrends(best_mod_proportion, specs = ~ 1, var = "neurons")
neurons_kable_table_proportion <- kableExtra::kable(as.data.frame(neurons_tr_proportion), digits = 8) |>
  kableExtra::kable_styling(full_width = FALSE) 

## 11.  Open Markdown sink 

sink("results/regression_output.md")
cat("# Beta‑Regression Model Selection Report\n\n")
cat("*Generated on:", format(Sys.time(), "%Y‑%m‑%d %H:%M"), "*\n\n")
cat("*Author*: Konstantinos Voudouris\n\n")

cat("## Main Effects Model Selection\n\n")
cat("We fit eight nested or semi‑nested models, progressively adding interaction",
    "terms and/or a quadratic effect of `inputsize`. We do so for both output variables, Inverse Brier Score and Proportion Correct.\n",
    "We assume all main effects are in the phi (variance) sub-model. This is investigated later.\n\n")

cat("We apply Smithson-Verkuilen shrinkage to any 0s or 1s in the response variable, following standard practice.\n",
    "*Note*: We attempted the use of extended beta regressions to handle these responses natively, but they take too long to fit for our very large dataset, due to the inclusion of the nu parameters which also have to be learnt.\n\n")

cat(
  "We fitted the following models for model selection (with logit links) for Inverse Brier Score...\n\n```\n",
  paste(
    names(formulas_inverse_brier),
    vapply(formulas_inverse_brier, function(f) paste(deparse(f), collapse = ""), ""),
    sep = ": ",
    collapse = "\n\n"
  ),
  "\n```\n\n"
)

cat(
  "We fitted the same models for model selection (with logit links) for Proportion Correct...\n\n```\n",
  paste(
    names(formulas_inverse_brier),
    vapply(formulas_inverse_brier, function(f) paste(deparse(f), collapse = ""), ""),
    sep = ": ",
    collapse = "\n\n"
  ),
  "\n```\n\n"
)

cat("\n### Fit statistics\n\n\n")

kable_table_inverse_brier <- kableExtra::kable(fit_inverse_brier_tbl, digits = 3, caption = "Fit statistics for all candidate models with Inverse Brier Score") |>
  kableExtra::kable_styling(full_width = FALSE)

cat(kable_table_inverse_brier, sep = "\n\n")

cat("\n\n")

kable_table_proportion <- kableExtra::kable(fit_proportion_tbl, digits = 3, caption = "Fit statistics for all candidate models with Proportion Correct") |>
  kableExtra::kable_styling(full_width = FALSE)

cat(kable_table_proportion, sep = "\n\n")

cat("\n### Likelihood Ratios between nested models\n\n\n")

lr_progression_table_inverse_brier <- kableExtra::kable(lr_progression_inverse_brier, digits = 8, caption = "Stepwise Likelihood Ratios (Wilks Tests) on Inverse Brier Score Models") |>
  kableExtra::kable_styling(full_width = FALSE) 

cat(lr_progression_table_inverse_brier, sep = "\n\n")

cat("\n\n")

lr_progression_table_proportion <- kableExtra::kable(lr_progression_proportion, digits = 8, caption = "Stepwise Likelihood Ratios (Wilks Tests) on Proportion Correct Models") |>
  kableExtra::kable_styling(full_width = FALSE) 

cat(lr_progression_table_proportion, sep = "\n\n")

cat("\n### 5-Fold Cross-Validation\n\n\n")

cv_kable_table_inverse_brier <- kableExtra::kable(cv_inverse_brier, digits = 3, caption = "Cross validation RMSEs (lower is better) for all candidate models with Inverse Brier Score") |>
  kableExtra::kable_styling(full_width = FALSE)

cat(cv_kable_table_inverse_brier, sep = "\n\n")

cat("\n\n")

cv_kable_table_proportion <- kableExtra::kable(cv_proportion, digits = 3, caption = "Cross validation RMSEs (lower is better) for all candidate models with Proportion Correct") |>
  kableExtra::kable_styling(full_width = FALSE)

cat(cv_kable_table_proportion, sep = "\n\n")

cat("\n### Best Main Effects Model Specification\n")

cat("\n**Maximal Model (M1)** has the lowest AIC/BIC overall and is the (joint) best performing on cross-validation, so we\n",
    "treat it as the *current best* specification:\n\n")

cat("\n```\n", paste(deparse(formulas_inverse_brier$M1)), "\n\n", paste(deparse(formulas_proportion$M1)), "\n```\n\n")

cat("\n## Link Function Selection")

cat("\nNow let's check if the link function is appropriate. \n", 
    "Cribari-Neto and Lima (2007; A Misspecification Test for Beta Regressions) ",
    "suggest that loglog link can be better for handling extreme values close to 0 or 1, which we have in this data."
)

cat(link_kable, sep = "\n\n")

cat("\nThe loglog link appears to allow for a better fit, both on AIC and BIC, so we proceed with it given the Crebari-Neto and Lima reasoning about extreme values.\n")

cat("\n## Dispersion (phi-)Model Selection\n\n")

cat("\n### Dispersion vs. Equi-Dispersion\n\n\n")

cat(phi_kable, sep = "\n\n")

cat("\nWhile the pseudo-R^2 is much higher without modelling phi, the AIC/BIC is improved. We use a likelihood-ratio test to confirm.\n")

cat("A likelihood‑ratio test confirms the dispersion sub‑model for Inverse Brier Score is warranted (higher log-likelihood):\n\n")
cat("```")
print(nophi_inverse_brier_lrtest)
cat("```\n\n")

cat("A likelihood‑ratio test confirms the dispersion sub‑model for Proportion Correct is warranted (higher log-likelihood):\n\n")
cat("```")
print(nophi_proportion_lrtest)
cat("```\n\n")

cat("\n### Interaction Effects\n\n")

cat(
  "We fitted the following models for model selection (with loglog links) for Inverse Brier Score...\n\n```\n",
  paste(
    names(formulas_inverse_brier_phi),
    vapply(formulas_inverse_brier_phi, function(f) paste(deparse(f), collapse = ""), ""),
    sep = ": ",
    collapse = "\n\n"
  ),
  "\n```\n\n"
)

cat(
  "We fitted the same models for model selection (with loglog links) for Proportion Correct...\n\n```\n",
  paste(
    names(formulas_proportion_phi),
    vapply(formulas_proportion_phi, function(f) paste(deparse(f), collapse = ""), ""),
    sep = ": ",
    collapse = "\n\n"
  ),
  "\n```\n\n"
)


cat(kable_table_phi, sep = "\n\n")

cat("\n\n")

cv_kable_table_inverse_brier_phi <- kableExtra::kable(cv_inverse_brier_phi, digits = 3, caption = "Cross validation RMSEs (lower is better) for all candidate phi models with Inverse Brier Score") |>
  kableExtra::kable_styling(full_width = FALSE)

cat(cv_kable_table_inverse_brier_phi, sep = "\n\n")

cat("\n\n")

cv_kable_table_proportion_phi <- kableExtra::kable(cv_proportion_phi, digits = 3, caption = "Cross validation RMSEs (lower is better) for all candidate phi models with Proportion Correct") |>
  kableExtra::kable_styling(full_width = FALSE)

cat(cv_kable_table_proportion_phi, sep = "\n\n")

cat("\n\n ### Best Phi Model Specification\n\n")

cat("M1g (maximal phi-model) is much improved on AIC/BIC and is equally performant on cross-validation. Hence, we proceed with M1g as the best model specification.\n\n")

cat("\n```\n", paste(deparse(formulas_inverse_brier_phi$M1g)), "\n\n", paste(deparse(formulas_proportion_phi$M1g)), "\n```\n\n")

cat("\n### Heteroskedasticity Checks \n")
cat("*Plots saved separately as svg files*: `plots/best_model_inverse_brier_resid_dispersion.svg`, `plots/best_model_proportion_resid_dispersion.svg`\n\n")

cat("Breusch-Pagan tests confirm the heteroskedasticity:\n")

cat("```\n")

print(breusch_pagan_inverse_brier)

cat("\n\n")

print(breusch_pagan_proportion)

cat("\n```\n\n")

cat("There is still heteroskedasticity in the model, as indicated by the fan shape of the residuals. This should be noted, but also beta regression doesn't have well-defined residual checks and it may not necessarily be a problem for Beta regression, since it is designed to handle heteroskedasticity.\n\n")

cat("\n# Final Model Statistics\n\n")

cat("## Inverse Brier Score Model\n\n")
cat("```")
print(summary(best_mod_inverse_brier))
cat("```\n\n")

cat("\n### Recurrence-Grammar Interaction\n\n")

cat("\n#### Estimated Marginal Means (EMMs)\n\n")

cat(emm_rec_gram_inverse_brier_kable, sep = "\n\n")

cat("\n#### Pairwise Contrasts  \n\n")

cat(emm_rec_gram_pairwise_inverse_brier, sep = "\n\n")

cat("\n")

cat(emm_gram_rec_pairwise_inverse_brier, sep = "\n\n")


cat("\n### Laminations-Grammar Interaction\n\n")

cat("\n#### Estimated Marginal Means (EMMs)\n\n")

cat(kableExtra::kable(emm_lams_gram_inverse_brier, digits = 8, caption = "Laminations × Grammar EMMs (Inverse Brier Score)") |>
      kableExtra::kable_styling(full_width = FALSE), sep = "\n\n")

cat("\n#### Pairwise Contrasts  \n\n")

cat(emm_lams_gram_pairwise_inverse_brier, sep = "\n\n")

cat("\n")

cat(emm_gram_lams_pairwise_inverse_brier, sep = "\n\n")


cat("\n### Recurrence-Laminations Interaction\n\n")

cat("\n#### Estimated Marginal Means (EMMs)\n\n")

cat(emm_lams_rec_inverse_brier_kable, sep = "\n\n")

cat("\n#### Pairwise Contrasts  \n\n")

cat(emm_lams_rec_pairwise_inverse_brier, sep = "\n\n")

cat("\n")

cat(emm_rec_lams_pairwise_inverse_brier, sep = "\n\n")


cat("\n### Input Size \n\n")

cat(kableExtra::kable(emm_input_inverse_brier, digits = 8, caption = "Input Size × Grammar EMMs (Inverse Brier Score)") |>
        kableExtra::kable_styling(full_width = FALSE), sep = "\n\n"  )

cat("\n### Slope of layers\n\n")

cat(layers_kable_table_inverse_brier, sep = "\n\n")

cat("\n### Slope of neurons\n\n")

cat(neurons_kable_table_inverse_brier, sep = "\n\n")

cat("\n\n## Proportion Correct Model\n\n")
cat("```")
print(summary(best_mod_proportion))
cat("```\n\n")

cat("\n### Recurrence-Grammar Interaction\n\n")

cat("\n#### Estimated Marginal Means (EMMs)\n\n")

cat(emm_rec_gram_proportion_kable, sep = "\n\n")

cat("\n#### Pairwise Contrasts  \n\n")

cat(emm_rec_gram_pairwise_proportion, sep = "\n\n")

cat("\n")

cat(emm_gram_rec_pairwise_proportion, sep = "\n\n")


cat("\n### Laminations-Grammar Interaction\n\n")

cat("\n#### Estimated Marginal Means (EMMs)\n\n")

cat(kableExtra::kable(emm_lams_gram_proportion, digits = 8, caption = "Laminations × Grammar EMMs (Proportion Correct)") |>
      kableExtra::kable_styling(full_width = FALSE) , sep = "\n\n")

cat("\n#### Pairwise Contrasts  \n\n")

cat(emm_lams_gram_pairwise_proportion, sep = "\n\n")

cat("\n")

cat(emm_gram_lams_pairwise_proportion, sep = "\n\n")


cat("\n### Recurrence-Laminations Interaction\n\n")

cat("\n#### Estimated Marginal Means (EMMs)\n\n")

cat(emm_lams_rec_proportion_kable, sep = "\n\n")

cat("\n#### Pairwise Contrasts  \n\n")

cat(emm_lams_rec_pairwise_proportion, sep = "\n\n")

cat("\n")

cat(emm_rec_lams_pairwise_proportion, sep = "\n\n")


cat("\n### Input Size \n\n")

cat(kableExtra::kable(emm_input_proportion, digits = 8, caption = "Input Size × Grammar EMMs (Inverse Brier Score)") |>
      kableExtra::kable_styling(full_width = FALSE), sep = "\n\n" )

cat("\n\n### Slope of layers\n\n")

cat(layers_kable_table_proportion, sep = "\n\n")

cat("\n### Slope of neurons\n\n")

cat(neurons_kable_table_proportion, sep = "\n\n")

cat("\n\n\n")

sink()  # ---- CLOSE THE MARKDOWN FILE ----
