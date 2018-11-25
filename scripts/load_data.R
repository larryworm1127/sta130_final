library(tidyverse)
library(readr)
library(maps)


path <- "https://raw.githubusercontent.com/ntaback/UofT_STA130/master/Fall2018/Finalproject/"

democracy_data <- read.csv(paste0(path,"democracyindex2017.csv"))
internetusers_data <- read_csv(paste0(path,"internetusers_cia2017.csv"))
gdpppp_data <- read_csv(paste0(path,"gdpppp_cia2017.csv"))
population_data <- read_csv(paste0(path, "population_cia2017.csv"))
education_data <- read_csv(paste0(path, "education_cia2017.csv"))
healthexpend_data <- read_csv(paste0(path,"healthexpend_cia2017.csv"))
