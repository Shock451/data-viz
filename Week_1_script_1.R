# Abdullahi Oladosu
# Data visualization: Week 1

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

# to show more info about a dataset
?datasaurus_dozen

# find out the number of rows
nrow(datasaurus_dozen)

# find out the number of columns
ncol(datasaurus_dozen)

# create a freq. table of the dataset variable
datasaurus_dozen %>%
  count(dataset) %>% # create frequency table
  print(13) # print result to the screen

# to view the first 6 rows of the dataset
head(datasaurus_dozen)

# to filter out only one dataset and store it in a new 
# variable called dino_data
dino_data <- datasaurus_dozen %>%
  filter(dataset == "dino") # filter by dataset column

# view first 6 rows of dino dataset data
head(dino_data) 

# to define aesthetic mappings, for example the x axis
# represents the variable called x and the y axis 
# represents the variable called y, we use: aes
ggplot(data = dino_data, mapping = aes(x = x, y = y)) +
  geom_point()

# to find the correlation between the x and y columns
# of the data
dino_correlation <- dino_data %>%
  summarize(r = cor(x, y))

# to filter out only the dataset 'star' and store it in a new 
# variable called star_data
star_data <- datasaurus_dozen %>%
  filter(dataset == "star") # filter by dataset column

star_correlation <- star_data %>%
  summarize(r = cor(x, y))

ggplot(data = star_data, mapping = aes(x = y, y = x)) +
  geom_point()

# to filter out only the dataset 'bullseye' and store it in a new 
# variable called bullseye_data
bullseye_data <- datasaurus_dozen %>%
  filter(dataset == "bullseye") # filter by dataset column

bullseye_correlation <- bullseye_data %>%
  summarize(r = cor(x, y))

ggplot(data = bullseye_data, mapping = aes(x = y, y = x)) +
  geom_point()

# to plot all datasets at once, we must use faceting
ggplot(
  datasaurus_dozen, 
  mapping = aes(
    x = x, 
    y = y, 
    color = dataset
    )
  ) + 
  geom_point() + # for point based graph
  facet_wrap(~dataset, ncol = 3) + # ncol can be any number
  theme(
    legend.position = "top", # can be none, bottom, left or right
  ) + 
  labs(
    title = "The Whole DatasauRus", # the title of the plot
    x = "horizontal", # add horizontal axis label
    y = "vertical" # add vertical axis label
  )


# with classic theme
ggplot(
  datasaurus_dozen, 
  mapping = aes(
    x = x, 
    y = y, 
    color = dataset
  )
) + 
  geom_point() + # for point based graph
  facet_wrap(~dataset, ncol = 3) + # ncol can be any number
  theme_classic() + 
  labs(
    title = "The Whole DatasauRus", # the title of the plot
    x = "horizontal", # add horizontal axis label
    y = "vertical" # add vertical axis label
  )

# calculate group coefficients for all the datasets
correlations_all <- datasaurus_dozen %>%
  group_by(data = dataset) %>%
  summarize(r = cor(x, y))

dim(mpg) # inspect the mpg dataset
?mpg # find details about a dataset
head(mpg) # display first few (6) rows of mpg dataset

# create a scatterplot of car's engine size 
# vs car's fuel efficiency
ggplot(
  data = mpg,
  mapping = aes(
    x = displ, 
    y = hwy,
    color = class, # you can map class by color
    size = class, # you can also map the size of each point by class
    shape = class # again, you can map shape by class
  )
) +
  geom_point() +
  labs(
    title = "Car Fuel Efficiency by Engine Size",
    x = "Engine Size (litres)",
    y = "Fuel Efficiency"
  )

### it is not advisable to use size for a discrete variable.