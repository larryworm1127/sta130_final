

library(tidyverse)
library(dplyr)


internetusers_gdp_joint<-inner_join (x=internetusers_data,y=gdpppp_data,by="Country") %>% 
  filter(`INTERNET USERS` < 200000000) %>%
  rename(GDP = `GDP - PER CAPITA (PPP)`)

internetusers_gdp_joint_graph <- ggplot(internetusers_gdp_joint) + aes(x =GDP , y =`INTERNET USERS` ) + geom_point()  

# TODO: fix GDP data so that it can be compared numerically
classfied_gdp_data <- internetusers_gdp_joint %>% 
  mutate(gdp_cat = ifelse(GDP > 110000, 8,
                ifelse(GDP <= 110000 & GDP > 80000, 7, 
                       ifelse(GDP <= 80000 & GDP > 50000, 6,
                              ifelse(GDP <= 50000 & GDP > 20000, 5,
                                     ifelse(GDP <= 20000 & GDP > 10000, 4, 
                                            ifelse(GDP <= 10000 & GDP > 5000, 3, 
                                                   ifelse(GDP <= 5000 & GDP > 2000, 2, 
                                                          ifelse(GDP <= 2000, 1, 0)))))))))








