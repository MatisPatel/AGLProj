# Initialise R scripts
# Run this script to install all the packages used in this project

# sudo apt-get update 
# sudo apt-get install -y libcurl4-openssl-dev libmariadb-dev

packages <- c("here", "box", "haven", "future", # utilities
              "yaml", "glue", "broom", # additional utilities
              "tidyverse", "tidyr", "dplyr", "ggplot2", "ggdist", "ggthemes", "kableExtra", "Hmisc", "purrr", "furrr", # tidyverse/plots
              "betareg", "statmod", "lmtest", "ModelMetrics", "emmeans", # data analysis # betareg must be version >= 3.2.2
              "DBI", "RMariaDB") # database statistics
install.packages(setdiff(packages, rownames(installed.packages())), 
                 repos='http://cran.us.r-project.org')
