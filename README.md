# Data-Mapping-Using-R
My first personal project proposed by my internship supervisor from the BRD Training and then further researched with my final year project supervisor at University Technology of Malaysia

SEARCH AND SURVEY: BRD TRAINING 10 - 14 Jun 2019
A. Introduction
1. Interpretation of GIS-referenced in-situ radiation measurements
The interpretation of GIS-referenced in-situ radiation measurements is carried out through five “typical” steps:

data loading;
data cleaning and pre-processing (including Geo-processing);
Exploratory Data Analysis (EDA - visualize, summary statistics, getting acquainted with the dataset involved);
spatial estimation (exceedance probability, …);
results dissemination.
Each of these steps will be detailed and examplified in the following chapters.

2. R free software environment
R free software environment for statistical computing and graphics has been used by a large community of Statisticians and data analysts for decades. R’s killer feature is its extremely rich ecosystem of library/packages allowing to perform (among others): Statistical analysis, modelling, data cleaning, data transformation & visualization, machine learning, deep learning, GIS, Geospatial Analysis, …

Having to learn and use R programming language may look daunting for people used to “point & click” user interfaces but we do believe that the learning experience might be much pleasant and approachable than you first imagined and that it will pay off in the long term.

Here below some motivations:

using R to script (a sequence of data analysis steps - workflow) your analysis pipeline is definitely much easier than developping a full software or complex libary;
R ecosystem includes packages like the tydiverse suite and in particular dplyr, sf, … allowing to implement your “ideal” data analysis pipeline in an extremely intuitive and seamless manner;
RStudio IDE (Integrated Development Environment) offers an ergonomic interface where you can seamlessely code, experiment, debug your data analysis, access packages documentation, experiment different scenarios, visualize your analysis outputs, disseminate your results, …
there is a huge amount of extremely valuable and free learning resources online;
you will be able to implement reproducible research http://reproducibleresearch.net/ workflows: access, pre-process, analyse and visualize your data, document and publish your outcomes in a reproducible way.
In our particular use case, we will tap into R packages particularly relevant to the tasks at hand. It includes:

dplyr https://dplyr.tidyverse.org/ for data loading, cleaning, selection, …
ggplot2 https://ggplot2.tidyverse.org/ for data visualization
mapviewhttps://r-spatial.github.io/mapview/ for interactive data geo-visualization
sf https://r-spatial.github.io/sf/ for GIS-like features (reprojecting, clipping, and many more)
gstat https://cran.r-project.org/web/packages/gstat/vignettes/gstat.pdf for Spatial Interpolation (Geostatistics, …)
…
3. Google API key
Prior to July 2018, it was possible to use google static maps without signing up for the service. However, at this time, the service now requires individual sign up and also billing enablement. The billing enablement especially is a bit of a downer, but you can use the free tier without incurring charges.

The following are the steps you can follow to enable this service. It is imperative that you follow these steps properly:

3.1 Project creation and generation of API Key in Google
Visit https://console.cloud.google.com and sign up for a google cloud platform trial.

Create a project. In the top nav, you can either select an existing project or create a new one.

Create Project
Create Project

Add the “Maps Static API” service to the project. Navigate to the library of API services and search for “Maps Static API”. Enable the service. Generate API

Generate an API Key. Navigate to the credentials area and select “Create credentials”. Take note of your API key (from the ‘Credentials’ menu, copy your API key to the clipboard). You will need to register it with the package later.

Static API
Static API

Next add the “Geocoding API” service to the project and enable the service.
3.2 Enable billing
Billing must be ENABLED (Mandatory) to make use of this service. It’s free unless you are using it to pull large quantities of maps. Also note that credit/debit card information is required to complete the process.

Quick and detailed guides can be found here: https://developers.google.com/maps/documentation/javascript/get-api-key

Terms & Conditions: https://cloud.google.com/terms/free-trial/?_ga=2.266389710.-1729859403.1557571091

3.3 Update of the ggmap R package
Read more about the updated package: https://journal.r-project.org/archive/2013-1/kahle-wickham.pdf
3.4 Errors related to API keys and billing
If you use the Maps Static API without an API key, or if billing is not enabled on your account, the page displays an error image instead of a map, with a link indicating the type of error. For example “g.co/staticmaperror/key”.
Errors
Errors

To resolve, try the following: - Get an API key - Enable billing

Note: If you still have a failure then restart R and run the library and register google commands again.

More Q&A - https://github.com/dkahle/ggmap/issues/51

4. How to best use this “template” data analysis workflow
This tutorial targets two distinct types of audience with different objectives:

