tictoc::tic()

#1. Packages
library(rvest)
library(tidyverse)
library(janitor)
library(glue)
library(DBI)
library(here)
library(janitor)
library(ggtext)

##1.1 Scraping
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
  html_attr(name = "href") %>% str_extract(., pattern = "results\\\\s\\d{4}\\.htm") %>% na.omit()

links_attachments <- links_attachments %>% str_replace(string = .,
                                                       pattern = "\\\\",
                                                       replacement = "\\/")

#2. Function for scraping
iter_link <- "https://matokeo.necta.go.tz/csee2022/"

scrapper <- function(school){
  
  school_link <- paste0(iter_link, school)
  
  
  # Table - for subjects table
  tables <- school_link %>% read_html() %>% html_elements("table")
  
  # All students results
  results <- tables[[3]] %>% html_table() %>% row_to_names(row_number = 1)
  
  # Table - for region
  region <- tables[[5]] %>% html_elements("td") %>% html_text() %>% nth(., 2)
  
  # GPA
  gpa <- tables[[5]] %>% html_elements("tr") %>% html_text(trim = TRUE) %>% nth(., 2) %>%
    gsub(x = ., pattern = "\\w+.*\\\r\\\n(.+))", replacement = "\\1") %>%
    gsub(x = ., pattern = "\\(", replacement = "")
  
  
  # Adding school link and region
  results$region <- region
  results$`SCHOOL'S OVERALL GPA` <- gpa
  
  return(results)
  
  Sys.sleep(runif(1, min = 2, max = 5))
  
}


#3 Iteration - using purrr's map_df
results <- map_df(.x = links_attachments, .f = ~scrapper(.x))

#4 Post scraping data cleaning
results <- results %>% mutate(number = str_extract(CNO, pattern = "S\\d{4}"),
                              .before = CNO) %>%
  relocate(region, `SCHOOL'S OVERALL GPA`, .before = CNO)

results <- results %>% inner_join(all_schools) %>% relocate(name, .after = number) %>%
  rename(`SCHOOL'S NUMBER` = number, `SCHOOL'S NAME` = name)


results1 <- results %>% mutate(`SCHOOL'S GPA` = str_replace(string = `SCHOOL'S OVERALL GPA`,
                                                pattern = "(\\d)\\s.*",
                                                replacement = "\\1"),
                   
                   `SCHOOL'S GRADE` = str_replace(string = `SCHOOL'S OVERALL GPA`,
                                                   pattern = ".*\\s(GRADE\\s\\w{1})\\s.*",
                                                   replacement = "\\1"),
                   
                   
                   `SCHOOL'S RATING` = str_replace(string = `SCHOOL'S OVERALL GPA`,
                                                   pattern = ".*\\sGRADE\\s\\w{1}\\s(.*)",
                                                   replacement = "\\1")) %>%
  
  relocate(`SCHOOL'S GPA`, `SCHOOL'S GRADE`, `SCHOOL'S RATING`, .after = region) %>%
  select(-`SCHOOL'S OVERALL GPA`)
  

colnames(results1) <- str_to_upper(colnames(results1))

results1 <- results1 %>% mutate(across(c(`SCHOOL'S GPA`, "AGGT"), as.numeric))
results1 <- results1 %>% mutate(DIV = factor(DIV, levels = c("I", "II", "III", "IV", "0", "ABS")))

tictoc::toc()

# Saving the output of scraping #Doesn't work well - requires fixing. Should listing happen outside,
#before?
## Saving results to .xlsx file #Requires more revisions
walk2(.x = "results", .y = "results1",
     .f = ~openxlsx::write.xlsx(x = list(.x = get(.x),
                                         .y = get(.y)),
                                here("./Output/3. All Candidates' Results/NECTA 2022 CSEE Results.xlsx")))


walk2(.x = "results", .y = "results1",
      .f = ~writexl::write_xlsx(x = list(.x = get(.x),
                                          .y = get(.y)),
                                 here("./Output/3. All Candidates' Results/NECTA 2022 CSEE Results.xlsx")))

