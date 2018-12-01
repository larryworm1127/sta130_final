library(tidyverse)
library(dplyr)

democracy_data %>% 
  filter(Rank != "Rank") %>%
  ggplot() + aes(x = Category, y = Score) +
  geom_boxplot()
