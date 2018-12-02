library(tidyverse)
library(dplyr)
library(rpart)
library(partykit)

democracy_internet_joint <- democracy_data %>% 
  filter(Rank != "Rank") %>%
  inner_join(internetusers_data, by = "Country") %>% 
  inner_join(population_data, by = "Country") %>% 
  mutate(PoliticalParticipation = as.numeric_version(Politicalparticipation)) %>%
  mutate(Percentage = `INTERNET USERS` / POPULATION) %>%
  mutate(Density = ifelse(Percentage < 1/3 , "low", 
                   ifelse(Percentage >= 1/3 & Percentage < 2/3, "medium", "high"))) %>%
  mutate(PoliticalParticipationLevel = ifelse(PoliticalParticipation < 10/3, "passive", ifelse(PoliticalParticipation >= 10/3 & PoliticalParticipation < 20/3, "neutral", "active"))) %>%
  filter(`INTERNET USERS` < 200000000)
 
democracy_fit <- rpart(Density ~ Category + PoliticalParticipationLevel, democracy_internet_joint)
democracy_tree <- plot(as.party(democracy_fit), type = "simple", gp = gpar(cex = 0.8))
   
democracy_internet_joint_graph <- ggplot(democracy_internet_joint) + 
  aes(x = Category, y = `INTERNET USERS`) +
  geom_boxplot()
