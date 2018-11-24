library(tidyverse)

path <- "https://raw.githubusercontent.com/ntaback/UofT_STA130/master/Fall2018/Finalproject/"
gdp_data <- read_csv(paste0(path,"gdpppp_cia2017.csv"))