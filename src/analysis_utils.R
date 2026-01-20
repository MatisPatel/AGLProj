# Source functions

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

colour_palette <- c("#1B9E77FF", "#D95F02FF", "#7570B3FF", "#E7298AFF", 
                    "#66A61EFF", "#E6AB02FF", "#666666FF")

# general plotter with mean ± CI
plot_results <- function(data,
                         y,                 # string – column to plot on the y‑axis
                         colour,            # string – column that defines colour / legend
                         facet = NULL,      # string (optional) – column for facet_grid
                         x_levels = c("SL","LT","LTT","LTTO","MSO","CF","CS"),
                         ci = 0.99,         # width of the normal‑theory CI
                         xlab = "Grammar Type",
                         ylab = NULL,       # defaults to `y` if missing
                         col_lab = NULL,    # defaults to `fill` if missing
                         facet_lab = NULL,  # defaults to `facet` if missing
                         file = NULL,       # file name to save (NULL → don't save)
                         width = 16,
                         height = 8,
                         baseline_data = NULL,
                         baseline_label = "Sequential FFN") {
  
  ## convert strings → symbols for tidy‑eval
  xsym   <- rlang::sym("grammartype")
  ysym   <- rlang::sym(y)
  csym   <- rlang::sym(colour)
  facet_sym <- if (!is.null(facet)) rlang::sym(facet) else NULL
  
  ## build the plot -----------------------------------------------------------
  p <- ggplot2::ggplot(data, ggplot2::aes(x = factor(!!xsym, levels = x_levels),
                                          y = !!ysym,
                                          col = !!csym)) +
    
    # 1) point = mean
    ggplot2::stat_summary(fun = mean,
                          geom = "point",
                          size = 7,
                          position = ggplot2::position_dodge(width = 0.9)) +
    
    # 2) error bar = mean +- CI
    ggplot2::stat_summary(fun.data = ggplot2::mean_cl_boot,
                          fun.args = list(conf.int = ci),
                          geom = "errorbar",
                          position = ggplot2::position_dodge(width = 0.9),
                          width = 0.2,
                          linewidth = 1) +
    
    # dashed separators between grammar categories
    ggplot2::geom_vline(xintercept = seq(1.5, length(x_levels) - 0.5, by = 1),
                        linetype = "dashed",
                        colour = "grey80",
                        linewidth = 0.5,
                        show.legend = FALSE)
  
  ## add baseline lines, if provided ------------------------------------------
  if (!is.null(baseline_data)) {
    # Compute mean baseline value per grammar type (and facet if applicable)
    group_vars <- "grammartype"
    if (!is.null(facet)) {
      group_vars <- c(group_vars, facet)
    }
    
    baseline_summary <- baseline_data |>
      dplyr::group_by(dplyr::across(dplyr::all_of(group_vars))) |>
      dplyr::summarise(baseline_y = mean(!!ysym, na.rm = TRUE), .groups = "drop") |>
      dplyr::mutate(
        grammartype = factor(grammartype, levels = x_levels),
        xmin = as.numeric(grammartype) - 0.45,
        xmax = as.numeric(grammartype) + 0.45
      )
    
    p <- p +
      ggplot2::geom_segment(
        data = baseline_summary,
        ggplot2::aes(x = xmin, xend = xmax,
                     y = baseline_y, yend = baseline_y,
                     linetype = baseline_label),
        colour = "black",
        linewidth = 1,
        inherit.aes = FALSE
      ) +
      ggplot2::scale_linetype_manual(
        values = setNames("dashed", baseline_label),
        name = NULL
      )
  }
  
  n_levels <- length(unique(data[[colour]]))
  if (n_levels <= length(colour_palette)) {
    p <- p + ggplot2::scale_colour_manual(values = colour_palette)
  }
  
  ## add facets, if requested
  if (!is.null(facet_sym)) {
    p <- p + ggplot2::facet_grid(cols = ggplot2::vars(!!facet_sym))
  }
  
  # theme and labels
  p <- p + ggplot2::theme_minimal(base_size = 30) +
    ggplot2::theme(
      axis.text.x      = ggplot2::element_text(angle = 0, vjust = 0.5, hjust = 0.5),
      panel.grid.major = ggplot2::element_blank(),
      panel.grid.minor = ggplot2::element_blank(),
      panel.border     = ggplot2::element_rect(colour = "grey80", fill = NA, linewidth = 0.5),
      panel.spacing    = grid::unit(1, "lines"),
      legend.text      = ggplot2::element_text(size = 30),
      legend.title     = ggplot2::element_text(size = 30)
    ) +
    ggplot2::xlab(xlab) +
    ggplot2::ylab(if (is.null(ylab)) y else ylab) +
    ggplot2::guides(colour = ggplot2::guide_legend(title = if (is.null(col_lab)) colour else col_lab))
  
  ## save, if asked -----------------------------------------------------------
  if (!is.null(file)) ggplot2::ggsave(filename = file, plot = p, width = width, height = height)
  
  return(p)
}

