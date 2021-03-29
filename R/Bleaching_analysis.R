####Part B: Coral Bleaching analysis####

####SET UP######################################################################

#House keeping - Clear memory and global environment

rm(list=ls())

#Loading in required 

if(!require(dplyr)){install.packages("dplyr"); library(dplyr)}
if(!require(ggplot2)){install.packages("ggplot2"); library(ggplot2)}
if(!require(tidyr)){install.packages("tidyr"); library(tidyr)}
if(!require(scales)){install.packages("scales"); library(scales)}
if(!require(patchwork)){install.packages("patchwork"); library(patchwork)}
if(!require(reshape)){install.packages("reshape"); library(reshape)}
if(!require(lubridate)){install.packages("lubridate"); library(lubridate)}

#Setting working directory

setwd("add here your working directory")

#check working directory

getwd()

#### Read GIOVANNI data function ##############################################
#Create custom function to read in GIOVANNI data for each site and reef

load_giovanni_time <- function(path){
  #reading .csv, skipping first 6 lines and selecting cols
  file_data <- read.csv(path, 
                        skip=6,
                        col.names = c("Date",
                                      "Temperature",
                                      "NA",
                                      "Site",
                                      "Bleached"))
  
  #formatting date 
  file_data$Date <- parse_date_time(file_data$Date, orders="ymdHMS")
  
  return(file_data)
}

#### Preparing file for reading in multiple files #############################

#remember to change file path to where you have saved your data

#creating a vector of file names in "timeseries" folder 
file.list <- list.files("./Data/timeseries/")

#creating a list of files from "timeseries" folder
file.list <- as.list(paste0("./Data/timeseries/", file.list))

####Reading in files ###########################################################

all_data <- lapply(X=file.list,
                   FUN=load_giovanni_time)


all_data <- as.data.frame(do.call(rbind, all_data))

####Inspecting Raw data ######################################################

p <- qplot(data=all_data,
           x=Date,
           y=Temperature,
           colour=Site,
           linetype=Bleached,
           geom="line")
print(p)

#check data
summary(all_data)

####Calculating temperature anomalies #########################################

all_data$Year <- year(all_data$Date)

all_data$month <- month(all_data$Date)


#Calculating monthly temperature anomalies

monthly_anomaly <- group_by(all_data,
                            month,
                            Site,
                            Bleached) %>%
  mutate(mm_Temperature=mean(Temperature), #mean monthly
         ma_Temperature=Temperature-mean(Temperature)) #monthly anomaly 

#calculating yearly temperature anomalies

annual_integrated_anomaly <- group_by(monthly_anomaly,
                                      Year,
                                      Site,
                                      Bleached) %>%
  summarise(aia_Temperature=sum(abs(ma_Temperature)))

#Inspect yearly temperature anomaly data

p <- qplot(data=annual_integrated_anomaly,
           x=Site,
           xlab="x axis label",
           y=aia_Temperature,
           ylab="y axis label",
           colour=Bleached,
           geom="boxplot")

print(p)


#save plot

ggsave("./Plots/Example_bleach_boxplot.png", p, 
       bg = "transparent", width = 17, height = 12, 
       units =  "cm", dpi = 300)


##Further analysis ############################################################


##Possible statistical analyses
fit <- lm(data = annual_integrated_anomaly,
          Bleached ~ aia_Temperature + Site + aia_Temperature:Site)
#require(car)
Anova(fit)
par(mfrow = c(2,2))
plot(fit)

#Plotting temperature over time for each site and using geom_rect to highlight year of bleaching
#code will need to be change in order to do this individually 

ggplot(annual_integrated_anomaly, 
       aes(x =Year , y = aia_Temperature , colour = Bleached, group = Bleached)) +
  geom_rect(aes(xmin =2006 , xmax = 2007, ymin =0 , ymax =25), fill = "grey",
            colour = "grey", alpha = 0.3)+
  geom_point(size = 2) + geom_line()+
    facet_wrap(~Site, nrow = 3)+
  theme_bw()

