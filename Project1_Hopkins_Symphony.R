#############################################
#                                           #
# Author:     Symphony Hopkins              #
# Date:       03/18/2023                    #
# Subject:    Project 1                     #
# Class:      DSCI 512                      #
# Section:    01W                           #         
# Instructor: Juan David Munoz              #
# File Name:  Project1_Hopkins_Symphony.R   #
#                                           #
#############################################

#1.1. Read the dataset in Boston.csv Download Boston.csv into R. 
#   Call the loaded data Boston. 
Boston <- read.csv("~/Documents/Maryville_University/DSCI_512/Week_1/Bostonnew.csv")

#1.2. Make sure that you have the directory set to the correct location for the data.
setwd("~/Documents/Maryville_University/DSCI_512/Week_1/")

#2.1. How many rows are in the data frame? 
#     Answer: 506
nrow(Boston)

#2.2. How many columns? 
#     Answer: 13
ncol(Boston)

#2.3. What do the rows and columns represent?
#     Answer:Each row represents a suburb in Boston, and
#            each column represents a characteristic for
#            each suburb (e.g., crim, zn, indus).

#3.1. Select the 1st, 100th, and 500th rows with columns tax and medv.
#     Answer:
#               tax medv
#           1   296 24.0
#           100 276 33.2
#           500 391 17.5
Boston[c(1,100,500),c("tax", "medv")]

#4.1. Look at the data using cor function. 
#     Answer: See screenshot in Word Document.
cor(Boston)

#4.2. Are any of the predictors associated with per capita crime rate? 
#     Answer: rad and tax-- However, this may change depending on one's 
#     boundaries for weak, moderate, and strong correlations.

#4.3. If so, explain the relationship based on correlation coefficients.
#     Answer: rad and tax have correlations of ~0.63 and ~0.58, respectively; 
#     however, these values, at best, suggest the relationship between the 
#     variables (crim and rad; crim and tax) is positive and moderate.

#5.1. Make some pairwise scatterplots of the predictors, crim, rad, tax, indus, and lstat in this data set. 
#     Answer:See screenshot in Word Document.
pairs(~crim +rad +tax +indus +lstat, data = Boston)

#5.2. Describe your findings.
#     Answer: Initially, we thought the relationship between crim and rad, and
#     crim and tax, was positively and moderately correlated; after looking
#     at the scatter plots, we can see that these relationships do not exist
#     because the data is not linear. In fact, none of the plots suggest a 
#     linear, correlational relationship between the predictors provided.

#6.1. Do any of the suburbs of Boston appear to have particularly high crime rates 
#     by looking at the histogram of crim? 
#     Answer: Yes; however, the histogram is right-skewed, so most suburbs in Boston
#     have low crime rates. Only a very small few have high crime rates.
hist(Boston$crim)

#6.2. What is the range of crim by using range() function in R?
#     Answer:The crime rates in Boston range from 0.00632 to 88.97620.
range(Boston$crim)

#7.1. How many of the suburbs in this dataset bound the Charles River?
#     Answer: 35
length(which(Boston$chas==1))

#8.1. What is the median pupil-teach ratio among the towns in this dataset? 
#     Answer: 19.05
median(Boston$ptratio)

#8.2. What’s the mean?
#     Answer: 18.45553
mean(Boston$ptratio)

#9.1. In this dataset, how many of the suburbs average more than seven rooms per dwelling?
#     Answer: 64
length(which(Boston$rm>7))

#9.2. More than eight rooms per dwelling? 
#     Answer: 13
length(which(Boston$rm>8))

#9.3. Comment on the suburbs that average more than eight rooms per dwelling.
#     Answer: There are 13 suburbs that average more than eight rooms per
#     dwelling which is significantly less than the previous number we found.
#     These suburbs may be high-end areas; however, we would have
#     to look at other characteristics before we can determine that.

#10.1. Convert chas to a factor.
#      Answer: See code.
Boston$chas <- factor(Boston$chas)
levels(Boston$chas)

#10.2. Boxplot the medv against chas. 
#      Answer: See screenshot in Word Document.
boxplot(medv~chas, data=Boston, main='Medv Against Chas',xlab='Tract Bounds Charles River',
        ylab='Median Value of Owner-Occupied Homes in $1000s')

#10.3. Are houses around the Charles River more expensive?
#      Answer: Yes, as we can see from the box plots, the range
#      for houses that bound the Charles River (=1) is higher
#      than houses that do not (=0).

#End Assignment