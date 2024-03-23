# require(devtools)
# install_version("wdman", version = "0.2.5", repos = "http://cran.us.r-project.org")
# install.packages("port4me")


library(RSelenium)
library(wdman)
library(netstat)


selServ <- wdman::selenium(retcommand = TRUE, verbose = FALSE)


#binman::list_versions("chromedriver")
remote_driver <- rsDriver(browser = "chrome",
                          chromever = "latest", #"114.0.5735.91", #"latest",#"113.0.5672.24",
                          verbose = F,
                          port = free_port())


remDr <- remote_driver[["client"]]


remDr$navigate("https://hfrs.moh.go.tz")
remDr$refresh()

webElem <- remDr$findElement(using = 'css selector', ".list-group-item")
webElem$clickElement()

