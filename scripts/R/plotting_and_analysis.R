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
      dplyr::mutate(factor(inputsize/6, levels = c(1:12)))

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
                    inputsize = factor(inputsize/6, levels = c(1:12)))

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

## 1.  Data prep  

df <- post_training_data_summarised |>
  dplyr::mutate(
    Brier_Skill_Score = (`Brier Skill Score` + 3) / 4,      # [0,1]
    Brier_Skill_Score = (Brier_Skill_Score * (dplyr::n() - 1) + 0.5) / dplyr::n(), # Apply Smithson-Verkuilen shrinkage to transform 0s and 1s.
    inputsize = inputsize / 6
  )

## 2.  Model specifications 

formulas <- list(
  M0 = Brier_Skill_Score ~ recurrence + laminations + inputsize +
    grammartype + neurons + layers,  # Basic model with only main effects and no phi modelling
  M1 = Brier_Skill_Score ~ recurrence + laminations + inputsize + grammartype + neurons + layers | 
    recurrence + laminations + inputsize + grammartype + neurons + layers, # Basic model with only main effects and phi modelling
  M2 = Brier_Skill_Score ~ recurrence*grammartype + recurrence + laminations + inputsize + grammartype + neurons + layers | 
    recurrence + laminations + inputsize + grammartype + neurons + layers, # introduce a single interaction between recurrence and grammartype
  M3 = Brier_Skill_Score ~ laminations*grammartype + recurrence + laminations + inputsize + grammartype + neurons + layers | 
    recurrence + laminations + inputsize + grammartype + neurons + layers, # introduce a single interaction between laminations and grammartype
  M4 = Brier_Skill_Score ~ recurrence + laminations + poly(inputsize, 2) + grammartype + neurons + layers | 
    recurrence + laminations + inputsize + grammartype + neurons + layers, # introduce a polynomial term for input size
  M5 = Brier_Skill_Score ~ recurrence*laminations + recurrence + laminations + inputsize + grammartype + neurons + layers | 
    recurrence + laminations + inputsize + grammartype + neurons + layers, # introduce a single interaction between recurrence and laminations
  M6 = Brier_Skill_Score ~ recurrence*grammartype + laminations*grammartype + recurrence + laminations + inputsize + grammartype + neurons + layers | 
    recurrence + laminations + inputsize + grammartype + neurons + layers, # introduce a two interaction terms of recurrence and lamination with grammartype
  M7 = Brier_Skill_Score ~ recurrence*grammartype +laminations*grammartype + recurrence + laminations + poly(inputsize, 2) + grammartype + neurons + layers | 
    recurrence + laminations + inputsize + grammartype + neurons + layers # add in the polynomial input size term
  )


## 3.  Fit all models (logit link)

fits <- purrr::map(formulas, ~ betareg::betareg(.x, data = df, link = "logit"))

## 4.  Collect fit statistics 

fit_tbl <- purrr::map_dfr(fits, ~ broom::glance(.x), .id = "Model") |>
  dplyr::select(Model, logLik, df.residual, AIC, BIC, pseudo.r.squared) 

## 5.  Likelihood Ratios

ratios <- list(
  "M0 vs. M1" = lmtest::lrtest(fits$M0, fits$M1),
  "M0 vs. M2" = lmtest::lrtest(fits$M0, fits$M2),
  "M0 vs. M3" = lmtest::lrtest(fits$M0, fits$M3),
  "M0 vs. M4" = lmtest::lrtest(fits$M0, fits$M4),
  "M0 vs. M5" = lmtest::lrtest(fits$M0, fits$M5),
  "M0 vs. M6" = lmtest::lrtest(fits$M0, fits$M6),
  "M0 vs. M7" = lmtest::lrtest(fits$M0, fits$M7),
  "M1 vs. M2" = lmtest::lrtest(fits$M1, fits$M2),
  "M1 vs. M3" = lmtest::lrtest(fits$M1, fits$M3),
  "M1 vs. M4" = lmtest::lrtest(fits$M1, fits$M4),
  "M1 vs. M5" = lmtest::lrtest(fits$M1, fits$M5),
  "M1 vs. M6" = lmtest::lrtest(fits$M1, fits$M6),
  "M1 vs. M7" = lmtest::lrtest(fits$M1, fits$M7),
  "M6 vs. M7" = lmtest::lrtest(fits$M6, fits$M7)
)

