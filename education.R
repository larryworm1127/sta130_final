library(tidyverse)

path <- "https://raw.githubusercontent.com/ntaback/UofT_STA130/master/Fall2018/Finalproject/"
education_data <- read_csv(paste0(path, "education_cia2017.csv"))