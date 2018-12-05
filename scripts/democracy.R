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

dc_joint <- democracy_internet_joint

# Create classficiation tree
democracy_fit <- rpart(Density ~ Category + PoliticalParticipationLevel, democracy_internet_joint)
democracy_tree <- plot(as.party(democracy_fit), type = "simple", gp = gpar(cex = 0.8))

# Testing and Training Set
set.seed(364)
n <- nrow(democracy_internet_joint)

## random sample of 40% of row indexes
test_idx <- sample.int(n, size = round(0.4 * n))
## training data 
train <- dc_joint[-test_idx, ]
## testing data
test <- dc_joint[test_idx, ]

## predicting tree
tree <-rpart(Density ~ Category + PoliticalParticipationLevel, data = train,
             parms = list(split = "gini"))

## confusion matrix
predicted_tree <- predict(object = tree, newdata = test, type = "class")
confusion_matrix <- table(predicted_tree, test$Density)

accuracy <- 31/61

   