# general plotter with mean path ± bootstrapped CI ribbon
plot_results_path <- function(data,
                              x,                 # string - column to plot on the x-axis
                              y,                 # string – column to plot on the y-axis
                              colour,            # string – column that defines colour / legend
                              ref_hline = NULL, # integer - defines a line for reference
                              facet = NULL,      # string (optional) – column for facet_grid
                              ci = 0.99,         # width of the normal-theory CI
                              xlab = "Input Size",
                              ylab = NULL,       # defaults to `y` if missing
                              col_lab = NULL,    # defaults to `colour` if missing
                              facet_lab = NULL,  # defaults to `facet` if missing
                              ribbon_alpha = 0.20, # transparency for CI ribbon
                              file = NULL,       # file name to save (NULL → don’t save)
                              width = 16,
                              height = 8) {
  
  ## convert strings → symbols for tidy-eval
  xsym   <- rlang::sym(x)
  ysym   <- rlang::sym(y)
  csym   <- rlang::sym(colour)
  facet_sym <- if (!is.null(facet)) rlang::sym(facet) else NULL
  
  ## core plot ---------------------------------------------------------------
  p <- ggplot2::ggplot(
    data,
    ggplot2::aes(x = !!xsym,
                 y = !!ysym,
                 colour = factor(!!csym, levels = c("SL","LT","LTT","LTTO","MSO","CF","CS")),
                 group  = factor(!!csym, levels = c("SL","LT","LTT","LTTO","MSO","CF","CS")))   # group so the path connects by colour
  ) +
    # 1) CI ribbon (drawn first, so the path/points stay on top)
    ggplot2::stat_summary(
      fun.data = ggplot2::mean_cl_boot,
      fun.args = list(conf.int = ci),
      geom     = "ribbon",
      ggplot2::aes(fill = factor(!!csym, levels = c("SL","LT","LTT","LTTO","MSO","CF","CS"))),   # separate fill aesthetic → legend matches colour
      alpha    = ribbon_alpha,
      linewidth = 0,                 # no outline on ribbon
      # position = ggplot2::position_dodge(width = 0.9),
      show.legend = FALSE            # hide ribbon legend; keeps plot cleaner
    ) +
    # 2) line that traces the means
    ggplot2::stat_summary(
      fun = mean,
      geom = "path",          # could also use "line"; "path" is explicit
      ggplot2::aes(#colour = factor(!!csym, levels = c("SL","LT","LTT","LTTO","MSO","CF","CS")),
        group = factor(!!csym, levels = c("SL","LT","LTT","LTTO","MSO","CF","CS"))),   # separate colour aesthetic → legend matches colour
      linewidth = 1
    ) +
    
    # Apply custom color palette
    ggplot2::scale_colour_manual(values = colour_palette)
  
  if (!is.null(ref_hline)) {
    p <- p + ggplot2::geom_hline(yintercept = ref_hline, 
                                 linetype='dashed', col = 'grey') +
      ggplot2::annotate("text", x = 12, y = ref_hline, label = "FFN", vjust = -0.5)
  }
  
  ## add facets, if requested
  if (!is.null(facet_sym)) {
    p <- p + ggplot2::facet_grid(cols = ggplot2::vars(!!facet_sym),
                                 labeller = if (!is.null(facet_lab))
                                   ggplot2::labeller(.cols = setNames(facet_lab, facet))
                                 else "label_value")
  }
  
  ## theme and labels --------------------------------------------------------
  p <- p +
    ggplot2::scale_x_continuous(breaks = c(1:12)) + 
    ggplot2::theme_minimal(base_size = 30) +
    ggplot2::theme(
      axis.text.x      = ggplot2::element_text(angle = 0, vjust = 0.5, hjust = 0.5),
      panel.grid.major = ggplot2::element_blank(),
      panel.grid.minor = ggplot2::element_blank(),
      panel.border     = ggplot2::element_rect(colour = "grey80", fill = NA, linewidth = 0.5),
      panel.spacing    = grid::unit(1, "lines"),
      legend.text      = ggplot2::element_text(size = 30),
      legend.title     = ggplot2::element_text(size = 30)
    ) +
    ggplot2::xlab(xlab) +
    ggplot2::ylab(if (is.null(ylab)) y else ylab) +
    ggplot2::guides(
      colour = ggplot2::guide_legend(title = if (is.null(col_lab)) colour else col_lab),
      fill   = "none"  # suppress separate fill legend (keeps only colour legend)
    )
  
  ## save, if asked ----------------------------------------------------------
  if (!is.null(file)) {
    ggplot2::ggsave(filename = file, plot = p, width = width, height = height)
  }
  
  return(p)
}

