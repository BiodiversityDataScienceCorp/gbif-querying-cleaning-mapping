
#spocc: interface to SPecies OCCurrence data sources

#Install packages and load libraries:

install.packages("spocc")
install.packages("tidyverse") #includes ggplot
library(spocc)
library(tidyverse)


#Plan for class:

# tips for success- commenting! 
#Introduce/review functions, using occ as an example.

#Functions are built-in commands that often take "arguments",
# or variables/data you pass to the function.

# Here "sqrt" is the function, and "10" is the argument.
sqrt(10)

#What are some other R functions you've used?

# You can learn more about functions and arguments by Googling them!

# What is occurrence data?
# (have any of you used iNat?)
# (a single piece of data is an observation of a species
# at a given time and place, and verified by experts)\
# Can also include observations at museums, naturalist journals
# from the past. (Katy/Greta: chime in!)


# We can get occurrence data sets by using the function "occ",
# from the spocc package. talk about package specifically and in general. 

# We'll get our data from gbif for the California Red Legged Frong

# Take a look at the documentation here:
# https://www.rdocumentation.org/packages/spocc/versions/0.1.0/topics/occ
#In groups: write a query for Rana draytonii from GBIF. 
#Any country. Any time period. Limit 5000.

#gbifopts: run occ_options('gbif') in console to see possibilities()
#(come back in 5 min, have a group demo?)

query <- occ(query='Rana draytonii', from = "gbif", limit = 5000)

# Drill down to get the data using "$", and show from Env window

rana<-query$gbif$data$Rana_draytonii


### Let's initially plot the data on a map. Go line by line and show how it looks different
ggplot() +
  geom_point(data = rana, aes(x=longitude, y=latitude), show.legend=FALSE) +
  labs(title="Species occurrences of R. draytonii", x="longitude", y="latitude")

# say we want to add country lines
wrld<-ggplot2::map_data("world")

ggplot() +
  geom_polygon(data = wrld, mapping=aes(x=long, y=lat,group = group), fill = "grey75", colour = "grey60") +
  geom_point(data = rana, aes(x=longitude, y=latitude), show.legend=FALSE) +
  labs(title="Species occurrences of R. draytonii", x="longitude", y="latitude")


# break after plotting


# what is wrong with this map.... CALIFORNIA red legged frog. Endemic to N. America....

#cleaning data: what do we need to do based on the reading for today? duplicates, remove nas, geographical outilers
### separate into parts 
cleanRana <- rana %>% 
  filter(continent == "NORTH_AMERICA", latitude != "NA", longitude != "NA") %>% 
  mutate(location = paste(latitude,longitude, dateIdentified, sep = "/")) %>%  # add date if half your points are gone
  distinct(location, .keep_all= TRUE) # could do this step wise to show how each one works

sum(is.na(rana$latitude))


## geograpical outliers 

## duplicates

# plotting the clean data

# set x and y limits
xmax <- max(cleanRana$longitude)
xmin <- min(cleanRana$longitude)
ymax <- max(cleanRana$latitude)
ymin <- min(cleanRana$latitude)

ggplot() +
  geom_polygon(data = wrld, mapping=aes(x=long, y=lat,group = group), fill = "grey75", colour = "grey60") +
  geom_point(data = cleanRana, aes(x=longitude, y=latitude), show.legend=FALSE) +
  scale_size_area() +
  coord_fixed(xlim = c(xmin, xmax), ylim = c(ymin, ymax)) +
  borders("state") +
  labs(title="Species occurrences of R. draytonii", x="longitude", y="latitude")





#might be good:
# https://paleolimbot.github.io/ggspatial/articles/ggspatial.html#data-frames-with-coordinates
