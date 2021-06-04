library(RColorBrewer)
library(classInt)
library(ggplot2)
library("ggmap")

data_1 <- read.csv("data/Data Makmal Nuklear (2020).csv")
data_1 <- dplyr::select(data_1, c(6))
colnames(data_1) <- c("dose")
summary(data_1)

data_1 <- read.csv("data/Data Makmal Nuklear (2020).csv")
data_1 <- dplyr::select(data_1, c(6,9,7,8))
colnames(data_1) <- c("dose", "Name of Places", "latitudes", "longitudes")

register_google(key="AIzaSyBTnAyGePvGO94QIVH4LZTRMVkrt2SFWxs")

map <- get_map(location = c(103.6391139, 1.559866667), zoom = 21, maptype = "hybrid")
ggmap(map, extent = "device") + 
  geom_point(aes(x = longitudes, y = latitudes, colour = dose), alpha = 1, size = 3, data = data_1) + 
  scale_colour_gradient(low = "green", high = "red", name = "doserate(μSv/hr)")