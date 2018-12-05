library(tidyverse)
library(dplyr)
library(rpart)
library(partykit)

# Wrangle data
income_internet_join <- incomedistribution_data %>%
  rename(`Gini Index` = `DISTRIBUTION OF FAMILY INCOME - GINI INDEX`) %>%
  inner_join(population_internet_join, by = "Country") %>%
  filter(`Gini Index` > 20) %>%
  select(Country, `Gini Index`, `INTERNET USERS`, POPULATION, Percentage, Density)

income_internet_join[3, 1] <- "Micronesia"

# Plot data
income_regression <- ggplot(income_internet_join, aes(x = `Gini Index`, y = Percentage)) +
  geom_point() + geom_smooth(method = "lm") +
  labs(title = "Family Income (Gini Index) vs. % Internet Users", x = "Gini Index", y = "% Population") +
  theme(plot.title = element_text(hjust = 0.5))


# Plot regression model
mod_income <- lm(Percentage ~ `Gini Index`, 
                 data = income_internet_join)
mod_summary <- summary(mod_income)

