library(RSelenium)
library(rvest)
library(wdman)
library(netstat)
library(tidyverse)


selServ <- wdman::selenium(retcommand = TRUE, verbose = FALSE)

{# Using chrome
# binman::list_versions("chromedriver")

# remote_driver <- rsDriver(browser = "chrome", #chrome
#                           chromever = "116.0.5845.14", #"latest", #"116.0.5845.141"
#                           verbose = F,
#                           port = free_port())

# Using phantomjs
# remote_driver <- rsDriver(browser = "phantomjs",
#                           phantomver = "latest",
#                           verbose = F,
#                           port = free_port())
  }

# Using Firefox
# remote_driver <- rsDriver(browser="firefox", port=free_port(),#4555L,
# verbose=F, chromever = NULL)

remote_driver <- rsDriver(browser = "chrome", #chrome
                           chromever = "116.0.5845.14", #"latest", #"116.0.5845.141"
                           verbose = F,
                           port = 4556L#free_port(), #4555L
                           )

remDr <- remote_driver[["client"]]


remDr$navigate("https://hfrs.moh.go.tz")
remDr$refresh()

webElem <- remDr$findElement(using = 'link text', "Health Facilities")
webElem$clickElement()
search_box <- remDr$findElement(using = 'xpath',
  '//*[@id="advance_id"]/div/div[2]/div[1]/div[2]/div/div/input')

search_box$clickElement()
search_box$sendKeysToElement(list('Aga Khan', key = 'enter'))

search_button <- remDr$findElement(using = 'xpath',
  '//*[@id="homeSearch"]')
search_button$clickElement()




remDr$closeWindow()
system('taskkill /im java.exe /f')
