# Assignment: ASSIGNMENT 4.2.1
# Name: Ponisseril, Radhakrishnan
# Date: 2021-07-04

## Load the ggplot2 package
install.packages("ggplot2")
library(ggplot2)

## Set the working directory to the root of your DSC 520 directory
setwd("/Users/RajeevP/dsc520")

## Load the scores data set
scores_df <- read.csv("data/scores.csv")
scores_df

#1.1 What are the observational units in this study?
### Scores of Students in Sports and Regular Section

#1.2 Identify the variables mentioned in the narrative paragraph and determine which are categorical and quantitative?
### Course grades – Categorical
### Total points – Quantitative

#1.3 Create one variable to hold a subset of your data set that contains only the Regular Section and one variable for the Sports Section.

# Variable to hold subset of data that contains Regular Section
sports_df <- subset(scores_df, scores_df$Section=="Sports")

# Variable to hold subset of data that contains Regular Section
reg_df <- subset(scores_df, scores_df$Section=="Regular")

#1.4 Use the Plot function to plot each Sections scores and the number of students achieving that score. Use additional Plot Arguments to label the graph and give each axis an appropriate label. Once you have produced your Plots answer the following questions:

#1.4.1 Comparing and contrasting the point distributions between the two sections, looking at both tendency and consistency: Can you say that one section tended to score more points than the other? Justify and explain your answer.
# Regular Section tends to score more points than Sports section because mean 
# of regular section (~328) is higher than mean of sports section (~307)

# Plotting Sports and Regular Sections using ggplot function
ggplot(sports_df, aes(x=Score, y=Count))+ labs(x="Sports Score", y="Number of Students")+ geom_line ()
ggplot(reg_df, aes(x=Score, y=Count))+ labs(x="Regular Score", y="Number of Students")+ geom_line ()
mean(reg_df$Score)
median(reg_df$Score)
mean(sports_df$Score)
median(sports_df$Score)

#1.4.2 Did every student in one section score more points than every student in the other section? If not, explain what a statistical tendency means in this context.
# No it just means a representation of the entire distribution of the course

# 1.4.3 What could be one additional variable that was not mentioned in the narrative that could be influencing the point distributions between the two sections?
# gender
