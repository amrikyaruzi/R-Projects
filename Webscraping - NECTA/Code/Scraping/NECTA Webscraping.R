tictoc::tic()

library(tidyverse)
library(rvest)
library(glue)



website_link <- "https://matokeo.necta.go.tz/csee2022/index.htm"

all_schools <- website_link %>% read_html(.) %>% html_table()
all_schools <- all_schools[[3]]

all_schools <- c(all_schools$X1, all_schools$X2, all_schools$X3) %>% as_tibble()

all_schools <- all_schools %>% mutate(number = str_replace_all(string = value,
                                                               pattern = "([SP]\\d{4})\\s(.*)",
                                                               replacement = "\\1"),
                                      name = str_replace_all(string = value,
                                                             pattern = "([SP]\\d{4})\\s(.*)",
                                                             replacement = "\\2"))

all_schools <- all_schools %>% select(-value) %>% filter(name != "")



links_attachments <- website_link %>% read_html(.) %>% html_elements("a") %>%
  html_attr(name = "href") %>% str_extract(., pattern = "results\\\\s\\d{4}\\.htm") %>%
  as_vector() %>% na.omit()

links_attachments <- links_attachments %>% str_replace(string = .,
                                                       pattern = "\\\\",
                                                       replacement = "\\/")


## For loop
iter_link <- "https://matokeo.necta.go.tz/csee2022/"

# The loop

# results <- data.frame()
# 
# for(school in links_attachments){ #tail(links_attachments,-3219)
# 
#   school_link <- paste0(iter_link, school)
# 
#   # Tables
#   tables <- school_link %>% read_html() %>% html_elements("table")
#   
#   # Table - for subjects table
#   subjects_table <- tables[[9]] %>% html_table()
#   colnames(subjects_table) <- c("CODE", "SUBJECT NAME", "REG", "SAT", "NO-CA", "W/HD", "CLEAN", "PASS", "GPA", "COMPETENCY LEVEL")
# 
#   # Table - for region
#   region <- tables[[5]] %>% html_elements("td") %>% html_text() %>% .[2]
#   
#   # GPA
#   gpa <- tables[[5]] %>% html_elements("tr") %>% html_text(trim = TRUE) %>% .[2] %>%
#     gsub(x = ., pattern = "\\w+.*\\\r\\\n(.+))", replacement = "\\1") %>%
#     gsub(x = ., pattern = "\\(", replacement = "")
# 
#   # Pivoting wider
#   subjects_table_wider <- subjects_table %>% select(`SUBJECT NAME`, GPA) %>%
#     pivot_wider(names_from = `SUBJECT NAME`, values_from = GPA)
#   
#   # Adding school link and region
#   subjects_table_wider$number <- school_link
#   subjects_table_wider$region <- region
#   subjects_table_wider$`OVERALL GPA` <- gpa
# 
#   subjects_table_wider <- subjects_table_wider %>% relocate(number, region, .before = everything())
#   subjects_table_wider <- subjects_table_wider %>% mutate(across(.cols = everything(),
#                                                                  .fns = as.character))
# 
#   results <- bind_rows(results, subjects_table_wider)
# 
#   Sys.sleep(runif(1, min = 1, max = 5))
# 
# }

## Alternatively, we can do a purrr style map_df


scrape_school <- function(school){
  
  
  school_link <- paste0(iter_link, school)
  
  # Tables
  tables <- school_link %>% read_html() %>% html_elements("table")
  
  # Table - for subjects table
  subjects_table <- tables[[9]] %>% html_table()
  colnames(subjects_table) <- c("CODE", "SUBJECT NAME", "REG", "SAT", "NO-CA", "W/HD", "CLEAN", "PASS", "GPA", "COMPETENCY LEVEL")
  
  # Table - for region
  region <- tables[[5]] %>% html_elements("td") %>% html_text() %>% .[2]
  
  # GPA
  gpa <- tables[[5]] %>% html_elements("tr") %>% html_text(trim = TRUE) %>% .[2] %>%
    gsub(x = ., pattern = "\\w+.*\\\r\\\n(.+))", replacement = "\\1") %>%
    gsub(x = ., pattern = "\\(", replacement = "")
  
  # Pivoting wider
  subjects_table_wider <- subjects_table %>% select(`SUBJECT NAME`, GPA) %>%
    pivot_wider(names_from = `SUBJECT NAME`, values_from = GPA)
  
  # Adding school link and region
  subjects_table_wider$number <- school_link
  subjects_table_wider$region <- region
  subjects_table_wider$`OVERALL GPA` <- gpa
  
  subjects_table_wider <- subjects_table_wider %>% relocate(number, region, .before = everything())
  subjects_table_wider <- subjects_table_wider %>% mutate(across(.cols = everything(),
                                                                 .fns = as.character))
  
  return(subjects_table_wider)
  
  Sys.sleep(runif(1, min = 1, max = 5))
  
  
}


## Applying the function
results <- map_df(.x = links_attachments, .f = ~scrape_school(.))

# Post scraping cleanup
colnames(results) <- str_to_upper(colnames(results))

results <- results %>% mutate(NUMBER = str_replace_all(string = NUMBER,
                                                       pattern = ".*(s\\d{4})\\.htm",
                                                       replacement = "\\1"),
                              NUMBER = str_to_upper(NUMBER))

results <- results %>% inner_join(all_schools, by  = c("NUMBER" = "number")) %>%
  relocate(name, .after = NUMBER)

results <- results %>% mutate(`SCHOOL'S GPA` = str_replace(string = `OVERALL GPA`,
                                                pattern = "(\\d)\\s.*",
                                                replacement = "\\1"),
                   
                   `SCHOOL'S GRADE` = str_replace(string = `OVERALL GPA`,
                                                  pattern = ".*\\s(GRADE\\s\\w{1})\\s.*",
                                                  replacement = "\\1"),
                   
                   
                   `SCHOOL'S RATING` = str_replace(string = `OVERALL GPA`,
                                                   pattern = ".*\\sGRADE\\s\\w{1}\\s(.*)",
                                                   replacement = "\\1")) %>%
  
  relocate(`SCHOOL'S GPA`, `SCHOOL'S GRADE`, `SCHOOL'S RATING`, .after = REGION) %>%
  select(-`OVERALL GPA`)

results <- results %>% mutate(`OVERALL RANK` = min_rank(`SCHOOL'S GPA`), .before = NUMBER) %>%
  arrange(`OVERALL RANK`)

results <- results %>% rename(`OVERALL GPA` = `SCHOOL'S GPA`,
                              `OVERALL GRADE` = `SCHOOL'S GRADE`,
                              `OVERALL RATING` = `SCHOOL'S RATING`)
  
colnames(results) <- str_to_upper(colnames(results))
results <- results %>% mutate(across(c(`OVERALL GPA`, CIVICS:last_col()), as.numeric))

openxlsx::write.xlsx(results, here("./Output/1. Scraping Results/Final - NECTA 2022 Data.xlsx"))

tictoc::toc()
