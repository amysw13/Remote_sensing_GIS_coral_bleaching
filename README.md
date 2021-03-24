# Remote Sensing, GIS and Coral bleaching

## BS711 Remote sensing data manipulation exercise: Exploring remotely sensed coral reef data 

### Introduction 

Our abilities to sample sufficiently over space and time have been “revolutionized” with the availability of remotely-sensed ocean colour and development of algorithms that link ocean colour to environmental (and biological) variables of interest. Global concerns have dramatically risen in recent decades as to the nature and severity with which coral bleaching is occurring on reef systems, and research has focused intensively on patterns and processes in order to derive management solutions (e.g. Suggett & Smith 2011). 

It is now generally well understood that coral bleaching can vary in intensity and frequency as a result of temperature, high and low light, nutrient availability, eutrophication and pollution etc. (Baker et al. 2008, Pandolfi et al 2011); in part, this increase in knowledge has come from studies that have integrated broad scale remotely sensed environmental data with “on the ground” observations (Maina et al. 2008, 2011, Donner 2011, Suggett et al. 2012). This practical will introduce you to remote sensing data, and how they can be extracted from online resources and applied to address biological questions.  

### Skills 

This exercise will introduce you to remote sensing data and how this can be extracted from the web and applied to address biological questions. Specifically, you will develop skills and be assessed on your ability to present remotely-sensed spatial data in a map. You will also develop skills and be assessed on your ability to manipulate and summarize large temporal datasets. Lastly, you will develop and be assessed on your time management skills, as the assignment is due at the end of class. Whilst the integration of statistical tests is not a requirement, statistics will substantially support any claims of the existence or absence of a trend or difference. 

### Tool (software) 

This exercise can be done in the software of your choice (“software agnostic”), however, R scripts are provided on Moodle to facilitate your progression. Part A can be performed in any GIS software (ArcGis, GRASS, QGIS). Part B can be preformed in any spreadsheet (Excel, Open/Libre Office) or statistical package (SPSS).  

- Data analysis. Giovanni User Guide available at:
    - https://giovanni.gsfc.nasa.gov/giovanni/doc/UsersManualworkingdocument.docx.html 

- Useful Specific References in Talis on Moodle 

### Assessment 

Data Analysis and Interpretation report:

*1. Students will produce a 2000-word document (40%) that examines geographic and temporal variability of environmental variables in the context of mass coral bleaching events.*

  - You can work in groups, but you must each individually submit an independent and original piece of written coursework. 

  - This document will require students to:
      1. produce figures with fully supporting legends to enable the figures to be “stand alone”, and 
      2. analyse and interpret the main trends generated within these figures in the form of “Results & Discussion” style text (note this is NOT a full SPF; marking it weighted more towards results and discussion that standard SPFs). 

  - The document you submit must be presented in a neat and logical manner addressing each of the components of the exercises below. It is a legal requirement that you state on your assessed document the “Acknowledgement Policy” for the website(s) and their data. 

*Upload to Faser by Friday (week 32) 7th May 4pm 2021.*

*2. Student will then create and present a 15-min (plus questions) oral description of the research undertaken (60%) - Week 33 – May 17th at 11am.*

## Part A: Exploring temperature remote sensing data – comparing long to short term variation 

Spatial trends in sea surface temperature anomalies as it relates to a mass bleaching events. Maps can be powerful visual tools for the interpretation of spatial data. Mapping environmental conditions that can lead to bleaching can allow targeted monitoring and management responses (Liu et al., 2014). Mapping predicted environmental conditions can lead to the identifications of locations that can act as refugia for corals (Hooidonk, Maynard, & Planes, 2013) or that are made particularly vulnerable to bleaching and disease by future conditions (Maynard et al., 2015). 

 *Objectives: *

• Identify a mass-bleaching event (location and a year) from the literature.  

• For the year of the mass-bleaching event, create a world map of the mean temperature deviation from long-term climactic averages (Presentation A, below).  