researchers, engineers, … willing to develop thorough data analysis skills and use them on a regular basis: execute, modify code snippets provided and explore/study further resources and supplemental material pointed out;

decision makers willing to understand typical data analysis workflows and to assess toolbox’s suitability and potential without delving into the programming details: understand the rationale and sequence of a typical workflow; [optionnally] tweack code snippets, model parameters, visualizations, …

5. RStudio and R markdown crash course
RStudio is a free and open-source Integrated Development Environment (IDE) for R. In a nutshell, it is a single entry point to a wide range of features and functionalities allowing to perform data loading, transformation, analysis, modelling and visualization. Additionnaly, used in combination with RMarkdown package, it allows to document and publish your data analysis pipeline/workflow efficiently, thus ensuring reproducibility and fostering collaboration.

RStudio IDE, RMarkdown and R packages in general are extremely well documented. In particular, it is highly recommended to get access to the series of RStudio Cheat Sheets available here: https://www.rstudio.com/resources/cheatsheets/ (you will find them as well in pdf format in the /Resources folder of the course material). For now the two most important one are: RStudio IDE Cheat Sheet, R Markdown Cheat Sheet.

☞ For further reference, take a look as well at: http://r4ds.had.co.nz/r-markdown.html#r-markdown-basics

5.1 Inserting and executing code “chunks” in RMarkdown
An RMarkdown document is a mix of formatted text, images, links, graphs and code chunks (small piece of R code).

R code chunks are inserted surrounded by a pair of triple quote as follows (look at the next chapter to create it in a single keyboard stroke):

A typical R code chunk
A typical R code chunk

Then the whole RMarkdown document can be “Knitted” to html or whatever format you find relevant through RStudio User Interface (or associated keyboard shortcut - see next chapter).

Knit to … menu in RStudio
Knit to … menu in RStudio

It is important to note that each chunk can be executed individually and sequentially by clicking the green left arrow at the top right of a code chunk. This way, before generating/knitting the whole RMarkdown document, you can experiment/debug it.

It is important to remember than code chunks must be executed from top to bottom sequentially as later chunks will depend on calculations of previous ones.

Rstudio “Run” menu accessible at the top of a RMarkdown document is as well extremely convenient as it allows to execute all chunks above, below the current selected one

Run All Chunks above …
Run All Chunks above …

☞ Pro tip: You can as well select any line in a chunk and execute it by pressing “Shift + Enter” keyboard keys.

☞ Pro tip: Last, you can experiment any piece of code in the R console itself. This is an ideal way to interactively analyse, visualize your data, debug your code, …

Exploring through R console
Exploring through R console

5.2 Some useful keyboard shortcuts
There are dozens of keyboard shorcuts that would improve your user experience and productivity. Many of them are listed in RStudio “Help” menu. Below a curated list of extremely useful ones:

Note: “Cmd/Ctrl” means you should use “Cmd” key for a Mac keyboard and“Ctrl” for others

Cmd/Ctrl-Alt-I: Create code chunk

Cmd/Ctrl-Shift-K: “Knit”" all document

Cmd/Ctrl-Shift-Enter: Executing single code chunk (you can use as well the green top-left arrow)

alt + -: <- (R variable assignment symbol)

Cmd/Ctrl-Shift-M: %>% (Piping commands - see below)

Cmd + alt + R: Run all

Cmd/Ctrl-Shift-C: Comment block selected/highlighted

B. Exploratory Data Analysis
As nicely summarized by H. Wickham and G. Grolemund in their outstanding book “R for Data Science” (see reference below): Exploratory Data Analysis is an iterative cycle where you:

Generate questions about your data;
Search for answers by visualizing, transforming and modelling your data;
Use what you learn to refine your questions and/or generate new questions.
☞ For further reference: http://r4ds.had.co.nz/exploratory-data-analysis.html (Accessible online)

In our specific case, we will load the dataset collected, clean it, look at summary statistics, transform it, look at values distribution, spot potential outliers, spatialize it, … Our ultimate goal being to gain enough knowledge to inform and prepare the spatial estimation of doses in our area of interest.

1. Data loading & transformation
Data can come in a variety of formats and structures: .csv, .xlsx and many others. In our particular case, we will read a specific sheet of an Excel file using the readxl package.

Let’s first read the data currently stored in two Atomtex Detector waypoint files:
# Read and extract data from two waypoint files and then combine the data frames into one file. 

# We then select columns, filter rows, rename column/field names, ... easily and intuitively using the `dplyr` package.

