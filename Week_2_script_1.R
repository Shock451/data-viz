# Abdullahi Oladosu
# Data visualization: Week 2

# set working directory.
setwd("~/Documents/R")

# install packages to be used
install.packages("tidyverse")
install.packages("datasauRus")

# load packages
library(datasauRus)
library(tidyverse)
library(ggplot2)
library(magrittr)

# save the result of the vector 
# created by (c)oncatenating those values into popDens
popDens <- c(153, 464, 36, 151, 287)

# find the max of the vector(array) values
max(popDens)

# find the min of the vector values
min(popDens)

# find the sum of the vector values
sum(popDens)

# sort the vector, from smallest to largest value
sort(popDens)

# slicing a vector
popDens[3] # access by 3rd index
popDens[5] # access 5th element by index
popDens[1:4] # access first 4 elements element by index
popDens[-3] # select all elements except the 3rd
popDens[-1:-3] # select all elements except the 1st to 3rd

popDensMax <- max(popDens)

# if there's NA in a vector, it becomes 
# the result of max, min, and pretty much any function
# that compares the whole vector to produce an output
popDens <- c(153, 464, 36, 151, 287)
max(popDens) # NA

# to ignore NA, use na.rm = TRUE
max(popDens, na.rm = TRUE) # or T or FALSE or F

# single quotes or double quotes for strings
nations <- c('China', 'India', 'US', 'Indonesia', 'Pakistan')

# to bind two vectors together to form a table, use cbind
together <- cbind(nations, popDens)
# > class(together)
# [1] "matrix" "array"

# to create a data frame
together <- data.frame(nations, popDens)
# > class(together)
# [1] "data.frame"

# to assign names to the two columns
colnames(together) <- c('Country', 'Population Density')

# to extract a column vector from a Data frame, 
# use $, like dot notation
together$Country

# use class() to check the class of your object
together %>% class()

# use str to get info about the class of each column
str(together)

# find standard deviation of population density column
sd(together$`Population Density`) 

# find mean of population density column
mean(together$`Population Density`)

# In R, a list is a collection of vectors
# unlike data frames, the constituent vectors do not have
# to be of equal size

# round popDens, then sort it in desc order, and then print top 6
popDens %>% 
  round(digit = 2) %>%
  sort(decreasing = T) %>%
  head()

# find log
popDens %>% log()
