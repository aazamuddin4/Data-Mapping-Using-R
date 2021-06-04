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

data_1 <- read.csv("data/wp_01.wpt", sep=",", skip=4)
data_1 <- dplyr::select(data_1, c(2,3,4))
colnames(data_1) <- c("dose", "lat", "lon")
data_1 <- mutate(data_1, source = "wp_01")

data_2 <- read.csv("data/wp_02.wpt", sep=",", skip=4)
data_2 <- dplyr::select(data_2, c(2,3,4))
colnames(data_2) <- c("dose", "lat", "lon")
data_2 <- mutate(data_2, source = "wp_02")

data <- rbind(data_1, data_2)

register_google(key="AIzaSyBTnAyGePvGO94QIVH4LZTRMVkrt2SFWxs")
  

#location is the average in the data

map <- get_map(location = c(16.50858772, 47.97499538), maptype = "hybrid", zoom = 16)

ggmap(map, extent = "device") + 
  stat_density2d(data = data_1, aes(x = lon, y = lat, fill = ..level.., alpha = ..level..), 
                 size = 0.01, bins = 16, geom = "polygon") + scale_fill_gradient(low = "blue", high = "red") +
  scale_alpha(range = c(0, 1.0), guide = FALSE) +
  guides(fill=FALSE)

ggmap(map, extent = "device") + 
  geom_density2d(data = data_1, aes(x = lon, y = lat), size = 2, colour = "red") + 
  scale_alpha(range = c(0, 0.3), guide = FALSE) +
  guides(fill=FALSE)

ggmap(map, extent = "device") + 
  geom_point(aes(x = lon, y = lat), colour = "red", alpha = 0.3, size = 2, data = data_1) + 
  geom_point(aes(x = lon, y = lat), colour = "green", alpha = 0.3, size = 2, data = data_2)