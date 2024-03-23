# Scraping country names from some website

library(rvest)
library(janitor)
library(tidyverse)


countries <- read_html("https://www.nationsonline.org/oneworld/countries_of_the_world.htm") %>%
  html_table() #returns a list

# read_html("https://www.nationsonline.org/oneworld/countries_of_the_world.htm") %>%
#   html_elements("table") %>% map_df(~html_table(.)) #works as well, returning a df
# 
# read_html("https://www.nationsonline.org/oneworld/countries_of_the_world.htm") %>%
#   html_elements("table") #total number of pages

countries_vector <- seq(length(countries)) %>%
  map_df(.x = ., .f = ~countries[[.x]]) %>% select(-X1)
  
#colnames(countries_vector) <- c("EnglishName", "FrenchName", "LocalName", "Region")

countries_vector <- countries_vector %>%
  rename_with(.cols = everything(),
              .fn = ~c("EnglishName", "FrenchName", "LocalName", "Region"))

countries_vector <- countries_vector %>%
  filter(!(str_count(EnglishName) <= 1 | EnglishName == ""))

countries_vector %>%
  group_by(Region) %>%
  summarise(Count = n()) %>%
  arrange(desc(Count), Region) %>% print(n = nrow(.))
