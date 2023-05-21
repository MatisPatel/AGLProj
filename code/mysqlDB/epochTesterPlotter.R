#### Epoch testing


library(tidyverse)
library(haven)
library(plotly)

## Get model list

library(DBI)
library(RMariaDB)


## DB Connection

database_connection <- read.csv("./code/mysqlDB/database_connection.csv")

dbName = database_connection$Value[1]
dbUsername = database_connection$Value[2]
dbPassword = database_connection$Value[3]
dbHostname = database_connection$Value[4]
dbPort = 3306

myDB <- dbConnect(MariaDB(), user = dbUsername, password = dbPassword, dbname = dbName, host = dbHostname, port = dbPort)

query = "SELECT modelID, neurons, layers FROM models;"

models <- dbGetQuery(myDB, query)

dbDisconnect(myDB)

models <- transmute(models, 
                    modelID = haven::as_factor(modelID),
                    modelName = paste0("Neurons: ", neurons, " + Layers: ", layers),
                    modelName = haven::as_factor(modelName))

# get epoch test CSV


epoch_tests <- read.csv("./data/epochtesting.csv")


epoch_tests_clean_mean <- epoch_tests %>% pivot_longer(cols = starts_with("x"), names_to = "epoch", values_to = "loss") %>%
transmute(model = haven::as_factor(modelID),
epoch = str_remove_all(epoch, "x"),
epoch = as.numeric(epoch),
loss = loss) %>% group_by(model, epoch) %>% summarise(loss = mean(loss)) %>% left_join(., models, by = c("model" = "modelID"))

mean_plot <- ggplot(data = epoch_tests_clean_mean, aes(x = epoch, y = loss, color = modelName)) + geom_line()

epoch_tests_clean_mean <- epoch_tests %>% pivot_longer(cols = starts_with("x"), names_to = "epoch", values_to = "loss") %>%
  transmute(model = haven::as_factor(modelID),
            epoch = str_remove_all(epoch, "x"),
            epoch = as.numeric(epoch),
            loss = loss) %>% group_by(model, epoch) %>% summarise(loss = median(loss))

median_plot <- ggplot(data = epoch_tests_clean, aes(x = epoch, y = loss, color = model)) + geom_line()


