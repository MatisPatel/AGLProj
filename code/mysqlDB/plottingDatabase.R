############################################# Full pipeline for grammars ########################################################
# Author: M. Patel, K. Voudouris
# Project Title: AGLProj
# R Version: 4.2.2 (Innocent and Trusting)
# MySQL version: 8.0.31
#################################################################################################################################

library(dplyr)
library(ggplot2)
library(ggcorrplot)
library(haven)
library(DBI)
library(RMariaDB)
library(lme4)
library(glmmTMB)


## DB Connection

database_connection <- read.csv("./code/mysqlDB/database_connection.csv")

dbName = database_connection$Value[1]
dbUsername = database_connection$Value[2]
dbPassword = database_connection$Value[3]
dbHostname = database_connection$Value[4]
dbPort = 3306

myDB <- dbConnect(MariaDB(), user = dbUsername, password = dbPassword, dbname = dbName, host = dbHostname, port = dbPort)


## Query the database

query = "SELECT grammars.grammarID, models.modelID, grammars.connections, grammars.loops, grammars.topentropy, grammars.adjmatrixrealentropy, grammars.adjmatriximagentropy, grammars.adjmatrixmodentropy, grammars.indlaplacianrealentropy, grammars.indlaplacianimagentropy, grammars.indlaplacianmodentropy, grammars.slesslaplacianrealentropy, grammars.slesslaplacianimagentropy, grammars.slesslaplacianmodentropy, strings.error, models.neurons, models.layers, models.laminations, models.recurrentlayers, models.recurrentend, trainedmodels.trainteststring, 
trainedmodels.pretrainpreds, 
trainedmodels.posttrainpreds FROM grammars 
JOIN strings ON grammars.grammarID = strings.grammarID 
JOIN trainedmodels ON strings.stringID = trainedmodels.stringID
JOIN models ON trainedmodels.modelID = models.modelID WHERE strings.stringLength = 2;"

trainedData <- dbGetQuery(myDB, query)


clean_data <- trainedData %>% mutate(grammarID = haven::as_factor(grammarID),
                                     modelID = haven::as_factor(modelID),
                                     neurons = as.numeric(neurons),
                                     layers = as.numeric(layers),
                                     laminations = as.numeric(laminations),
                                     trainteststring = haven::as_factor(trainteststring),
                                     accuracy = ifelse(error == posttrainpreds, 1, 0)) %>%
                              filter(trainteststring == "Test") %>%
                              group_by(modelID, grammarID, neurons, layers, laminations, recurrentlayers, recurrentend, topentropy, adjmatrixrealentropy, adjmatrixmodentropy, indlaplacianrealentropy, indlaplacianmodentropy, slesslaplacianrealentropy, slesslaplacianmodentropy) %>%
                              summarise(accuracy = (sum(accuracy)/n()))


neuronsPlot <- clean_data %>% ggplot(aes(x = entropy, y = accuracy, colour = neurons), size = 3) +
  geom_point() + stat_smooth()

neuronsPlot

layersPlot <- clean_data %>% ggplot(aes(x = entropy, y = accuracy, colour = layers)) + 
  geom_point() + stat_smooth()

layersPlot

laminationsPlot <- clean_data %>% ggplot(aes(x = entropy, y = accuracy, colour = laminations)) + 
  geom_point() + stat_smooth()

laminationsPlot


##

(laminationsAccPlot <- clean_data %>% ggplot(aes(x = laminations, y = accuracy)) + 
  geom_jitter() + stat_smooth(method = "loess"))

ggsave("./results/plots/laminationPlotLoess.png")

(layersAccPlot <- clean_data %>% ggplot(aes(x = layers, y = accuracy)) + 
    geom_jitter() + stat_smooth(method = "loess"))

ggsave("./results/plots/layerPlotLoess.png")

(neuronsAccPlot <- clean_data %>% ggplot(aes(x = neurons, y = accuracy)) + 
    geom_jitter() + stat_smooth(method = "loess"))

ggsave("./results/plots/neuronPlotLoess.png")

(reclayersAccPlot <- clean_data %>% ggplot(aes(x = recurrentlayers, y = accuracy)) + 
    geom_jitter() + stat_smooth(method = "loess"))

ggsave("./results/plots/recurrentLayersPlotLoess.png")

## Do some beta regressions

#fit_beta <- glmmTMB(accuracy ~ neurons + laminations*layers + recurrentlayers + recurrentend + topentropy + (1|grammarID) + (1|modelID), family = beta_family(), data = clean_data)
fit_beta <- glmmTMB(accuracy ~ neurons + laminations + layers + recurrentlayers + topentropy + (1|grammarID) + (1|modelID), family = beta_family(), data = clean_data)

sink("./results/regressions/beta_regression_preliminary.txt")

cat("Beta regression on the aggregate performance of ", length(unique(clean_data$modelID)), " networks on ", length(unique(clean_data$grammarID)), " different grammars.\n")
summary(fit_beta)

sink()

## correlations

grammarquery <- "SELECT connections, loops, topentropy, adjmatrixrealentropy, adjmatrixmodentropy, indlaplacianrealentropy, indlaplacianmodentropy, slesslaplacianrealentropy, slesslaplacianmodentropy FROM grammars"

grammars <- dbGetQuery(myDB, grammarquery)

grammars.cor <- cor(grammars, method = c("spearman"))

(ggcorrplot(grammars.cor, hc.order = TRUE, type = "lower",
           outline.col = "white",lab = TRUE))

ggsave("./results/plots/entropyCorrelations.png")


## Bigram Beta Regression

library(zoib)

clean_data_bigrams <- clean_data %>%
  mutate(accuracy = ifelse(accuracy == 1, 0.9999, ifelse(accuracy == 0, 0.0001, accuracy)))

fit_beta <- glmmTMB(accuracy ~ neurons + laminations*recurrentlayers + layers + topentropy + (1|grammarID) + (1|modelID), family = beta_family(), data = clean_data_bigrams)

sink("./results/regressions/beta_regression_bigrams.txt")

cat("Beta regression on the aggregate performance of ", length(unique(clean_data_bigrams$modelID)), " networks on ", length(unique(clean_data_bigrams$grammarID)), " different grammars.\n")
summary(fit_beta)

sink()

(laminationsAccPlot <- clean_data %>% ggplot(aes(x = laminations, y = accuracy)) + 
    geom_jitter() + stat_smooth(method = "glm"))

ggsave("./results/plots/laminationPlotBigramGLM.png")

(layersAccPlot <- clean_data %>% ggplot(aes(x = layers, y = accuracy)) + 
    geom_jitter() + stat_smooth(method = "glm"))

ggsave("./results/plots/layerPlotBigramGLM.png")

(neuronsAccPlot <- clean_data %>% ggplot(aes(x = neurons, y = accuracy)) + 
    geom_jitter() + stat_smooth(method = "glm"))

ggsave("./results/plots/neuronPlotBigramGLM.png")

(reclayersAccPlot <- clean_data %>% ggplot(aes(x = recurrentlayers, y = accuracy)) + 
    geom_jitter() + stat_smooth(method = "glm"))

ggsave("./results/plots/recurrentLayersPlotBigramGLM.png")

## zero-or-one inflated beta regression

#fit_beta <- zoib(accuracy ~ neurons + laminations*recurrentlayers + layers + topentropy + (1|grammarID) + (1|modelID), data = clean_data_bigrams, zero.inflation = TRUE, one.inflation = FALSE, n.iter = 5000, n.thin )
