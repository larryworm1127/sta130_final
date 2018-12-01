library(tidyverse)
library(dplyr)

democracy_internet_joint <- democracy_data %>%
  inner_join(internetusers_data, by = "Country") 
  



