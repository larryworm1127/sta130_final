library(tidyverse)
library(dplyr)
library(rpart)
library(partykit)


# Wrangle data
democracy_internet_joint <- democracy_data %>% 
  filter(Rank != "Rank") %>%
  inner_join(population_internet_join, by = "Country") %>% 
  mutate(PoliticalParticipation = as.numeric_version(Politicalparticipation)) %>%
  mutate(PoliticalParticipationLevel = ifelse(PoliticalParticipation < 10/3, "passive", ifelse(PoliticalParticipation >= 10/3 & PoliticalParticipation < 20/3, "neutral", "active"))) %>%
  filter(`INTERNET USERS` < 200000000)
 

# Create classficiation tree
democracy_fit <- rpart(Density ~ Category + PoliticalParticipationLevel, democracy_internet_joint)
democracy_tree <- plot(as.party(democracy_fit), type = "simple", gp = gpar(cex = 0.8))


# Plot graphs   
democracy_internet_joint_graph <- ggplot(democracy_internet_joint) + 
  aes(x = Category, y = `INTERNET USERS`) +
  geom_boxplot() +
  theme(plot.title = element_text(hjust = 0.5))