# Plotting for emmeans from regressions
plot_emm <- function(data,
                     x        = "Grammar Type",   # column mapped to the x-axis
                     y        = "Inverse Brier Score",
                     colour   = "Architecture",
                     ymin     = "lcl",            # lower-CI column
                     ymax     = "ucl",            # upper-CI column
                     facet    = NULL,             # optional facet column
                     x_levels = c("SL","LT","LTT","LTTO","MSO","CF","CS"),
                     xlab     = "Grammar Type",
                     ylab     = "Inverse Brier Score",
                     col_lab  = "Architecture",
                     facet_lab = NULL,
                     position_dodge_width = 0.6,
                     file     = NULL,
                     width    = 16,
                     height   = 8) {
  
  ## tidy-eval handles ---------------------------------------------------------
  xsym      <- rlang::sym(x)
  ysym      <- rlang::sym(y)
  csym      <- rlang::sym(colour)
  ymin_sym  <- rlang::sym(ymin)
  ymax_sym  <- rlang::sym(ymax)
  facet_sym <- if (!is.null(facet)) rlang::sym(facet) else NULL
  
  ## core plot -----------------------------------------------------------------
  p <- ggplot2::ggplot(
    data,
    ggplot2::aes(x = factor(!!xsym, levels = x_levels),
                 y = !!ysym,
                 colour = !!csym,
                 group = !!csym)) +
    
    # error bars: CI already in the data
    ggplot2::geom_errorbar(
      ggplot2::aes(ymin = !!ymin_sym, ymax = !!ymax_sym),
      position = ggplot2::position_dodge(width = position_dodge_width),
      width = 0.2,
      linewidth = 1) +
    
    # points: estimated marginal means
    ggplot2::geom_point(size = 6,
                        position = ggplot2::position_dodge(width = position_dodge_width)) +
    
    # dashed separators between grammar categories
    ggplot2::geom_vline(
      xintercept = seq(1.5, length(x_levels) - 0.5, by = 1),
      linetype = "dashed",
      colour   = "grey80",
      linewidth = 0.5,
      show.legend = FALSE) 
  
  n_levels <- length(unique(data[[colour]]))
  if (n_levels <= length(colour_palette)){
    p <- p + ggplot2::scale_colour_manual(values = colour_palette)
  }
  ## add facets, if requested
  if (!is.null(facet_sym)) {
    p <- p + ggplot2::facet_grid(cols = ggplot2::vars(!!facet_sym))
  }
  
  ## optional facet ------------------------------------------------------------
  if (!is.null(facet_sym)) {
    p <- p + ggplot2::facet_grid(cols = ggplot2::vars(!!facet_sym),
                                 labeller = if (is.null(facet_lab)) "label_value"
                                 else ggplot2::labeller(.cols = setNames(list(facet_lab),
                                                                         facet)))
  }
  
  ## theme, labels -------------------------------------------------------------
  p <- p +
    ggplot2::theme_minimal(base_size = 30) +
    ggplot2::theme(
      axis.text.x      = ggplot2::element_text(angle = 0, vjust = 0.5, hjust = 0.5),
      panel.grid.major = ggplot2::element_blank(),
      panel.grid.minor = ggplot2::element_blank(),
      panel.border     = ggplot2::element_rect(colour = "grey80", fill = NA,
                                               linewidth = 0.5),
      panel.spacing    = grid::unit(1, "lines"),
      legend.text      = ggplot2::element_text(size = 30),
      legend.title     = ggplot2::element_text(size = 30)
    ) +
    ggplot2::xlab(xlab) +
    ggplot2::ylab(ylab) +
    ggplot2::guides(colour = ggplot2::guide_legend(title = col_lab))
  
  ## save to file (optional) ---------------------------------------------------
  if (!is.null(file)) {
    ggplot2::ggsave(filename = file, plot = p, width = width, height = height)
  }
  
  return(p)
}

