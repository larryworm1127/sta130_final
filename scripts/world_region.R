library(tidyverse)
library(dplyr)


# Wrangle data
region_internet_join <- internetusers_data %>%
  inner_join(world_regions, by = "Country")
region_internet_join[region_internet_join == "Asic & Pacific"] <- "Asia & Pacific"

aggregated_region_data <- aggregate(region_internet_join$`INTERNET USERS`, by = list(Category = region_internet_join$Region), FUN = sum)


# Plot graph
region_graph <- ggplot(aggregated_region_data, aes(x = Category, y = x)) +
  geom_bar(stat = "identity") +
  labs(title = "Internet Users vs. Region in the World", x = "Regions", y = "# of Internet Users") +
  theme(plot.title = element_text(hjust = 0.5)) 
