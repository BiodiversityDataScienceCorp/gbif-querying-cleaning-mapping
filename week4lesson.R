#Querying, cleaning, and mapping gbif data
#2/7/23



#spocc: interface to SPecies OCCurrence data sources

#Install packages and load libraries:

install.packages("spocc")
install.packages("tidyverse") #includes ggplot
library(spocc)
library(tidyverse)


#Commenting: it's good


#Functions are built-in commands that often take "arguments",
# or variables/data you pass to the function.


#Occurrence Data: what is it?


# We can directly query occurrence data in R with the "occ" function, which is part of the spocc package.
# Take a look at the documentation here:
# https://www.rdocumentation.org/packages/spocc/versions/0.1.0/topics/occ

# gbifopts: run occ_options('gbif') in console to see possibilities()


#In groups: write a query for Rana draytonii from GBIF. 
#Any country. Any time period. Limit 5000.



# Drill down to get the data using "$", and show from Env window


### Let's initially plot the data on a map.



# say we want to add country lines




# 5 minute break!


#cleaning data: what do we need to do based on the reading for today? duplicates, remove nas, geographical outilers
### separate into parts 


## geograpical outliers 

## duplicates

# plotting the clean data

# set x and y limits



# re-do map code with cleaned data and x/y limits





