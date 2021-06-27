### Setting the working directory to where the data is stored
getwd()
setwd("/Users/RajeevP/dsc520/data")
getwd()

### Read the American Community Survey Data set
acs <- read.csv("acs-14-1yr-s0201.csv")

###1 Categories in the data set
names(acs)
###1 Elements in the data set 
head(acs)

###2 Structure
str(acs)
###2 Number of rows
nrow(acs)
###2 Number of Columns
ncol(acs)

### Load ggplot2 package
library(ggplot2)

###3 Histogram of HSDegree with bin size = 5 
x <- ggplot(data=acs, aes(x=HSDegree))
x + geom_histogram(binwidth = 5, fill="White", colour="Black") +
  
  xlab("High School Degree Percentage") +
  ylab("Count of Population Group") +
  ggtitle("High School Degree based on Population Group")

###4 Normal curve to the Histogram 
x + geom_histogram(binwidth = 5, fill="White", colour="Black", aes(y = ..density..)) +
  
  xlab("High School Degree Percentage") +
  ylab("Count of Population Group") +
  ggtitle("High School Degree based on Population Group") +
  stat_function(fun=dnorm, args=list(mean=mean(acs$HSDegree, na.rm=TRUE), sd=sd(acs$HSDegree, na.rm=TRUE)))
  

x + stat_function(fun=dnorm, args=list(mean=mean(acs$HSDegree, na.rm=TRUE), 
                                       sd=sd(acs$HSDegree, na.rm=TRUE)))


###5 Probability Plot
ggplot(acs) + geom_density( aes(x = HSDegree), fill="grey50")


###7 Stat.Desc
install.packages("pastecs")
library(pastecs)

stat.desc(acs, basic=TRUE, desc=TRUE, norm=FALSE, p=0.95)
