
library(tidyverse)
library(furrr)

number_generator <- function(){

numbers <- sample(1:100000, size = 3)

if(all(numbers %% 2 == 0) & all(numbers %% 3 == 0) & all(str_count(numbers) == 5)){
  
  return(numbers)
  
    }else{
  
  number_generator()
  
  }

}

set.seed(1000)

plan(multisession(workers = length(availableWorkers())))

tictoc::tic()
future_map_dfc(1:100, ~number_generator()) %>%
  rename_with(.cols = everything(),
              .fn = ~gsub(x = ., pattern = "...", replacement = paste0("iter_")))

tictoc::toc()


tictoc::tic()
map_dfc(1:100, ~number_generator()) %>%
  rename_with(.cols = everything(),
              .fn = ~gsub(x = ., pattern = "...", replacement = paste0("iter_")))

tictoc::toc()


