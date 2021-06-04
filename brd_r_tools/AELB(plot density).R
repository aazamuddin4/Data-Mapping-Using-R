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

data_1 <- read.csv("data/data_aelb1.csv")
data_1 <- dplyr::select(data_1, c(1,2,3,4))
colnames(data_1) <- c("lat", "lon", "dose", "name of places")
data_1 <- mutate(data_1, source = "data_aelb1")

summary(data_1)

register_google(key="AIzaSyBTnAyGePvGO94QIVH4LZTRMVkrt2SFWxs")

map <- get_map(location = c(101.7543083, 2.8967), maptype = "hybrid", zoom = 18)

ggmap(map, extent = "device") + 
  stat_density2d(data = data_1, aes(x = lon, y = lat, fill = ..level.., alpha = 0.8), 
  size = 0.01, bins = 16, geom = "polygon") + scale_fill_gradient(low = "green", high = "red", name = "doserate(μSv/hr)") +
  scale_alpha(range = c(0, 0.2), guide = FALSE) +
  geom_point(aes(x = lon, y = lat), colour = "black", alpha = 0.4, size = 2, data = data_1) + guides(fill=FALSE)