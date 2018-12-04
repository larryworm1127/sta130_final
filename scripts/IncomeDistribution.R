library(tidyverse)
library(dplyr)
library(rpart)
library(partykit)

# Wrangle data
income_internet_join <- incomedistribution_data %>%
  rename(`Gini Index` = `DISTRIBUTION OF FAMILY INCOME - GINI INDEX`) %>%
  inner_join(population_internet_join, by = "Country") %>%
  filter(`Gini Index` > 20)


# Plot data
income_regression <- income_internet_join %>%
  ggplot() + aes(x = `Gini Index`, y = Percentage) +
  geom_point() + geom_smooth(method = "lm")


# Plot regression model
mod_income <- lm(Percentage ~ `Gini Index`, 
                 data = income_internet_join)
mod_summary <- summary(mod_income)

