
#spocc: interface to SPecies OCCurrence data sources

install.packages("spocc")
install.packages("tidyverse") #includes ggplot
install.packages("ggspatial")
library(spocc)
library(tidyverse)
library(ggspatial)

#Plan for class:

#Introduce/review functions, using occ as an example.

#Share occ documentation page
#https://www.rdocumentation.org/packages/spocc/versions/0.1.0/topics/occ
#gbifopts: run occ_options('gbif') in console 

#In groups: write a query for Rana draytonii in the United States
# https://www.rdocumentation.org/packages/spocc/versions/0.1.0/topics/occ
#from="gbif"
#limit=""










#might be good:
# https://paleolimbot.github.io/ggspatial/articles/ggspatial.html#data-frames-with-coordinates

#Bobcat: Lynx rufus
#Beaver: Castor canadensis

#Ochotona princeps 0?
# Antilocapra Ord
#Rana draytonii - has points in Africa - could be good!







query <- occ(query='Rana draytonii', from='gbif', limit=10000)



rana<-query$gbif$data$Rana_draytonii


ggplot(rana, aes(longitude, latitude)) +
  annotation_map_tile(type = "osm") +
  geom_spatial_point() 
 # geom_spatial_label_repel(aes(label = city), box.padding = 1) +
  #coord_sf(crs = 3995)
