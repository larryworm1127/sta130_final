library(tidyverse)
library(dplyr)

eu_countries <- c("Germany", "France", "Italy", "Spain", "United Kingdom", "Sweden", "Poland", "Belgium", "Croatia", "Romania", "Denmark", "Netherlands", "Bulgaria", "Greece", "Portugal", "Austria", "Hungary", "Finland", "Luxembourg", "Slovakia", "Slovenia", "Lithuania", "Latvia", "Estonia", "Cyprus", "Malta", "Czechia", "Ireland")
eu_population <- population_data %>% filter(`Country` %in% eu_countries) %>% select(`POPULATION`) %>% sum()

ggplot(data = population_data[0:10,], aes(x = `Country`, y = `POPULATION`)) +
  geom_bar(stat = "identity") + 
  labs(title = "Populations of Top 10 Countries", y = "Population", x = "Country") +
  theme(plot.title = element_text(hjust = 0.5)) 

ggplot(data = internetusers_data[0:10,], aes(x = `Country`, y = `INTERNET USERS`)) +
  geom_bar(stat = "identity") +
  labs(title = "Internet Users of Top 10 Countries", y = "Internet Users", x = "Country")

