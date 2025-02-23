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


#################################################################################################################################
# 1. Plotting and Analysis

post_training_data <- read.csv(here::here("./analysis/data/post_training_data.csv"))

post_training_data_summarised <- post_training_data |>
  group_by(kgrams, grammartype, neurons, layers, laminations, recurrence) |>
  summarise(`Brier Score` = sum(root_squared_error)/n()) %>%
  mutate(recurrence = ifelse(recurrence == 0, "FFN", "RNN"),
         laminations = ifelse(laminations == 1, "Dense", "Laminated"),
         grammartype = ifelse(grammartype == "reg", "Regular",
                              ifelse(grammartype == "cfg_rep", "Context-Free\n(Repeated)",
                                     ifelse(grammartype == "cfg_mirr", "Context-Free\n(Mirrored)",
                                            "Context-Sensitive")))) %>%
  filter(layers > 1)
  

(plots <- ggplot2::ggplot(data = post_training_data_summarised) +
  geom_boxplot(aes(x = factor(grammartype, level = c("Regular", 
                                                    "Context-Free\n(Repeated)", 
                                                    "Context-Free\n(Mirrored)", 
                                                    "Context-Sensitive")), 
                  y = `Brier Score`, 
                  fill = factor(layers, level = c(1, 2, 3, 4, 5)))) +
  facet_grid(recurrence ~ laminations) + theme_minimal() + 
    theme(text=element_text(size=20), 
          axis.text=element_text(size=20), 
          axis.title=element_text(size=20), 
          plot.title=element_text(size=20), 
          legend.text=element_text(size=20), 
          legend.title=element_text(size=20),
          axis.text.x = element_text(angle = 90, vjust = 0.5, hjust=1)) +
    xlab("Grammar Type") + guides(fill=guide_legend(title="Num Layers")))