data_1 <- read.csv("data/wp_01.wpt", sep=",", skip=4)
data_1 <- dplyr::select(data_1, c(2,3,4))
colnames(data_1) <- c("dose", "lat", "lon")
data_1 <- mutate(data_1, source = "wp_01")

data_2 <- read.csv("data/wp_02.wpt", sep=",", skip=4)
data_2 <- dplyr::select(data_2, c(2,3,4))
colnames(data_2) <- c("dose", "lat", "lon")
data_2 <- mutate(data_2, source = "wp_02")

data <- rbind(data_1, data_2)

# Converting doses from uGy/h to nGy/h
data <- mutate(data, dose = dose*1000)
☞ For further reference: http://r4ds.had.co.nz/transform.html and http://r4ds.had.co.nz/pipes.html

☞ Pro tip: From RStudio, the documentation of any function (usage, function parameters, returned value, …) can be accessed by writing in RStudio console ?funcion_name, in our case: ?read_excel.

☞ For further reference: http://r4ds.had.co.nz/data-import.html

It’s always a good idea to take a quick look at the first and last rows of a just loaded dataset.

Quick look at first rows:
head(data)
##   dose      lat      lon source
## 1   47 47.97523 16.50849  wp_01
## 2   47 47.97523 16.50848  wp_01
## 3   47 47.97523 16.50848  wp_01
## 4   47 47.97523 16.50847  wp_01
## 5   47 47.97523 16.50847  wp_01
## 6   47 47.97523 16.50847  wp_01
Quick look at last rows:
tail(data)
##     dose      lat      lon source
## 550   51 47.97495 16.51116  wp_02
## 551   51 47.97499 16.51115  wp_02
## 552   51 47.97503 16.51118  wp_02
## 553   51 47.97505 16.51120  wp_02
## 554   51 47.97507 16.51123  wp_02
## 555   51 47.97516 16.51102  wp_02
Note: By default the first and last 5 rows are displayed but it can be further specified, for instance: head(data, 10).

2. First round of EDA
Getting Summary Statistics:
summary(data)
##       dose             lat             lon           source         
##  Min.   : 31.00   Min.   :47.97   Min.   :16.51   Length:555        
##  1st Qu.: 47.00   1st Qu.:47.97   1st Qu.:16.51   Class :character  
##  Median : 51.00   Median :47.98   Median :16.51   Mode  :character  
##  Mean   : 55.51   Mean   :47.98   Mean   :16.51                     
##  3rd Qu.: 57.00   3rd Qu.:47.98   3rd Qu.:16.51                     
##  Max.   :481.00   Max.   :47.98   Max.   :16.51
How many points are collected per source (name of data collector)?
data %>% 
  count(source)
## # A tibble: 2 x 2
##   source     n
##   <chr>  <int>
## 1 wp_01    243
## 2 wp_02    312
Important remark: To avoid storing all intermediate steps into “dummy” variables and code your data analysis more “fluidly”, you can perform as many operations as you want in one go using the %>% (pronounce “pipe”) operator as follows (see curated RStudio shortcuts in the introduction).

Histogram of dose per source :
R has several systems for making graphs, but ggplot2 is one of the most elegant and most versatile. ggplot2 implements the grammar of graphics, a coherent system for describing and building graphs. With ggplot2, you can do more and faster by learning one system and applying it in many places.

#  1. first ggplot's layer: ggplot(data, mapping = aes(x = dose)) specifying data
#     and aesthetics mapping (here the dose variable to x positioning)
#  2. second layer: geom_histogram(fill = "steelblue") specifying we want an 
#     histogram
#  3. last layer: facet_grid(source ~  .) specifying we want to breakdown the 
#     histogram by source (here name of data collector)

ggplot(data, mapping = aes(x = dose)) +
  geom_histogram(fill = "steelblue") +
  facet_grid(source ~  .)


Again, data visualization is a wide topic and ggplot offers a lot of flexibility and expressive power. Hopefully, there are great resource materials available.

☞ For further reference: * http://r4ds.had.co.nz/data-visualisation.html * https://www.rstudio.com/wp-content/uploads/2015/03/ggplot2-cheatsheet.pdf

To quickly “spatialize” all data:
#  1. Base layer: pass data and map "lon" and "lat" variables respectively to
#     x and y aesthetics
#  2. add a "point" layer and map "dose" variable to the color aesthetic with
#     alpha (opacity) to 0.8 (0 is transparent and 1 is opaque) and points size
#  3. specify a color palette. "direction = -1" reverses the color order
#  4. specity a map projection. Look at ?coord_map in RStudio console for
#     further details. Map projections will be covered more carefully later on.
#
ggplot(data, mapping = aes(x = lon, y = lat)) +
  geom_point(aes(color = dose), alpha = .8, size = 2) +
  scale_color_viridis(direction = -1) +
  coord_quickmap()


