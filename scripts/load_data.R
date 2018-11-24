library(tidyverse)

path <- "https://raw.githubusercontent.com/ntaback/UofT_STA130/master/Fall2018/Finalproject/"

internetusers_data <- read_csv(paste0(path,"internetusers_cia2017.csv"))
gdp_data <- read_csv(paste0(path,"gdpppp_cia2017.csv"))
population_data <- read_csv(paste0(path, "population_cia2017.csv"))
education_data <- read_csv(paste0(path, "education_cia2017.csv"))