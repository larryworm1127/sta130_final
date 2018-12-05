library(tidyverse)
library(dplyr)


# Wrangle data
education_internet_join <- population_internet_join %>%
  inner_join(education_data, by = "Country") %>%
  select(Country, POPULATION, `INTERNET USERS`, Percentage, Density, `(% OF GDP)`)


# Plot graphs
education_internet_graph <- ggplot(education_internet_join, aes(x = `(% OF GDP)`, y = `INTERNET USERS`)) +
  geom_point() +
  labs(title = "% of GDP on Education vs. Total Number of Internet Users", x = "% of GDP on Education", y = "Internet Users") +
  theme(plot.title = element_text(hjust = 0.5))

education_internet_density_graph <- ggplot(education_internet_join, aes(x = `(% OF GDP)`, y = `Percentage`)) +
  geom_point() +  geom_smooth(method = "lm") +
  labs(title = "% of GDP on Education vs. % Internet Users", x = "% of GDP on Education", y = "% Population") +
  theme(plot.title = element_text(hjust = 0.5))

mike

library(tidyverse)
library(readr)
library(maps)
library(dplyr)
library(ggplot2)

get_num_from_char <- function(data_vector) {
  result <- c()
  for (item in data_vector) {
    item_split <- strsplit(item, "")[[1]]
    sanitized_item <- paste(item_split [! item_split %in% unwanted_char], collapse = '')
    result <- c(result, as.categorical(sanitized_item))
  }
  
  path <- "https://raw.githubusercontent.com/ntaback/UofT_STA130/master/Fall2018/Finalproject/"
  
  
  internetusers_data <- read_csv(paste0(path,"internetusers_cia2017.csv"))
  education_data <- read_csv(paste0(path, "education_cia2017.csv"))
  
  internetusers_edu_joint<-inner_join(x=internetusers_data , y = education_data , by= "Country"  ) %>%
    mutate (EDU = internetusers_edu_joint$`(% OF GDP)`) %>%
    mutate (edu_cat = ifelse(EDU > 10.5, "5",
                             ifelse(EDU <=10.5 & EDU > 8, "4",
                                    ifelse(EDU <= 8 & EDU > 5.5, "3",
                                           ifelse(EDU <= 5.5 & EDU > 3, "2","1" )))))
  
  internetusers_edu_joint_graph <- ggplot(internetusers_edu_joint) + 
    aes(x = edu_cat, y = internetusers_edu_joint$`INTERNET USERS`) +geom_boxplot()
  internetusers_edu_joint_graph
  
  internetusers_edu_joint
  
  //fit <-lm(INTERNET USERS ~ %OFGDP, data = education_data)
  y_test <- education_data_test$Country
  summary(lm(`INTERNET USERS`  ~ `(% OF GDP)` , data = internetusers_edu_joint))$coefficients
  summary(lm(`INTERNET USERS`  ~ `(% OF GDP)` , data = internetusers_edu_joint))$r.squared
  



