############################################# Full pipeline for grammars ########################################################
# Author: M. Patel, K. Voudouris
# Project Title: AGLProj
# R Version: 4.2.2 (Innocent and Trusting)
# MySQL version: 8.0.31
#################################################################################################################################

library(dplyr)
library(ggplot2)
library(haven)
library(DBI)
library(RMySQL)


## DB Connection

database_connection <- read.csv("./code/mysqlDB/database_connection.csv")

dbName = database_connection$Value[1]
dbUsername = database_connection$Value[2]
dbPassword = database_connection$Value[3]
dbHostname = database_connection$Value[4]
dbPort = 3306

myDB <- dbConnect(MySQL(), user = dbUsername, password = dbPassword, dbname = dbName, host = dbHostname, port = dbPort)


## Query the database

query = "SELECT grammars.grammarID, models.modelID, grammars.connections, grammars.loops, grammars.entropy, strings.error, models.neurons, models.layers, trainedmodels.trainteststring, 
trainedmodels.pretrainpreds, 
trainedmodels.posttrainpreds FROM grammars 
JOIN strings ON grammars.grammarID = strings.grammarID 
JOIN trainedmodels ON strings.stringID = trainedmodels.stringID
JOIN models ON trainedmodels.modelID = models.modelID"

trainedData <- dbGetQuery(myDB, query)


clean_data <- trainedData %>% mutate(grammarID = haven::as_factor(grammarID),
                                     modelID = haven::as_factor(modelID),
                                     neurons = haven::as_factor(neurons),
                                     layers = haven::as_factor(layers),
                                     trainteststring = haven::as_factor(trainteststring),
                                     accuracy = ifelse(error == posttrainpreds, 1, 0)) %>%
                              group_by(modelID, grammarID) %>%
                              summarise(entropy = entropy,
                                        accuracy = sum(accuracy)/n(),
                                        neurons = neurons,
                                        layers = layers)


neuronsPlot <- clean_data %>% ggplot(aes(x = entropy, y = accuracy, colour = neurons), size = 3) +
geom_point() + stat_smooth()

neuronsPlot

layersPlot <- clean_data %>% ggplot(aes(x = entropy, y = accuracy, colour = layers)) + 
geom_point() + stat_smooth()

layersPlot