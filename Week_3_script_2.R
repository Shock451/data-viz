# Oladosu Abdullahi
# Data Visualization Class -> GCU

# set working directory.
setwd("~/Documents/R")

install.packages('tidyverse')
install.packages('datasauRus')
install.packages('ggplot2')

library(tidyverse)
library(datasauRus)
library(ggplot)

ggplot(
  data = starwars, 
  mapping = aes(
    x = mass,
  )
) +
  geom_histogram()

head(starwars)