• Observe if temperature was particularly high or low in locations that experienced mass bleaching. 

 • Identify potential local coral refugia. 

## SETUP 

*Part A Data and scripts for Remote sensing and GIS practical *

- Download GitHub project:
    - https://github.com/amysw13/Remote_sensing_GIS_coral_bleaching.git 
    - Click on green "code" button 
    - Choose to Download or clone project 
      - **Right click on downloaded file and extract/uncompress file (though you can navigate in the compress file on Windows, the files will not function correctly).** 

*Important presentation:* ["Mapping_temperature_anomalies"](file:///D:/Essex%20Uni/PhD/GLA%20Work/BS707/Remote_sensing_GIS_coral_bleaching/Mapping_temperature_anomalies_xar.html#1)


The folder contains all the scripts and example data files. Do not use these example data files to complete your assignment. 

- Steps for data retrieval from GIOVANNI website for a sea surface temperature average data map: 

Log in. Type “sea surface temperature” in the search bar.  

The best resolution (4km cells) could be large. Try it; if that fails go to 8km. “Sea Surface temperature at 4 micron (Night), Monthly data.” 

Choose the whole date range available, if this is too much subset to the last 10 years of data (if all fails the 2002 to 2021 data set is in the github folder). - Please attempt this step as it reflects the time taken to download large scale and temporal data.  

Make sure you get a Time Average (left hand side drop down). Note that this data is only available from 2002.  

Change the area of the world to an Equator (coral reef area) focus. This will open the lat/long so you can restrict it specifically to be a smaller area e.g., -180, -35, 180, 35. 

Press “Plot data”, then wait. It will take some time to process so go get a brew. Look at the data created. It will automatically move to a “Data Visualization” tab.  

Click on Downloads in the LEFT-hand list. Choose the “netCDF” format. 

If this fails download the 10-year averaged sea surface temperature data from the github folder. 

Now chose a year time frame that a mass bleaching occurred.  Download a map of mean temperature for the year of the mass bleaching event using the instructions from steps 3 to 8.  

Note: You will need to justify your selection of date range (calendar year, year centred on bleaching event, month, etc.). 

Load both maps into your software of choice (a partial R script is provided on github, but you are free to use the GIS software of your choice). 

Calculate the difference between the 10-year temperature average and the mean temperature for the year of the mass-bleaching event. 

Explore your data. Now go to "Mapping_temperature_anomalies.R" within Rproj (downloaded from GitHub repository) to find out how to map mean temperature deviation from long-term climactic averages.  

What is the range of temperature anomalies? Note the data contains freshwater systems that can have a far larger temperature anomaly than marine system. If needed, select the relevant data. 

Plot (map) the resulting difference, highlighting the location of the mass bleaching event(s). With positive and negative cell values in a map, a two colour gradient can better highlight differences than a single colour gradient covering the whole range. This is often encoded as blue for negative and red for positive. Steps for data analysis are provided in the “Part_A_map_difference.R” R script file.  

Additional challenges (not assessed):  

• Add to the map the distribution of coral reefs.  

• Add to the map the location and severity of bleaching events reported by http://www.reefbase.org.  

• Create a map of an alternative metric (eg. NOAA Coral Reef Watch Coral Bleaching Thermal Stress HotSpot, or anomalies for only the hottest month,…) 

Part A in Qgis is also available: Instruction 

Part A write up - Produce and present a map of temperature deviations from the long-term average with appropriate caption, which includes the key findings and interpretation of the figure. Discuss why the location of the mass-bleaching event can or cannot be identified on a map of temperature deviations from the long-term average. This discussion should include reference to the biological process of thermally induced coral bleaching, the calculation process (temporal resolution, comparison to integrated anomaly calculations, averaging across years by month) and limitation of remote sensing. Discuss the presence of potential local temperature refugia. This discussion should integrate oceanography concepts, including local predominant currents. This section should be around 600 words. 

## Part B: Spatial and temporal trends in sea surface temperature anomalies as it relates to a mass bleaching event. 

Coral-bleaching susceptibility linked to the variability of the system (Donner 2011, Oliver & Palumbi 2011) and degree of exposure to environmental anomalies (Maina et al. 2008, 2011, Donner 2011).  

Objectives:  

• Identify three mass-bleaching sites and three associated (not bleached) reference sites. 

 • Calculate yearly temperature anomalies for these sites  

• Compare sites based on these anomalies.  

• Observe temporal trends in these anomalies.  

Part B Presentation - how to load Giovani time series data of 6 different sites (3 bleached coral reef datasets and 3 reference unbleached coral reef datasets) 

Steps for data retrieval:  

1. Based on your observations in part A and in reference to the literature, select three locations that have experienced a mass bleaching event or a large temperature anomaly and to which you pair a nearby coral reef location for which mass bleaching is not reported or little to no temperature anomaly was observed (reference site). Hint see NOAA Coral Reef Watch: https://coralreefwatch.noaa.gov/index.php 

2. Note their longitude and latitude.  

3. Download time series data for 3 sites with 2 areas each - 1 bleached coral reef location and 1 reference unbleached coral reef location. E.g. Toliara (Site 1): reef bleached + reference unbleached reef. 

a.  In Select Plot, choose: Time Series: Area Averaged (Note: slightly different from Part A) 

c. Select a suitable sea surface temperature layer. Note: the smaller area can allow you or may require you to select a higher spatial resolution.  

d. Select the beginning and end date so as to capture the longest time series available. 

e. Constrain the map to a 0.5 degree longitude and 0.5 degree latitude area centred on your first selected location (Caution: does a 1 degree by 1 degree cell cover the same area everywhere on the planet?)  

f. Click “Plot Data” g. Select the Download tab and download the CSV file (you may need to right click and “Save file as…”).  

h. Open the .csv file and add a column with the header “Site” and to which you add the name of the 3 sites to all cells in the column. Add a second column with the header “Bleached” and to which you the values of TRUE or FALSE.  

i. Repeat this process until you have the data you need for all 6 timeseries. 

HINT: You can open a window for each site to simultaneously download all the data. 

HINT: Do a sanity check to make sure your data set does not include impossible values. For example, apply the function “summary” to your data. Calculation of annualized anomalies Commands for the calculation of annualized anomalies are provided in “Part_B_time_anomaly.R”. A “monthly anomaly” can be calculated as the value for any particular month (for any particular year) minus the typical average for all years. Firstly calculate the average value for each month across all years, i.e. xi2004−2014 , where i is the month January, February etc. Once you have done this, you can calculate the anomaly for each month throughout your data set. Monthly anomaly= xi − xi2004−2014 [2] 

Hint: In excel, use the $ to fix a cell or a column in an equation. Note that this will give you a means to examine the variability within years (i.e. the typical seasonal variability). In order to further examine across years, you want to calculate the total anomalous conditions (both positive and negative) that have accumulated over each year: Annual integrated anomaly = (xi − xi2004−2014 ) i=January i=December ∑ [3] However, you will have “negative” anomalies, i.e. values that are “lower than usual”. This can be equally as harmful to corals as “higher than usual” temperatures (e.g. Weeks et al. 2008). Furthermore, using the above calculations, unusually cold months would cancel out the anomaly of unusually hot months of a year. Thus the absolute value of the monthly anomaly must be taken. Monthly absolute anomaly= (xi − xi2004−2014 ) 2 = xi − xi2004−2014 [4] Which can be used in the calculation of the annual integrated absolute anomaly: Annual integrated absolute anomaly = xi − xi2004−2014 i=January i=December ∑ [5] 

Additional challenges (not assessed): 

• Calculate alternative metric based on SST (eg. NOAA Coral Reef Watch Coral Bleaching Thermal Stress HotSpot, or anomalies for only the hottest month,…)  

• Calculate alternative metric which integrates other variables (eg. Irradiance).  

Part B DAI write up: (~600 words) Is the variance in temperature different between sites (this can be based on annual temperature range or other measures of temperature variability within site)? Current work suggests that variability promotes stress tolerance (e.g. Oliver & Palumbi 2011). At which site would corals be expected to be more tolerant to temperature extremes?  This section of the DAI should be supported by three visual elements (tables and/or figures), each accompanied by a complete caption including key results and interpretation. One of the visual elements should introduce the selected sites. All statistical statements should include a measure of the difference or trend with relevant units in addition to standard reporting of statistical test. 

Discuss a management strategy that could harness this information. (~600 words) Discuss why years of mass bleaching can or cannot be detected in temperature anomaly time series. This discussion should include limitations of the calculation approach used, reference to alternative methods of detecting temperature conditions likely to cause bleaching and the possibility of including other remotely sensed variables in the calculation of bleaching risk. Discuss the cause of temporal trends in sea-surface temperature anomalies at your observed sites, why these trends are or are not consistent across sites, or why no trend can be detected. This discussion should include reference to global climatic events and global change.  

Handed in assessment – 2000-word max 

Your write up is essentially split into 3 sections: 1. a 10-year averaged to one year / month averaged temperature comparison (DAI) to set the scene (~600 words), 2. A DAI section focused on temperature differences between bleached and unbleached sites (~600 words). 3. a discussion of how management strategies may use such information and its strengths and weaknesses (~600 words). 

Upload to Faser by Friday (week 32) 7th May 4pm 2021. 

Acknowledgements: 

This practical is based on a practical initially developed by David Suggett and Etienne Low-Décarie. 

References 

Baker, A. C., Glynn, P. W., & Riegl, B. (2008). Climate change and coral reef bleaching: An ecological assessment of long-term impacts, recovery trends and future outlook. Estuarine, Coastal and Shelf Science, 80(4), 435–471. doi:10.1016/j.ecss.2008.09.003 

Donner, S. D. (2011). An evaluation of the effect of recent temperature variability on the prediction of coral bleaching events. Ecological Applications, 21(5), 1718– 1730. doi:10.1890/10-0107.1  

Hooidonk, R. Van, Maynard, J. A., & Planes, S. (2013). Temporary refugia for coral reefs in a warming world. Nature Climate Change, 3(5), 508–511. doi:10.1038/nclimate1829  

Liu, G., Heron, S., Eakin, C., Muller-Karger, F., Vega-Rodriguez, M., Guild, L., … Lynds, S. (2014). Reef-Scale Thermal Stress Monitoring of Coral Ecosystems: New 5-km Global Products from NOAA Coral Reef Watch. Remote Sensing, 6(11), 11579–11606. doi:10.3390/rs61111579  

Maina, J., McClanahan, T. R., Venus, V., Ateweberhan, M., & Madin, J. (2011). Global Gradients of Coral Exposure to Environmental Stresses and Implications for Local Management. PLoS ONE, 6(8), e23064. doi:10.1371/journal.pone.0023064  

Maina, J., Venus, V., McClanahan, T. R., & Ateweberhan, M. (2008). Modelling susceptibility of coral reefs to environmental stress using remote sensing data and GIS models. Ecological Modelling, 212(3-4), 180–199. doi:10.1016/j.ecolmodel.2007.10.033 

 Maynard, J., van Hooidonk, R., Eakin, C. M., Puotinen, M., Garren, M., Williams, G., … Harvell, C. D. (2015). Projections of climate conditions that increase coral disease susceptibility and pathogen abundance and virulence. Nature Climate Change, 5(7), 688–694. doi:10.1038/nclimate2625  

Pandolfi, J. M. (2003). Global Trajectories of the Long-Term Decline of Coral Reef Ecosystems. Science, 301(5635), 955–958. doi:10.1126/science.1085706 
=======
>>>>>>> 78bc8dfc46e72113079d47375b9ad129af18a8f8
