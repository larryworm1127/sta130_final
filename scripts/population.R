library(tidyverse)
library(dplyr)


# Wrangle data
population_internet_join <- internetusers_data %>%
  inner_join(population_data, by = "Country") %>%
  mutate(Percentage = `INTERNET USERS` / POPULATION) %>%
  select(Country, 'INTERNET USERS', POPULATION, Percentage) %>%
  mutate(Density = ifelse(Percentage < 1/3 , "low", ifelse(Percentage < 2/3 & Percentage > 1/3 , "medium", "high")))
population_internet_join[3, 1] = "US"
population_internet_join[10, 1] = "UK"


# Drawing plot
top_internetusers_plot <- ggplot(data = population_internet_join[0:10,], aes(x = `Country`, y = `INTERNET USERS`, fill = `POPULATION`)) +
  geom_bar(stat = "identity", position = position_dodge(0.8)) +
  labs(title = "Internet Users of Top 10 Countries", y = "Internet Users", x = "Country") +
  theme(plot.title = element_text(hjust = 0.5))

top_internetusers_density_plot <- ggplot(data = population_internet_join[0:10,], aes(x = `Country`, y = `Percentage`, fill = `POPULATION`)) +
  geom_bar(stat = "identity", position = position_dodge(0.8)) +
  labs(title = "% Internet Users of Top 10 Countries", y = "% Population", x = "Country") +
  theme(plot.title = element_text(hjust = 0.5))


# Cell phone users
celluser_internet_join <- internetusers_data %>%
  inner_join(cellphoneusers_data, by = "Country")

