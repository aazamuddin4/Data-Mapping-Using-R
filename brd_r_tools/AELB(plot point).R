library(sp)
library(sf)
library(viridis)
library(RColorBrewer)
library(readxl)
library(gstat)
library(tidyverse)
library(mapview)
library(lwgeom)
library(classInt)
library(grid)
library(raster)
library(lubridate)
library(ggplot2)
library("ggmap")
library(leaflet)

data_1 <- read.csv("data/data_aelb1.csv")
data_1 <- dplyr::select(data_1, c(1,2,3))
colnames(data_1) <- c("lat", "lon", "dose")
data_1 <- mutate(data_1, source = "data_aelb1")

summary(data_1)

register_google(key="AIzaSyBTnAyGePvGO94QIVH4LZTRMVkrt2SFWxs")

map <- get_map(location = c(101.7543083, 2.8967), zoom = 18, maptype = "hybrid", legend = 'bottomleft')

ggmap(map, extent = "device") + 
  geom_point(aes(x = lon, y = lat, colour = dose), alpha = 1, size = 3, data = data_1) + 
  scale_colour_gradient(low = "green", high = "red", name = "doserate(μSv/hr)")