It looks like one of the source (waypoint file) has doses on the way to the site, which one?
# Same as previous but now "facetted"
ggplot(data, mapping = aes(x = lon, y = lat)) +
  geom_point(aes(color = dose), alpha = .8, size = 2) +
  scale_color_viridis(direction = -1) +
  coord_quickmap() +
  facet_grid(source ~  .)


Quick interactive map with various base layers:
# If the data set was huge (e.g. 20,000+ measurements) we could sample 10,000 points from available data 
# subset <- data[sample(1:nrow(data), 10000),]

# Convert our data/subset to a "sf" package "compatible" object
# with associated crs (Coordinate Reference System - further details later on)
# and specifying "lon" and "lat" columns in original dataset
# subset <- st_as_sf(subset, coords = c("lon", "lat"), crs = 4326)
 data_sf <- st_as_sf(data, coords = c("lon", "lat"), crs = 4326)

# Create an interactive map with "mapview" funtion from the "mapview" package
#   - zcol: variable to be colour encoded
#   - map.types: base layer (here Esri satellite imagery)
#   - legend: do we want a legend or not

mapview(data_sf, zcol = "dose", map.types = "Esri.WorldImagery", legend = TRUE)
+
−
data_sf - dose
50
100
150
200
250
300
350
400
450

50 m
200 ft
data_sf - doseLeaflet | Tiles © Esri — Source: Esri, i-cubed, USDA, USGS, AEX, GeoEye, Getmapping, Aerogrid, IGN, IGP, UPR-EGP, and the GIS User Community
[Optional] Further details on subsampling:
Whenever a piece of code looks cryptic, decompose it and execute piece by piece in the RStudio console. Below the subsampling line used above decomposed:

# Get number or rows in data
#nb_rows <- nrow(data)

# Create a sequence of value: 1, 2, 3, ..., 10
#my_range <- 1:10

# Sample 5 integers from the sequence 1:5
#sample(1:10, 5)

# Subsetting a dataframe by index of rows to be selected
# data[index_of_rows, columns_of_interest] (here we want to keep all columns)
#data[sample(1:nrow(data), 10000),]
3. Refining the area of interest
It appears that one of the data collector collected data on the way to the site. Our ultimate goal being to produce a map of doses in “brd” site, we would like to exclude these points. There are various way to do so:

using available lon and lat attributes/fields/columns and filtering measurements outside our range of interest;
using GIS-like techniques to clip/crop collected points in a polygon of interest (in our case what’s call a “Convex Hull”).
3.1 Subsetting using lon and lat attributes
Let’s try to identify site’s perimeter using wp_01 data and subset wp_02’s one.

Excluding wp_02 measurements:
# Where source is different from "wp_02"
no_wp_02 <- data %>% 
  filter(source != "wp_02")
Subsetting the whole dataset by lon and lat range
rg_lon <- range(no_wp_02$lon)
rg_lat <- range(no_wp_02$lat)

data_site_only <- data %>% 
  filter(lon > rg_lon[1] & lon < rg_lon[2] & lat > rg_lat[1] & lat < rg_lat[2])
Let’s “spatialize” again all subsetted data as a quick check:
ggplot(data_site_only, mapping = aes(x = lon, y = lat)) +
  geom_point(aes(color = dose), alpha = .6, size = 1) +
  scale_color_viridis(direction = -1) +
  coord_quickmap()


Spatialize with satellite basemap:
The ggmap package allows to download various type of basemaps (including sattelite imagery) and to use it in combination with ggplot:

We first set the API key (see guide presented in the Introduction section)

#Set your API Key
register_google(key = "AIzaSyAdoTldVClWmsNVtvjs2uIcOL73bQdUFgk")
Start Making Maps!

# First download a satellite basemap - here a Google one. NOte that the coordinates indicated are mean values of the data_site_only file.

brd_map <- get_map(location = c(16.50858772, 47.97499538), maptype = "satellite", zoom = 18)
# Overlay data based on lat and lon attributes
# Access ?ggmap documentation for details on extent option (not really important actually)
ggmap(brd_map, extent = "device") +
  geom_point(aes(x = lon, y = lat), colour = "red", alpha = 0.3, size = 1.5, data = data_site_only)


