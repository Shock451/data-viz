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

# to import a csv
plastic_waste_dataset <- readr::read_csv("~/Documents/R/plastic-waste.csv")

# to view the content of the variable
view(plastic_waste_dataset)

# to get docs on a particular term
?NA

# create a histogram with the plastic_waste 
# dataset using the plastic_waste_per_cap column
ggplot(
  data = plastic_waste_dataset,
  mapping = aes(
    x = plastic_waste_per_cap
  )
) + 
  geom_histogram(
    binwidth = 0.2
  )

# filter out the outlier
odd_countries <- plastic_waste_dataset %>%
  filter(
    plastic_waste_per_cap >= 3.5
  )

# to get docs about filter
?filter

# create a histogram with the plastic_waste 
# dataset using the plastic_waste_per_cap column
# faceted by continent
ggplot(
  data = plastic_waste_dataset,
  mapping = aes(
    x = plastic_waste_per_cap
  )
) + 
  geom_histogram(
    binwidth = 0.2
  ) + 
  facet_wrap(~continent)

# create a density plot with the plastic_waste 
# dataset using the plastic_waste_per_cap column
# faceted by continent
ggplot(
  data = plastic_waste_dataset,
  mapping = aes(
    x = plastic_waste_per_cap,
    color = continent, # to map continent to color
    # to fill the curve area with colors based on continent
    fill = continent
  )
) + 
  geom_density(
    alpha = 0.5 # transparency levels of the colors/fill
  )

# create a box plot of continent vs plastic_waste_per_capita
# result clearly shows the outlier compared to the histogram 
# & the density plot
ggplot(
  data = plastic_waste_dataset,
  mapping = aes(
    x = continent,
    y = plastic_waste_per_cap,
  )
) + 
  geom_boxplot() + 
  facet_wrap(~continent)

# find the median value
plastic_waste_dataset %>%
  # to drop NA values in a specific column. Can work w/o args
  drop_na(plastic_waste_per_cap) %>% 
  group_by(continent) %>%
  summarize(
    Median = median(plastic_waste_per_cap), 
    na.rm = T
  )

# create a box plot of continent vs plastic_waste_per_capita
# result clearly shows the outlier compared to the histogram 
# & the density plot
ggplot(
  data = plastic_waste_dataset,
  mapping = aes(
    x = continent,
    y = plastic_waste_per_cap,
  )
) + 
  geom_violin() + 
  facet_wrap(~continent)
