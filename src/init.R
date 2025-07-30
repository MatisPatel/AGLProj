# Initialise R scripts
# Run this script to install all the packages used in this project

packages <- c("here", "box", "haven", "future", # utilities
              "tidyverse", "tidyr", "dplyr", "ggplot2", "ggdist", "ggthemes", "Hmisc", "purrr", "furrrr", # tidyverse/plots
              "betareg", "statmod", "lmtest", "ModelMetrics", # data analysis # betareg must be version >= 3.2.2
              "DBI", "RMariaDB") # database statistics
install.packages(setdiff(packages, rownames(installed.packages())), 
                 repos='http://cran.us.r-project.org')
