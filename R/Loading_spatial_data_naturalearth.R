#### Downloading spatial data from Natural Earth website manually####


##Packages

if(!require(sf)){install.packages("sf"); library(sf)}

##Website 

#https://www.naturalearthdata.com/downloads/50m-physical-vectors/

#1. Download a physical vector for "world" basemap

#2. Select "land" -> click "Download land" 

#3. Save file

#4. unzip folder

#Loading data into R

world <-st_read("./Data/ne_50m_land/ne_50m_land.shp")


#Note: do not move any files within the downloaded data folder as this can cause
#the .shp file not to load properly