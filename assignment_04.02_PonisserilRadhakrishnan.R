# Assignment: ASSIGNMENT 4.2.2
# Name: Ponisseril, Radhakrishnan
# Date: 2021-07-04

## Load the tidyverse package
install.packages("tidyverse")
library(readxl)
library(lubridate)

## Set the working directory to the root of your DSC 520 directory
setwd("/Users/RajeevP/dsc520")

## Load the housing dataset
housing_df <- read_excel("data/week-7-housing.xlsx")
housing_df
# Use the apply function on a variable in your dataset
data <- matrix(housing_df$building_grade)
apply(data,1,mean)

# Use the aggregate function on a variable in your dataset
aggregate(building_grade ~ year_built, housing_df, mean)

#3 Use the plyr function on a variable in your dataset. 
#   split some data, perform a modification to the data, 
#   and then bring it back together

year_2010 <- housing_df[housing_df$year_built == "2010", ]
year_2010$sale_warning[is.na(year_2003$sale_warning)] <- "Not Available"
other_years <- housing_df[housing_df$year_built != "2010", ]
merged_data <- rbind(year_2010,other_years)

#4 Check distributions of the data
ggplot(data=merged_data, aes(x=year_built)) +
  geom_histogram()

#5 Identify if there are any outliers
### There are outliers in year 1900

#6 Create at least 2 new variables
merged_data$SaleYear <- year(merged_data$`Sale Date`)
merged_data$SaleMonth<- month(merged_data$`Sale Date`)
merged_data