lr_progression <- purrr::imap_dfr(
  ratios,                      # <-- your list of lrtest objects
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

best_mod <- fits$M7

## 6.  Compare link functions (logit vs log‑log) 

# Now let's check if the link function is appropriate. \n 
# Cribari-Neto and Lima (2007; A Misspecification Test for Beta Regressions)
# suggest that loglog link can be better for handling extreme values close to 0 or 1, 
# which we have in this data.

M7_loglog <- betareg::betareg(
  formulas$M7,
  data = df, link = "loglog"
)

link_tbl <- dplyr::bind_rows(
  broom::glance(best_mod) |> dplyr::mutate(Model = "M7", Link = "logit"),
  broom::glance(M7_loglog) |> dplyr::mutate(Model = "M7", Link = "loglog")
) |>
  dplyr::select(Model, Link, logLik, AIC, BIC, pseudo.r.squared)

link_kable <- kableExtra::kable(link_tbl, digits = 3, caption = "Link‑function comparison for M7") |>
  kableExtra::kable_styling(full_width = FALSE)

## 8.  Dispersion (phi) variants 

M7_nophi <- betareg::betareg(
  Brier_Skill_Score ~ recurrence*grammartype + laminations*grammartype +
    poly(inputsize, 2) + recurrence + laminations +
    grammartype + neurons + layers, # no phi sub-model
  data = df, link = "logit"
)

phi_tbl <- dplyr::bind_rows(
  broom::glance(best_mod) |> dplyr::mutate(Model = "M7 (dispersion φ sub-model)"),
  broom::glance(M7_nophi) |> dplyr::mutate(Model = "M7 (φ constant)")
) |>
  dplyr::select(Model, logLik, AIC, BIC, pseudo.r.squared)

phi_kable <- kableExtra::kable(phi_tbl, digits = 3, caption = "Dispersion vs equi‑dispersion") |>
  kableExtra::kable_styling(full_width = FALSE) 

nophi_lrtest <- lmtest::lrtest(M7_nophi, best_mod)

formulas_phi <- list(
  "M7a" = Brier_Skill_Score ~ recurrence*grammartype + laminations*grammartype + poly(inputsize, 2) + recurrence + laminations + grammartype + neurons + layers |
    recurrence*grammartype + recurrence + laminations + inputsize + grammartype + neurons + layers,
  "M7b" = Brier_Skill_Score ~ recurrence*grammartype + laminations*grammartype + poly(inputsize, 2) + recurrence + laminations + grammartype + neurons + layers |
    laminations*grammartype + recurrence + laminations + inputsize + grammartype + neurons + layers,
  "M7c" = Brier_Skill_Score ~ recurrence*grammartype + laminations*grammartype + poly(inputsize, 2) + recurrence + laminations + grammartype + neurons + layers |
    recurrence + laminations + poly(inputsize, 2) + grammartype + neurons + layers,
  "M7d" = Brier_Skill_Score ~ recurrence*grammartype + laminations*grammartype + poly(inputsize, 2) + recurrence + laminations + grammartype + neurons + layers |
    recurrence*grammartype + laminations*grammartype + recurrence + laminations + inputsize + grammartype + neurons + layers,
  "M7e" = Brier_Skill_Score ~ recurrence*grammartype + laminations*grammartype + poly(inputsize, 2) + recurrence + laminations + grammartype + neurons + layers |
    recurrence*grammartype + laminations*grammartype + recurrence + laminations + poly(inputsize, 2) + grammartype + neurons + layers
)

fits_phi <- purrr::map(formulas_phi, ~ betareg::betareg(.x, data = df, link = "logit"))

fits_phi$M7 <- best_mod

fit_tbl_phi <- purrr::map_dfr(fits_phi, ~ broom::glance(.x), .id = "Model") |>
  dplyr::select(Model, logLik, df.residual, AIC, BIC, pseudo.r.squared) 

kable_table_phi <- kableExtra::kable(fit_tbl_phi, digits = 3, caption = "Fit statistics for all candidate models") |>
  kableExtra::kable_styling(full_width = FALSE)

best_mod <- fits_phi$M7e # This is much better on AIC/BIC. Better R^2 for other models might indicate they are overfitting given their lower AIC/BIC scores.


## 9.  Residual‑fan check 

plot_resid <- function(mod){
  plot <- ggplot2::ggplot(data.frame(fit = fitted(mod),
                    res = residuals(mod, type = "deviance")),
                  ggplot2::aes(fit, res)) +
    ggplot2::geom_point(alpha = .25) +
    ggplot2::geom_hline(yintercept = 0) +
    ggplot2::labs(x = "Fitted", y = "Deviance residual") 
  return(plot)
}

best_mod_residuals <- plot_resid(best_mod)
ggplot2::ggsave("plots/best_model_dispersion.svg")

# Still some heteroskedasticity that doesn't seem to be being modelled by phi appropriately. Should be noted.

## 10.  Cross‑validation 

set.seed(1)
fold_id <- sample(rep(1:5, length.out = nrow(df))) # shuffled ids for cv sampling

cv_rmse <- purrr::map_dbl(1:5, function(f){
  train <- df[fold_id != f, ]
  test  <- df[fold_id == f, ]
  mod   <- betareg::betareg(formulas_phi$M7e, data = train, link = "logit")
  preds <- predict(mod, test) * 4 - 3
  ModelMetrics::rmse(test$`Brier Skill Score`, preds)
})

cv_tbl <- dplyr::tibble(Fold = 1:5, RMSE = cv_rmse)

cv_kable <- kableExtra::kable(cv_tbl, digits = 8) |>
  kableExtra::kable_styling(full_width = FALSE)

## 11.  Final model summary & EMMs 

emm_rec_gram <- emmeans::emmeans(best_mod, ~ recurrence * grammartype)
emm_rec_gram_kable <- kableExtra::kable(as.data.frame(emm_rec_gram),
      digits = 8, caption = "Recurrence × grammar‑type EMMs") |>
  kableExtra::kable_styling(full_width = FALSE) 

emm_rec_gram_pairwise <- kableExtra::kable(as.data.frame(pairs(emm_rec_gram, by = "grammartype")),
      digits = 8) |>
  kableExtra::kable_styling(full_width = FALSE) 

emm_gram_rec_pairwise <- kableExtra::kable(as.data.frame(pairs(emm_rec_gram, by = "recurrence")),
      digits = 8) |>
  kableExtra::kable_styling(full_width = FALSE) 

emm_input <- emmeans::emmeans(best_mod, ~ inputsize,
                     at   = list(inputsize = seq(1, 12, by = 1)),
                     type = "response")

inputsize_kabel <- kableExtra::kable(as.data.frame(emm_input), digits = 8,
      caption = "Predicted mean Brier across input‑size grid") |>
  kableExtra::kable_styling(full_width = FALSE) 

layers_tr <- emmeans::emtrends(best_mod, specs = ~ 1, var = "layers")
layers_kable_table <- kableExtra::kable(as.data.frame(layers_tr), digits = 8) |>
  kableExtra::kable_styling(full_width = FALSE) 

neurons_tr <- emmeans::emtrends(best_mod, specs = ~ 1, var = "neurons")
neurons_kable_table <- kableExtra::kable(as.data.frame(neurons_tr), digits = 8) |>
  kableExtra::kable_styling(full_width = FALSE) 

## 11.  Open Markdown sink 

sink("results/regression_output.md")
cat("# Beta‑Regression Model Selection Report\n\n")
cat("*Generated on:", format(Sys.time(), "%Y‑%m‑%d %H:%M"), "*\n\n")

cat("## Candidate models\n\n")
cat("We fit eight nested or semi‑nested models, progressively adding interaction",
    "terms and/or a quadratic effect of `inputsize`.\n\n")

cat(
  "Fitting the following models for model selection (with logit links)…\n\n",
  paste(
    names(formulas),
    vapply(formulas, function(f) paste(deparse(f), collapse = ""), ""),
    sep = ": ",
    collapse = "\n\n"
  ),
  "\n"
)

kable_table <- kableExtra::kable(fit_tbl, digits = 3, caption = "Fit statistics for all candidate models") |>
  kableExtra::kable_styling(full_width = FALSE)

cat(kable_table, sep = "\n\n")

cat("\n## Likelihood Ratios between nested models\n\n")

lr_progression_table <- kableExtra::kable(lr_progression, digits = 8, caption = "Stepwise Likelihood Ratios (Wilks Tests)") |>
  kableExtra::kable_styling(full_width = FALSE) 

cat(lr_progression_table, sep = "\n\n")

cat("\n**Model M7** has the lowest AIC/BIC overall, so we\n",
    "treat it as the *current best* specification:\n\n")

cat(paste(deparse(formulas$M7)))

cat("\nNow let's check if the link function is appropriate. \n", 
    "Cribari-Neto and Lima (2007; A Misspecification Test for Beta Regressions) ",
    "suggest that loglog link can be better for handling extreme values close to 0 or 1, which we have in this data."
)

cat(link_kable, sep = "\n\n")

cat("\nThe logit link appears to allow for a better fit, both on AIC/BIC and R^2.\n")

cat("### Dispersion (phi-model) Tests\n\n")

cat(phi_kable, sep = "\n\n")

cat("\nWhile the pseudo-R^2 is much higher without modelling phi, the AIC/BIC is improved. We can use a likelihood-ratio test to confirm.\n")

cat("A likelihood‑ratio test confirms the dispersion sub‑model is warranted (higher log-likelihood):\n\n")
cat("```")
print(nophi_lrtest)
cat("```\n\n")

cat("Let's check whether including interaction terms in the phi model improves fit:\n\n")

cat(
  "Fitting the following models for model selection (with logit links)...\n\n",
  paste(
    names(formulas_phi),
    vapply(formulas_phi, function(f) paste(deparse(f), collapse = ""), ""),
    sep = ": ",
    collapse = "\n\n"
  ),
  "\n"
)


cat(kable_table_phi, sep = "\n\n")

cat("M7e is much improved on AIC/BIC. The higher R^2 on the other models may indicate overfitting with no predictive gain. Hence, we proceed with M7e as the best model specification.\n\n")

cat("\n### Residual fan plots  \n")
cat("*(Plot saved separately as svg file: `plots/resid_dispersion.svg`\n\n")

cat("There is still heteroskedasticity in the model, as indicated by the fan shape of the residuals. This should be noted, but also beta regression doesn't have well-defined residual checks.\n\n")

cat("\n## Five‑fold cross‑validation (RMSE in Brier Skill Score units)\n\n")

cat(cv_kable, sep = "\n\n")

cat("\nMean RMSE:**", round(mean(cv_rmse), 4), "**\n\n")

cat("\n# Final model\n M7e with dispersion modelling with interactions and logit link\n\n")
cat("```")
print(summary(best_mod))
cat("```\n\n")

cat("\n## Estimated marginal means (EMMs)\n\n")

cat(emm_rec_gram_kable, sep = "\n\n")

cat("\n### Pairwise contrasts (recurrence within each grammar)  \n\n")

cat(emm_rec_gram_pairwise, sep = "\n\n")

cat("\n### Pairwise contrasts (grammar within each recurrence)  \n\n")

cat(emm_gram_rec_pairwise, sep = "\n\n")

cat("\n## Continuous predictors\n\n")

cat(inputsize_kabel, sep = "\n\n")

cat("\n### Slope of layers\n\n")

cat(layers_kable_table, sep = "\n\n")

cat("\n### Slope of neurons\n\n")

cat(neurons_kable_table, sep = "\n\n")

cat("\n\n\n")

sink()  # ---- CLOSE THE MARKDOWN FILE ----
