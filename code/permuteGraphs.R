library(tidyverse)

dat <- read_csv("../data/200epochs_permuteNeuronsAndLayers_10grammars_2classes_noLoops.csv")

dat <- dat %>% 
mutate(
    normScores = (scores - min(scores))/(max(scores) - min(scores)),
    newCost = layers*neurons,
    normCost = (newCost - min(newCost))/(max(newCost) - min(newCost)), 
    layers=as.factor(layers))

p <- ggplot(dat) + 
 geom_path(aes(neurons,  normScores, colour = layers)) + 
 geom_path(aes(neurons, change0, colour = layers))
p

p2 <- ggplot(dat) + 
 geom_path(aes(neurons,  change0, colour = layers))
p2

ggplot(dat) + 
geom_point(aes(normScores, change0, colour=layers))