# Plotting for emmeans paths from regressions
plot_emm_path <- function(data,
                          x        = "inputsize",
                          y        = "Inverse Brier Score",
                          colour   = "grammartype",   # set to NULL for a single path
                          ymin     = "lcl",
                          ymax     = "ucl",
                          facet    = NULL,
                          col_levels = c("SL","LT","LTT","LTTO","MSO","CF","CS"),
                          xlab     = "Input Size",
                          ylab     = "Predicted Inverse\nBrier Score",
                          col_lab  = "Grammar Type",
                          x_breaks = 1:12,
                          facet_lab = NULL,
                          file     = NULL,
                          width    = 16,
                          height   = 8) {
  
  ## --------------------------------------------------------------------------
  xsym      <- rlang::sym(x)
  ysym      <- rlang::sym(y)
  ymin_sym  <- rlang::sym(ymin)
  ymax_sym  <- rlang::sym(ymax)
  facet_sym <- if (!is.null(facet)) rlang::sym(facet) else NULL
  has_colour <- !is.null(colour)
  
  if (has_colour) csym <- rlang::sym(colour)
  
  ## base mapping -------------------------------------------------------------
  base_mapping <- if (has_colour) {
    ggplot2::aes(
      x = !!xsym,
      y = !!ysym,
      colour = factor(!!csym, levels = col_levels),
      group  = factor(!!csym, levels = col_levels)
    )
  } else {
    ggplot2::aes(x = !!xsym, y = !!ysym)
  }
  
  p <- ggplot2::ggplot(data, base_mapping)
  
  ## ribbon -------------------------------------------------------------------
  if (has_colour) {
    p <- p +
      ggplot2::geom_ribbon(
        ggplot2::aes(ymin = !!ymin_sym,
                     ymax = !!ymax_sym,
                     fill = factor(!!csym, levels = col_levels)),
        linewidth = 0,
        show.legend = FALSE
      ) +
      
      # Apply custom color palette
      ggplot2::scale_colour_manual(values = colour_palette)
  } else {
    p <- p +
      ggplot2::geom_ribbon(
        ggplot2::aes(ymin = !!ymin_sym, ymax = !!ymax_sym),
        fill = "grey80",
        linewidth = 0
      )
  }
  
  ## path ---------------------------------------------------------------------
  if (has_colour) {
    p <- p + ggplot2::geom_path(linewidth = 1)        # << fixed here
  } else {
    p <- p + ggplot2::geom_path(linewidth = 1, colour = "black")
  }
  
  ## facet --------------------------------------------------------------------
  if (!is.null(facet_sym)) {
    p <- p +
      ggplot2::facet_grid(
        cols = ggplot2::vars(!!facet_sym),
        labeller = if (is.null(facet_lab)) "label_value"
        else ggplot2::labeller(.cols = setNames(list(facet_lab), facet))
      )
  }
  
  ## theme / labels -----------------------------------------------------------
  p <- p +
    ggplot2::scale_x_continuous(breaks = x_breaks) +
    ggplot2::theme_minimal(base_size = 30) +
    ggplot2::theme(
      axis.text.x      = ggplot2::element_text(angle = 0, vjust = 0.5, hjust = 0.5),
      panel.grid.major = ggplot2::element_blank(),
      panel.grid.minor = ggplot2::element_blank(),
      panel.border     = ggplot2::element_rect(colour = "grey80", fill = NA, linewidth = 0.5),
      panel.spacing    = grid::unit(1, "lines"),
      legend.text      = ggplot2::element_text(size = 30),
      legend.title     = ggplot2::element_text(size = 30)
    ) +
    ggplot2::xlab(xlab) +
    ggplot2::ylab(ylab)
  
  ## legend only if needed ----------------------------------------------------
  if (has_colour) {
    p <- p + ggplot2::guides(colour = ggplot2::guide_legend(title = col_lab))
  }
  
  ## optional save ------------------------------------------------------------
  if (!is.null(file)) {
    ggplot2::ggsave(file, plot = p, width = width, height = height)
  }
  
  p
}