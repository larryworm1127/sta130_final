library(tidyverse)

path <- "https://raw.githubusercontent.com/ntaback/UofT_STA130/master/Fall2018/Finalproject/"
population_data <- read_csv(paste0(path, "population_cia2017.csv"))

eu_countries <- c("Germany", "France", "Italy", "Spain", "United Kingdom", "Sweden", "Poland", "Belgium", "Croatia", "Romania", "Denmark", "Netherlands", "Bulgaria", "Greece", "Portugal", "Austria", "Hungary", "Finland", "Luxembourg", "Slovakia", "Slovenia", "Lithuania", "Latvia", "Estonia", "Cyprus", "Malta", "Czechia", "Ireland")
eu_population <- population_data %>% filter(`Country` %in% eu_countries) %>% select(`POPULATION`) %>% sum()
