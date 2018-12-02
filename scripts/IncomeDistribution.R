library(tidyverse)
library(dplyr)
library(rpart)
library(partykit)

income_internet_join <- incomedistribution_data %>%
  inner_join(population_internet_join, by = "Country") 
  
income_regression <- income_internet_join %>%
  ggplot() + aes(x = `DISTRIBUTION OF FAMILY INCOME - GINI INDEX`, y = Percentage) +
  geom_point()