Let’s assess the density of measurements taken [Advanced]
ggmap(brd_map, extent = "device") + 
  geom_density2d(data = data_site_only, aes(x = lon, y = lat), size = 0.3, colour = "white") + 
  stat_density2d(data = data_site_only, aes(x = lon, y = lat, fill = ..level.., alpha = ..level..), 
                 size = 0.01, bins = 16, geom = "polygon") + scale_fill_gradient(low = "green", high = "red") +
  scale_alpha(range = c(0, 0.3), guide = FALSE) +
  guides(fill=FALSE)


Where are measurements over 150 nSv/h (location of sources)?
Let’s now visually assess where are points over 150 nSv/h as it might reveal where the gamma sources are located.

ggmap(brd_map, extent = "device") +
  geom_point(aes(x = lon, y = lat), colour = "red", alpha = 1, size = 1.5, data = data_site_only[data_site_only$dose > 150,])


3.2 Subsetting using GIS-like functions
Using the sf package to enter GIS world!
# Convert dataframe to an "sf" compatible object
no_wp_02_sf <- st_as_sf(no_wp_02, coords = c("lon", "lat"), crs = 4326)
Note: 4326 is the code for the World Geodesic System (WGS) Coordinate Reference System (CRS) most often used when using GPS-enabled device.

☞ For further reference on Coordinated Reference Systems and Map projections: * projections.Rmd * http://www.progonos.com/furuti/MapProj/CartIndex/cartIndex.html

☞ For further reference on sf package: https://r-spatial.github.io/sf/articles/sf1.html

Now, we have converted our initial data (R dataframe) to sp dedicated type:

no_wp_02_sf
## Simple feature collection with 243 features and 2 fields
## geometry type:  POINT
## dimension:      XY
## bbox:           xmin: 16.50778 ymin: 47.97438 xmax: 16.50927 ymax: 47.97545
## epsg (SRID):    4326
## proj4string:    +proj=longlat +datum=WGS84 +no_defs
## First 10 features:
##    dose source                  geometry
## 1    47  wp_01 POINT (16.50849 47.97523)
## 2    47  wp_01 POINT (16.50848 47.97523)
## 3    47  wp_01 POINT (16.50848 47.97523)
## 4    47  wp_01 POINT (16.50847 47.97523)
## 5    47  wp_01 POINT (16.50847 47.97523)
## 6    47  wp_01 POINT (16.50847 47.97523)
## 7    47  wp_01 POINT (16.50847 47.97523)
## 8    47  wp_01 POINT (16.50847 47.97523)
## 9    47  wp_01 POINT (16.50847 47.97523)
## 10   47  wp_01 POINT (16.50847 47.97523)
# Quick plot
#   - "st_geometry(no_wp_02_sf)" specifies we only want to map the geometry. 
#   - Run "plot(no_wp_02_sf)" instead in RStudio console what happens?
plot(st_geometry(no_wp_02_sf))


As you see, a bounding box is calculated around the points, we have a projection and a special geometry column. We are now ready to perform GIS-like operations.

Let’s calculate the convex hull/envelope (polygon surrounding all of our points of interest):
# - Each point is a "feature". 
# - "st_convex_hull" accept features as argument.
# - If you execute "st_convex_hull(no_wp_02_sf)"", you will get convex hulls around each 
#   individual feature (hereindividual points actually). This is not what we want.
# - By taking the "union" we group all available features to a unique one (multipoint feature)

site_perimeter <- st_convex_hull(st_union(no_wp_02_sf))
plot(site_perimeter)


Compute area of Region of Interest:
# Returns the area as name suggests
st_area(site_perimeter)
## 7800.48 [m^2]
Compute perimeter of Region of Interest:
st_length(site_perimeter)
## 335.4038 [m]
And now subset all data using only measurements within the convex hull:
# Convert first our data to sf object
data <- st_as_sf(data, coords = c("lon", "lat"), crs = 4326)

# Computes the intersection
data_site_only <- st_intersection(data, site_perimeter)
## Warning: attribute variables are assumed to be spatially constant
## throughout all geometries
plot(st_geometry(data_site_only))


B. Spatial estimation & Geostatistics
So far we have used two extremely useful R packages dplyr and sf when dealing with data analysis in general and geo-data in particular.

In this section we want to estimate dose rates at unobserved locations. There are non-geostatistical and geostatistical methodologies to do so. The main difference is that in the latter scenario, we want to take advantage of the spatial correlation. As Tobler’s law states “everyhing is related to everything else, but near things are more related than distinct things” https://en.wikipedia.org/wiki/Tobler%27s_first_law_of_geography.

