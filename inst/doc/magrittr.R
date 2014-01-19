
## ----, echo = FALSE, message = FALSE-------------------------------------
library(magrittr)
options(scipen = 3)
knitr::opts_chunk$set(
  comment = NA,
  error   = FALSE,
  tidy    = FALSE)


## ------------------------------------------------------------------------
library(magrittr)

weekly <-
  airquality %>% 
  transform(Date = paste(1973, Month, Day, sep = "-") %>% as.Date) %>% 
  aggregate(. ~ Date %>% format("%W"), ., mean)

weekly %>% head(3)


## ------------------------------------------------------------------------
weekly <- aggregate(. ~ format(Date, "%W"), transform(airquality, 
  Date = as.Date(paste(1973, Month, Day, sep = "-"))), mean)

head(weekly, 3)


## ------------------------------------------------------------------------
windy.weeks <-
  airquality %>% 
  transform(Date = paste(1973, Month, Day, sep = "-") %>% as.Date) %>% 
  aggregate(. ~ Date %>% format("%W"), ., mean) %>%
  subset(Wind > 12, c(Ozone, Solar.R, Wind)) %>% 
  print



## ------------------------------------------------------------------------
windy.weeks %>%
function(x) rbind(x %>% head(1), x %>% tail(1))


## ------------------------------------------------------------------------
rnorm(1000)    %>%
multiply_by(5) %>%
add(5)         %>%
function(x) 
  cat("Mean:",     x %>% mean, 
      "Variance:", x %>% var,  "\n")



## ----, results = 'hide'--------------------------------------------------
rnorm(100) %>% `*`(5) %>% `+`(5) %>% 
function(x) cat("Mean:", x %>% mean, "Variance:", x %>% var,  "\n")


