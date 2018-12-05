library(tidyverse)
library(dplyr)


# Wrangle data
education_internet_join <- internetusers_data %>%
  inner_join(education_data, by = "Country") %>%
  select(Country, `INTERNET USERS`, `(% OF GDP)`)

education_internet_density_join <- population_internet_join %>%
  inner_join(education_data, by = "Country") %>%
  select(Country, POPULATION, `INTERNET USERS`, Percentage, Density, `(% OF GDP)`)


# Plot graphs
education_internet_graph <- ggplot(education_internet_join, aes(x = `(% OF GDP)`, y = `INTERNET USERS`)) +
  geom_point() +
  labs(title = "% of GDP on Education vs. Total Number of Internet Users", x = "% of GDP on Education", y = "Internet Users") +
  theme(plot.title = element_text(hjust = 0.5))

education_internet_density_graph <- ggplot(education_internet_density_join, aes(x = `(% OF GDP)`, y = `Percentage`)) +
  geom_point() +  geom_smooth(method = "lm") +
  labs(title = "% of GDP on Education vs. % Internet Users", x = "% of GDP on Education", y = "% Population") +
  theme(plot.title = element_text(hjust = 0.5))