Geostatistics provides a set of tools and methodologies allowing to take advantage of this spatial correlation (when present) to provide better estimates.

There are two additional package tremendously useful when you want to perform Geostatistics, named sp and gstat.

Let’s convert first our dataset to UTM 39N map projection:
So far, we have used the longitude and latitude to locate our measurements, however in this part we will use a lot distances between points and while it is possible to measure distances in degrees it would be more “meaningful” to use meters instead. To do so we need to project our data into UTM map projection for our region of interest (see again the short briefing on CRS and map projections for further details).

# Transform to UTM
data_utm <- st_transform(data_site_only, crs = 32633)
Taking a look at max X and Y distances:
# Bounding box
bbox_utm <- st_bbox(data_utm)

print("Delta X max (m)")
## [1] "Delta X max (m)"
print(unname(bbox_utm[3] - bbox_utm[1]))
## [1] 112.0914
print("Delta Y max (m)")
## [1] "Delta Y max (m)"
print(unname(bbox_utm[4] - bbox_utm[2]))
## [1] 119.0308
Adding a column of distances from highest dose location [optional]:
max_pts <- data_utm[data_utm$dose == max(data_utm$dose),]$geometry

data_utm <- data_utm %>% 
  mutate(distance = st_distance(geometry, max_pts))
As stated above, the gstat package we will use to perform Geostatistics requires sp compatible objects.

We first need to make our data “sp-friendly” as follows:
# Convert to Spatial class
data_sp <- as(data_utm, Class = "Spatial")
head(data_sp)
##   dose source      distance
## 1   47  wp_01 10.402626 [m]
## 2   47  wp_01 10.162041 [m]
## 3   47  wp_01  9.722122 [m]
## 4   47  wp_01  9.475296 [m]
## 5   47  wp_01  9.428866 [m]
## 6   47  wp_01  9.691418 [m]
Let’s retake a quick look at dose histogram:
hist(data_sp$dose)


1. Variography
Renaming coordinates names (for further use)
# Names of default coordinates name
coordnames(data_sp)
## [1] "coords.x1" "coords.x2"
# Let's rename it for the sake of simplicity
coordnames(data_sp) <- c("x", "y")
Kriging is not possible when the covariance matrix is singular (not invertible). This is the case when there are duplications locations. Hence, it is always safer to remove them.

Remove duplicated locations:
# List the pairs of points with same coordinates
head(zerodist(data_sp))
##      [,1] [,2]
## [1,]    6    7
## [2,]   66   67
## [3,]  249  250
## [4,]  327  328
## [5,]  406  407
Hence to remove them:

data_sp <- data_sp[-zerodist(data_sp)[,1],] 
Assessing spatial correlation:
hscat(dose ~ 1, data_sp, seq(1,10,1))


Plotting variogram:
The variogram is a visualization tool allowing to assess and model spatial correlation. The whole field of geostatistics relies on a set of strict assumptions such as: * Gaussion distribution of your data; * Stationarity: the mean, variance and variogram should remain the same whatever the sub-region of your region of interest.

This last assumption is a strong one leading to many avatars of geostatistics-based interpolation techniques such as: ordinary Kriging, co-Kriging, … In most cases the main goal is to “detrend” your data (having a constant mean over your area of interest - whatever the subregion). To do so, you can use a linear model using distance or simply x and y coordinates as predictors or more recent non-linear machine learning techniques.

☞ For further reference:

https://www.springer.com/fr/book/9781461476177
http://spatial-analyst.net/book/
ISRIC video series: https://www.youtube.com/watch?v=FWmADoAbXNg
https://bookdown.org/nowosad/Geostatystyka/metody-interpolacji.html (use Google translate if you don not speak Polish)

Pairs of point variance by lag distance:

dose_vgm <- variogram(dose ~ 1, data_sp, cloud = TRUE)
plot(dose_vgm)


The “summarized/aggregated” version:
# - "dose ~ 1": single constant regressor leading to a spatially constant mean coefficient
#               Try "dose ~ x + y" (using x and y coordinates as regressor to 
#               potentially detrend our data). Is there any difference?
# - cloud = FALSE: Variogram cloud or sample variogram (FALSE)
# - boundaries: distance values of interest. In our case we provide two sequences from fine
#               resolution at short distance to coarse one at long distance
#
# Change the parameters to see differences (Warning: in the situation where you set cloud = TRUE, 
# take a subsample of the data otherwise it might take a lot of time)

