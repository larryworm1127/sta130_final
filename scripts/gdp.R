library(tidyverse)
library(dplyr)

unwanted_char <- c("$", ",")

# Helper function to convert money represented in character data type to numeric
get_num_from_char <- function(data_vector) {
  result <- c()
  for (item in data_vector) {
    item_split <- strsplit(item, "")[[1]]
    sanitized_item <- paste(item_split [! item_split %in% unwanted_char], collapse = '')
    result <- c(result, as.numeric(sanitized_item))
  }
  
  return(result)
}

# Sanitize and wrangle data
internetusers_gdp_joint <- inner_join (x = internetusers_data, y = gdpppp_data,by="Country") %>% 
  filter(`INTERNET USERS` < 200000000) %>%
  mutate(GDP = get_num_from_char(`GDP - PER CAPITA (PPP)`)) %>%
  mutate(gdp_cat = ifelse(GDP > 40000, "5", 
                          ifelse(GDP <= 40000 & GDP > 21000, "4",
                                 ifelse(GDP <= 21000 & GDP > 11500, "3", 
                                        ifelse(GDP <= 11500 & GDP > 3700, "2", "1")))))

# Create data plots
internetusers_gdp_joint_graph <- ggplot(internetusers_gdp_joint) + 
  aes(x = gdp_cat, y =`INTERNET USERS`) + 
  geom_boxplot()  
  