### Reading from .xlsx file
# results <- readxl::read_excel(here("./Output/3. All Candidates' Results/NECTA 2022 CSEE Results - Penultimate.xlsx"))
# results1 <- readxl::read_excel(here("./Output/3. All Candidates' Results/NECTA 2022 CSEE Results - Final.xlsx"))

#5 Saving results to .db file
mydb <- dbConnect(RSQLite::SQLite(),
                  here("./Output/3. All Candidates' Results/NECTA 2022 CSEE Results.db"))

walk(.x = c("results", "results1"), .f = ~dbWriteTable(conn = mydb,
                                                   name = .x,
                                                   value = get(.x)))

dbDisconnect(mydb)

#6 Data Analysis
##6.1 Querying the data from RSQlite .db file

mydb <- dbConnect(RSQLite::SQLite(),
                  here("./Output/3. All Candidates' Results/NECTA 2022 CSEE Results.db"))

query_results_sex <- dbGetQuery(mydb,
'SELECT REPLACE(REPLACE(SEX, "M", "MALE"), "F", "FEMALE") AS SEX, DIV, FREQUENCY , PERC_OF_TOTAL_FOR_SEX
FROM
(SELECT div_count.SEX, DIV, FREQUENCY, ROUND((CAST(FREQUENCY AS REAL)/ COUNT_SEX) * 100, 2) AS PERC_OF_TOTAL_FOR_SEX
FROM
(SELECT SEX, DIV, COUNT(DIV) AS FREQUENCY
FROM results1 r2
WHERE DIV != "ABS"
GROUP BY SEX, DIV) div_count
INNER JOIN
(SELECT SEX, COUNT(SEX) AS COUNT_SEX FROM results1 r
WHERE DIV != "ABS"
GROUP BY SEX) all_count
ON div_count.SEX = all_count.SEX)
ORDER BY DIV, PERC_OF_TOTAL_FOR_SEX DESC, SEX;'
)

#dbSendQuery() followed by dbFetch() also work if the database file is large

query_results_sex <- query_results_sex %>% mutate(DIV = factor(DIV, levels = c("I", "II", "III", "IV", "0")),
                                          SEX = ifelse(SEX == "MALE", "Male", "Female"),
                                          PERC_OF_TOTAL_FOR_SEX = round_half_up(PERC_OF_TOTAL_FOR_SEX,
                                                                                1))


##6.2 Drawing of visualization
ggplot(data = query_results_sex %>% mutate(FREQUENCY = format(FREQUENCY, big.mark = ",",
                                                              trim = TRUE)),
       aes(x = SEX, y = PERC_OF_TOTAL_FOR_SEX)) +
  geom_col(aes(fill = SEX)) +
  facet_wrap(~DIV, nrow = 1) +
  scale_y_continuous(breaks = scales::breaks_pretty()) +
  scale_fill_manual(values = c(Female = "orange", Male = "#00b159")) +
  theme(legend.position = "bottom",
        panel.background = element_rect(fill = "gray98"),
        axis.line = element_line(),
        plot.title.position = "plot",
        plot.title = element_text(hjust = 0.5),
        plot.subtitle = element_markdown(hjust = 0.5)) +
  
  guides(fill = guide_legend(title = "Sex: ")) +
  geom_text(mapping = aes(x = SEX, y = PERC_OF_TOTAL_FOR_SEX,
                          label = glue_safe("{PERC_OF_TOTAL_FOR_SEX}%\n({FREQUENCY})")),
            size = 3.1, hjust = 0.5, vjust = 1) +
  
  labs(x = "\nSex", y = "Percentage of Total for Sex (%)\n",
       title = "A barplot of proportion of divisions for each sex",
       subtitle = "*Proportions were calculated for each sex prior to the categorization by 
       division*")



ggsave(here("./Output/Proportion of divisions by sex.png"), scale = 2)

dbDisconnect(mydb)
## Misc
#walk(.x = 1:5, ~print(runif(1, min = 2, max = 5)))
#map(.x = 1:5, ~runif(1, min = 2, max = 5))