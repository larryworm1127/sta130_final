library(tidyverse)
library(dplyr)


# Wrangle data
lifeexpect_internet_join <- population_internet_join %>%
  inner_join(lifeexpect_data, by = "Country") %>%
  select(Country, POPULATION, `INTERNET USERS`, Percentage, Density, `(YEARS)`) %>%
  filter(Percentage < 1.0)


# Plot graphs
lifeexpect_internet_graph <- ggplot(lifeexpect_internet_join, aes(x = `(YEARS)`, y = `INTERNET USERS`)) +
  geom_point() +
  labs(title = "Life Expectancy vs. Total Number of Internet Users", x = "Life Expectancy (Years)", y = "Internet Users") +
  theme(plot.title = element_text(hjust = 0.5))

lifeexpect_internet_density_graph <- ggplot(lifeexpect_internet_join, aes(x = `(YEARS)`, y = `Percentage`)) +
  geom_point() + geom_smooth(method = "lm") +
  labs(title = "Life Expectancy vs. % Internet Users", x = "Life Expectancy (Years)", y = "% Population") +
  theme(plot.title = element_text(hjust = 0.5))


# Plot regression model
lifeexpect_internet_model <- lm(Percentage ~ `(YEARS)`, data = lifeexpect_internet_join)