#dose_vgm <- variogram(dose ~ 1, data_sp, cloud = FALSE, boundaries = c(seq(2,20,2), seq(21, 120, 10)))
dose_vgm <- variogram(dose ~ 1, data_sp, cloud = FALSE, 
                      boundaries = seq(2,20,1))

plot(dose_vgm)


☞ For further reference on R’s formula: http://r4ds.had.co.nz/model-basics.html#formulas-and-model-families

Fitting variogram:
Fitted variogram parameters
Fitted variogram parameters

# Eyeball the variogram and estimate the initial parameters
nugget <- 400
psill <- 600 # Partial sill
range <- 10

# To see models available, execute "vgm()" in RStudio console: Nug, Exp, ...
# They are "canonical" class of functions to be fitted. 
# "kappa" parametrizes some models: for instance a Matern model with 
# kappa = 0.5 is the exponential model. In our case, we ask to find this parameter
# automatically.
# Finding the right function, parameters is more an "art" than a science. So try and interpret ...
v_model <- fit.variogram(dose_vgm, model = vgm(
    model = "Sph",
    nugget = nugget,
    psill = psill,
    range = range,
    fit.kappa = TRUE
) )

plot(dose_vgm, model = v_model)


print(v_model)
##   model      psill    range
## 1   Nug   87.13567  0.00000
## 2   Sph 1109.08437 14.79219
Different models are available:

vgm()
##    short                                      long
## 1    Nug                              Nug (nugget)
## 2    Exp                         Exp (exponential)
## 3    Sph                           Sph (spherical)
## 4    Gau                            Gau (gaussian)
## 5    Exc        Exclass (Exponential class/stable)
## 6    Mat                              Mat (Matern)
## 7    Ste Mat (Matern, M. Stein's parameterization)
## 8    Cir                            Cir (circular)
## 9    Lin                              Lin (linear)
## 10   Bes                              Bes (bessel)
## 11   Pen                      Pen (pentaspherical)
## 12   Per                            Per (periodic)
## 13   Wav                                Wav (wave)
## 14   Hol                                Hol (hole)
## 15   Log                         Log (logarithmic)
## 16   Pow                               Pow (power)
## 17   Spl                              Spl (spline)
## 18   Leg                            Leg (Legendre)
## 19   Err                   Err (Measurement error)
## 20   Int                           Int (Intercept)
If you want to have an idea of their “shape”, you can simply run:

show.vgms()


2. Krigging
2.1 Generating an interpolation grid
Converting convex hull previously generated to sp compatible format:
# First in the right projection
site_perimeter_utm <- st_transform(site_perimeter, crs = 32633)
# Then to sp compatible type
site_perimeter_sp <- as(site_perimeter_utm, Class = "Spatial")
Quick check of site perimeter over our data points:
plot(site_perimeter_sp); points(data_sp)


Quick look at bounding box to further inform grid creation:
bbox_site <- bbox(site_perimeter_sp)
bbox_site
##         min       max
## x  612526.3  612638.4
## y 5314554.1 5314673.1
Generating a grid of ~ 2 meter resolution
# The first parameter is the bottom left corner
resolution <- 2
size_x <- as.integer((bbox_site[1,2] - bbox_site[1,1]) / resolution)
size_y <- as.integer((bbox_site[2,2] - bbox_site[2,1]) / resolution)
grid <- GridTopology(c(612526, 5314554), c(resolution, resolution), c(size_x, size_y))

# Create points with the same coordinate system as the boundary
gridpoints <- SpatialPoints(grid, proj4string = CRS(projection(site_perimeter_sp)))
plot(gridpoints)


Let’s crop out the points outside the boundary:
cropped_gridpoints <- crop(gridpoints, site_perimeter_sp)
plot(cropped_gridpoints)


Convert to SpatialPixels:
# Convert to SpatialPixels
spgrid <- SpatialPixels(cropped_gridpoints)
coordnames(spgrid) <- c("x", "y")
plot(spgrid)


2.2 Gridded prediction using Krigging
Do kriging predictions over the grid:
# We pass:
#   - the value to predict
#   - the dataset
#   - the output data
#   - our model from variogram
#   - we want to use max 100 surrounded points (would be computationally demanding otherwise)
dose_grid <- krige(dose ~ 1, data_sp, newdata = spgrid, model = v_model, nmax = 100)
## [using ordinary kriging]
Mapping inteporlated values:
spplot(dose_grid, zcol = "var1.pred")


Mapping inteporlated values variance:
spplot(dose_grid, zcol = "var1.var")


