library(tidyverse)
library(dplyr)


# Wrangle data
region_internet_join <- internetusers_data %>%
  inner_join(world_regions, by = "Country") %>%
  inner_join(population_data, by = "Country")
region_internet_join[region_internet_join == "Asic & Pacific"] <- "Asia & Pacific"

internet_aggr_region_data <- aggregate(region_internet_join$`INTERNET USERS`, by = list(Category = region_internet_join$Region), FUN = sum)
population_aggr_region_data <- aggregate(region_internet_join$POPULATION, by = list(Category = region_internet_join$Region), FUN = sum)

internet_population_aggr_region_join <- inner_join(internet_aggr_region_data, population_aggr_region_data, by = "Category") %>%
  mutate(density = x.x / x.y)


# Plot graph
region_total_internetuser_graph <- ggplot(internet_aggr_region_data, aes(x = Category, y = x)) +
  geom_bar(stat = "identity") +
  labs(title = "Total Internet Users vs. Region in the World", x = "Regions", y = "# of Internet Users") +
  theme(plot.title = element_text(hjust = 0.5))

region_density_internetuser_graph <- ggplot(internet_population_aggr_region_join, aes(x = Category, y = density)) +
  geom_bar(stat = "identity") +
  labs(title = "Density of Internet Users vs. Region in the World", x = "Regions", y = "% of Internet Users out of Total Population") +
  theme(plot.title = element_text(hjust = 0.5))


