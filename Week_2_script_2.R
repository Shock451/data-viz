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

# to import a csv
iris_dataset <- readr::read_csv("~/Downloads/iris.csv")

# yo check this out!
test_dataset <- "~/Downloads/iris.csv" %>% read_csv()

iris_dataset %>% class()

# to get a transposed version of print()
# you get to see all the column names in a column
glimpse(iris_dataset)

# extract the SepalLengthCm column
sepalLengthCm <- as.vector(iris_dataset$SepalLengthCm)

# select the 3rd observation
sepalLengthCm[3]

# select the first 3 observations
sepalLengthCm[1:3]

# all observations except the 2nd
sepalLengthCm[-2]

# it is possible to select a specific row and column. For example:
iris_dataset[2, 4]

# find max value in SepalLengthCm vector
sepalLengthCm %>% max()

# find min value in SepalLengthCm vector
sepalLengthCm %>% min()

# clone dataset
iris_dataset2 <- iris_dataset

# change column names in iris_dataset2
colnames(iris_dataset2) <- c('id', 'slcm', 'swcm', 'plcm', 'pwcm', 'spe')

# save this new dataset to fs
iris_dataset2 %>% 
  write.csv("./iris_dataset2_test.csv")

# get summary info such as mean, median, and minimum
summary(iris_dataset)

# calc the mean of SepalLengthCm for each of the 3 species
iris_dataset %>%
  group_by(Species) %>%
  summarize(mean = mean(SepalLengthCm))
  
# create a scatterplot of SepalLength vs SepalWidth
ggplot(
  data = iris_dataset, 
  mapping = aes(
    x = sepalLengthCm, 
    y = SepalWidthCm,
    color = Species
  )
) +
  geom_point()

# create a scatterplot for all three species at once
ggplot(
  data = iris_dataset, 
  mapping = aes(
    x = sepalLengthCm, 
    y = SepalWidthCm,
    color = Species
  )
) +
  geom_area() +
  facet_wrap(~Species)

# create a boxplot for all three species at once
ggplot(
  data = iris_dataset, 
  mapping = aes(
    x = sepalLengthCm, 
    y = SepalWidthCm,
    color = Species
  )
) +
  geom_boxplot()
