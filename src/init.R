# Initialise R scripts
# Run this script to install all the packages used in this project

packages <- c("here", "box", "haven", # utilities
              "tidyverse", "dplyr", "ggplot2", "ggdist", "ggthemes", # tidyverse/plots
              "brms", "tidybayes", # data analysis
              "DBI", "RMariaDB") # database statistics
install.packages(setdiff(packages, rownames(installed.packages())), 
                 repos='http://cran.us.r-project.org')
