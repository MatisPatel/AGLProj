library(tidyverse)

dat <- read_csv("../data/change.csv")

dat <- filter(dat, id != 0)


mod =lm(change0 ~ TE, dat)

p <- ggplot(dat) + 
    geom_point(aes(log(TE), change0), alpha=0.5, colour="blue") +
    geom_point(aes(log(TE), change1), alpha=0.5, colour="orange") +
    geom_smooth(aes(log(TE), change0), method='lm', colour="blue") +
    geom_smooth(aes(log(TE), change1), method='lm', colour="orange") +
    xlab("Complexity") + 
    ylab("Change over training") +
    theme_bw()

ggsave("../graphs/change_3_graph.png", dpi=900)
