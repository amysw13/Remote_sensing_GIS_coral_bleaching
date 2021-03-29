####Part A: Mapping temperature anomalies####

####SET UP######################################################################

#House keeping - Clear memory and global environment

rm(list=ls())

#Loading in required packages

if(!require(dplyr)){install.packages("dplyr"); library(dplyr)}
if(!require(ggplot2)){install.packages("ggplot2"); library(ggplot2)}
if(!require(tidyr)){install.packages("tidyr"); library(tidyr)}
if(!require(scales)){install.packages("scales"); library(scales)}
if(!require(RNetCDF)){install.packages("RNetCDF"); library(RNetCDF)} #to read in .nc files
if(!require(patchwork)){install.packages("patchwork"); library(patchwork)}
if(!require(maps)){install.packages("maps"); library(maps)}
if(!require(rnaturalearth)){install.packages("rnaturalearth"); library(rnaturalearth)}
if(!require(sf)){install.packages("sf"); library(sf)}
if(!require(remotes)){install.packages("remotes"); library(remotes)}
if(!require(pals)){remotes::install_github("kwstat/pals"); library(pals)}

#Setting working directory

setwd("add here your working directory")

#check working directory

getwd()

#### Read GIOVANNI data function ##############################################
#Create custom function to read in GIOVANNI data

read_giovanni_nc_map <- function(giovanni_nc_map_file){ 
  
  #Load the NetCDF file
  giovanni_map_data <- open.nc(giovanni_nc_map_file)
  
  #Extract its content
  giovanni_map_data <- read.nc(giovanni_map_data)
  
  #Convert its content to a data frame
  giovanni_map_dataframe <- as.data.frame(giovanni_map_data[1])
  names(giovanni_map_dataframe) <- giovanni_map_data[["lat"]] 
  giovanni_map_dataframe$lon <- giovanni_map_data[["lon"]]
  
  #Switch from a wide matrix format
  #in which values for longitude are given across columns
  #to a long format, with a single temperature measurement per row
  giovanni_map_data <- gather(giovanni_map_dataframe,
                              "lat","temperature",
                              -length(names(giovanni_map_dataframe)))
  
  return(giovanni_map_data)
}


####Load in data #################################################################

#Load in long-term sea surface temperature data set, using the custom function created above

climatic_average <-read_giovanni_nc_map("./Data/long_term_SST4.nc")

#renaming temperature column to climatic_temperature
climatic_average <- rename(climatic_average,
                           climatic_temperature = temperature)


#Load in single year data set, this is the chosen year/12 month time span of coral bleaching
single_year <- read_giovanni_nc_map("./Data/SST4_2016_2017.nc")

#renaming temperature column  to year_temperature

single_year <- rename(single_year,
                      year_temperature = temperature)


#### Wrangling the data ########################################################

#Creating a new object called *"anomaly"* and inputting the *"single_year"* dataframe
anomaly <- single_year

#Adding the "climatic_average" temperature data to the anomaly dataframe
anomaly$climatic_temperature <- climatic_average$climatic_temperature

#Calculate the anomalies (differences in temperature)
anomaly$difference <- with(anomaly, year_temperature-climatic_temperature)

#Remove missing values
anomaly <- na.omit(anomaly)

#Constrain the data to sensible values
temp_anomaly <- anomaly[anomaly$difference < 3 & anomaly$difference > -3,]


####Mapping temperature anomalies ##############################################

#Download world base map

world <- ne_download( scale = 110, type = 'countries', returnclass = "sf")

#check world map
ggplot()+
  geom_sf(data = world)


#Map temperature anomalies 
#play around with the aesthetics in ggplot to create the final map 

p_map <- ggplot()+
  geom_tile(data = temp_anomaly, aes( x = as.numeric(lon), y = as.numeric(lat),
            fill = as.numeric(difference)))+
  geom_sf(data = world, colour = "gray50", fill = "gray50" )+
  scale_fill_gradientn("Title of legend", colours = ocean.curl(100), na.value = "transparent")+
  xlab("X Title") + ylab("Y Title") +
  coord_sf(xlim = c(-180,180), ylim = c(-35,35), expand = FALSE)+
  scale_y_continuous(breaks = c(-30, -20 , -10, 0, 10, 20, 30))+ 
  theme(axis.ticks = element_line(colour = "red"),
        axis.text = element_text(colour = "green"),
        plot.margin = unit(c(0.25,0.25,0.25,0.25), "cm"))

p_map

#Save map - label map appropriately for future reference
ggsave("./Maps/Example_anomaly_map.png", p_map, 
       bg = "transparent", width = 17, height = 12, 
       units =  "cm", dpi = 300)


#Save data

write.csv(temp_anomaly, file = "./Output/long_term_anomaly.csv")


#### TIPS #######################################

#Use this script to help mapping your site maps 