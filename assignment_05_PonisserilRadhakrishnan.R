# Assignment: ASSIGNMENT 5
# Name: Ponisseril, Radhakrishnan
# Date: 2021-07-08

install.packages("dplyr")
library(dplyr)
library(readxl)
library(lubridate)
library(tidyr)
library(purrr)

housing_df <- read_excel("data/week-7-housing.xlsx")
structure(housing_df)

## Select Operation
select(housing_df, 'Sale Date', year_built, prop_type, present_use, square_feet_total_living,
       sq_ft_lot)

## Filter Operation
housing_df %>% select ('Sale Date', 'Sale Price', postalctyn, prop_type, year_built) %>% filter(year_built >=2015)

## Mutate Operation
housing_df %>% select (year_built, sq_ft_lot, square_feet_total_living) %>% mutate(Rem_sq_ft = (sq_ft_lot - square_feet_total_living))

## Summarize operation
summarize(housing_df, mean(`Sale Price`))

## Group By operation
housing_df %>% group_by(year_built) %>% summarize(AvgPrice = mean(`Sale Price`))

## Arrange By operation
housing_df %>% group_by(year_built) %>% summarize(AvgPrice = mean(`Sale Price`)) %>% arrange(AvgPrice)

## purr - keep and compact

rep(20, 20) %>%
  map(sample, 10) %>%
  keep(function(x) mean(x) > 12)

list(str = "hello", null_obj = NULL, c = integer(0), d = c('abc', 'def', 'ghi'), e = list()) %>%
  compact()

## rbind Usage
year_2010 <- housing_df[housing_df$year_built == "2010", ]
other_years <- housing_df[housing_df$year_built != "2010", ]
merged_data <- rbind(year_2010,other_years)

## cbind Usage

sale_year <- year(housing_df$'Sale Date')
merged_year_date <- cbind(housing_df, sale_year)
select(merged_year_date, sale_year, 'Sale Date', postalctyn, prop_type, year_built)

## Split String and Concatenate the results back

s <- "I am new to R Programming and it is lot of Fun"
s1 <- strsplit(s, split = " ")
s1
s2 <- paste(unlist(s1), collapse = " ")
s2
