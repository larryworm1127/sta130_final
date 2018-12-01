library(tidyverse)
library(dplyr)

democracy_internet_joint <- democracy_data %>% 
  filter(Rank != "Rank") %>%
  inner_join(internetusers_data, by = "Country") %>% 
  filter(`INTERNET USERS` < 200000000) %>%
  group_by(Category)

democracy_internet_joint_graph <- ggplot(democracy_internet_joint) + aes(x = Category, y = `INTERNET USERS`) +
  geom_boxplot()