Calculating the probability of dose exceeding 150 nGypH:
threshold <- 150
dose_grid$pDose <- 1 - pnorm(threshold, mean = dose_grid$var1.pred, sd = sqrt(dose_grid$var1.var))
Mapping the probability of dose samples > 200 nGypH:
spplot(dose_grid, zcol = "pDose")


3. Handling colour palettes
All cartographers, soon or later in their careers, will realize the singular role played by colors in map design. Arthur H. Robinson, in 1952 brillantly captured this thought:

For some reason, as soon as color is applied to a map the color becomes a focus of criticism, and everyone, regardless of his familiarity with the principles of color use, seems to feel that he is entitled to comment upon the color on the basis of his own likes and dislikes

Principles of color uses for Thematic Mapping have been well studied, theorized and applied for a long time. So it is better to rely on best practices. ColorBrewer: http://colorbrewer2.org/ provides a set of colour palettes (quantitative and qualitative) complying with the highest mapping standards. Fortunately, there is an R package “RColorBrewer” allowing to take advantage of it.

3.1 RColorBrewer palettes
☞ For further reference:

http://colorbrewer2.org/
http://www.nickeubank.com/wp-content/uploads/2015/10/RGIS3_MakingMaps_part1_mappingVectorData.html#controlling-colors
display.brewer.all()


# Choosing a colour palette
my.palette <- brewer.pal(n = 7, name = "YlGnBu")
# Applying the new colour palette to our map
spplot(dose_grid, zcol = "var1.pred", col.regions = my.palette, cuts = 6, col = "transparent")


2.4 Controlling colour breaks
Colour encoding forces us to discretize our data (here air dose). This is a clear loss of information and definitely not a simple or random choice and excellent way to “Lie with maps” https://press.uchicago.edu/ucp/books/book/chicago/H/bo27400568.html

Let’s take a closer look at this critical step:

Automatic computing of breaks:
# Discretizing using equal length intervals
breaks <- classIntervals(dose_grid$var1.pred, n = 6, style = "equal", intervalClosure = "right")

# Rounding and converting breaks to string ()
breaks.legend = sapply(breaks$brks, function(x) as.character(floor(x)))

# Applying the color palette and discretization
spplot(dose_grid, zcol = "var1.pred", col.regions = my.palette, cuts = 6, col = "transparent", at = breaks$brks, colorkey = list("labels" = breaks.legend, title = "test"))

# To manually add a colour key label
grid.text("Dose Rate (nGy/h)", x=unit(0.92, "npc"), 
          y=unit(0.50, "npc"), rot=-90,
          gp = gpar(fontsize = 10, fontface = "bold"))


☞ For further reference on “sapply” like functions: https://bookdown.org/rdpeng/rprogdatascience/loop-functions.html

Notes: “npc” stants for Normalised Parent Coordinates

Assessing breaks relevance:

Let’s first create a utility function that plot an histogram of values with breaks overlayed:

assess_breaks <- function(data, breaks) {
  ggplot() +
  geom_histogram(aes(data), fill = "steelblue") +
  geom_vline(xintercept = breaks, colour = "red")
}
# Assessing kmeans discretization/binning
# Experiment several "style" discretization methods
breaks <- classIntervals(dose_grid$var1.pred, n = 6, style = "kmeans", intervalClosure = "right")

assess_breaks(dose_grid$var1.pred, breaks$brks)


4. Gridded prediction using Inverse Distance Weighting (IDW)
For reference, Inverse Distance Weighting is one of the most straightforward interpolation method, estimating unobserved location values as a weighted averages of surrounded observed ones based on their distances. This can be achieve very easily in R:

# idp: is the inverse distance weighting power (the vicinity of points to be considered).
#      Experiment several values and see how smooth or sharp your map becomes.
idw.out <- idw(dose ~1, data_sp, spgrid, idp = 2.5)
## [inverse distance weighted interpolation]
Mapping inteporlated values:
spplot(idw.out, zcol = "var1.pred")


Interactive map with satellite base map:
idw.out.raster <- raster(idw.out)
mapview(idw.out.raster, alpha.regions = 0.5, legend = TRUE, map.types = "Esri.WorldImagery")
+
−
Layer idw.out.raster: 57.4089549776658
idw.out.raster
50
100
150
200
250

NA
5 m
30 ft
idw.out.rasterLeaflet | Tiles © Esri — Source: Esri, i-cubed, USDA, USGS, AEX, GeoEye, Getmapping, Aerogrid, IGN, IGP, UPR-EGP, and the GIS User Community
lon: 16.50804 | lat: 47.97476 | zoom: 20
