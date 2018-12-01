library(tidyverse)
library(dplyr)
library(rpart)
library(partykit)

income_internet_join <- incomedistribution_data %>%
  inner_join(population_internet_join, by = "Country") 

income_fit <- rpart(Density ~ `DISTRIBUTION OF FAMILY INCOME - GINI INDEX`, 
                    income_internet_join, control = rpart.control(cp = 0.02))

income_tree <- plot(as.party(income_fit), type = "simple", gp = gpar(cex = 0.8))
  