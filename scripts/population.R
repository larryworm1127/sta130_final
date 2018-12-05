library(tidyverse)
library(dplyr)

eu_countries <- c("Germany", "France", "Italy", "Spain", "United Kingdom", "Sweden", 
                  "Poland", "Belgium", "Croatia", "Romania", "Denmark", "Netherlands", 
                  "Bulgaria", "Greece", "Portugal", "Austria", "Hungary", "Finland", 
                  "Luxembourg", "Slovakia", "Slovenia", "Lithuania", "Latvia", 
                  "Estonia", "Cyprus", "Malta", "Czechia", "Ireland")
eu_population <- population_data %>% 
  filter(`Country` %in% eu_countries) %>% 
  select(`POPULATION`) %>% sum()

# Wrangle data
population_internet_join <- internetusers_data %>%
  inner_join(population_data, by = "Country") %>%
  mutate(Percentage = `INTERNET USERS` / POPULATION) %>%
  select(Country, 'INTERNET USERS', POPULATION, Percentage) %>%
  mutate(Density = ifelse(Percentage < 1/3 , "low", ifelse(Percentage < 2/3 & Percentage > 1/3 , "medium", "high")))


# Drawing plot
top_internetusers_plot <- ggplot(data = population_internet_join[0:20,], aes(fill = `POPULATION`, x = `Country`, y = `INTERNET USERS`)) +
  geom_bar(stat = "identity", position = position_dodge(0.8)) +
  labs(title = "Internet Users of Top 10 Countries", y = "Internet Users", x = "Country") +
  theme(plot.title = element_text(hjust = 0.5))


# Cell phone users
celluser_internet_join <- internetusers_data %>%
  inner_join(cellphoneusers_data, by = "Country")

