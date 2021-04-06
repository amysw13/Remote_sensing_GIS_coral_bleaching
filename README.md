
<!-- README.md is generated from README.Rmd. Please edit that file -->

# Remote Sensing, GIS and Coral bleaching

## BS711 Remote sensing data manipulation exercise: Exploring remotely sensed coral reef data

### Introduction

Our abilities to sample sufficiently over space and time have been
“revolutionized” with the availability of remotely-sensed ocean colour
and development of algorithms that link ocean colour to environmental
(and biological) variables of interest. Global concerns have
dramatically risen in recent decades as to the nature and severity with
which coral bleaching is occurring on reef systems, and research has
focused intensively on patterns and processes in order to derive
management solutions (e.g. Suggett & Smith 2011).

It is now generally well understood that coral bleaching can vary in
intensity and frequency as a result of temperature, high and low light,
nutrient availability, eutrophication and pollution etc. (Baker et
al. 2008, Pandolfi et al 2011); in part, this increase in knowledge has
come from studies that have integrated broad scale remotely sensed
environmental data with “on the ground” observations (Maina et al. 2008,
2011, Donner 2011, Suggett et al. 2012). This practical will introduce
you to remote sensing data, and how they can be extracted from online
resources and applied to address biological questions.

### Skills

This exercise will introduce you to remote sensing data and how this can
be extracted from the web and applied to address biological questions.
Specifically, you will develop skills and be assessed on your ability to
present remotely-sensed spatial data in a map. You will also develop
skills and be assessed on your ability to manipulate and summarize large
temporal datasets. Lastly, you will develop and be assessed on your time
management skills, whilst working with large data sets. Whilst the
integration of statistical tests is not a requirement, statistics will
substantially support any claims of the existence or absence of a trend
or difference.

### Tool (software)

This exercise can be done in the software of your choice (“software
agnostic”), however, R scripts are provided on within the GitHub
repository in the “R” folder to facilitate your progression. Part A can
be performed in any GIS software (ArcGis, GRASS, QGIS). Part B can be
preformed in any spreadsheet (Excel, Open/Libre Office) or statistical
package (SPSS).

-   Data analysis. Giovanni User Guide available at:
    -   <https://giovanni.gsfc.nasa.gov/giovanni/doc/UsersManualworkingdocument.docx.html>
-   Useful Specific References in Talis on Moodle

### Assessment

Data Analysis and Interpretation report:

**1. Students will produce a 2000-word document (40%) that examines
geographic and temporal variability of environmental variables in the
context of mass coral bleaching events.**

-   You can work in groups, but you must each individually submit an
    independent and original piece of written coursework.

-   This document will require students to:

    1.  Produce figures with fully supporting legends to enable the
        figures to be “stand alone”, and
    2.  Analyse and interpret the main trends generated within these
        figures in the form of “Results & Discussion” style text (note
        this is NOT a full SPF; marking it weighted more towards results
        and discussion than standard SPFs).

-   The document you submit must be presented in a neat and logical
    manner addressing each of the components of the exercises below.

-   It is a legal requirement that you state on your assessed document
    the “Acknowledgement Policy” for the website(s) and their data.

Note: There is more information on data analysis and interpretation
write up under parts A and B.

**Upload to FASER by Friday (week 32) 7th May 4pm 2021.**

**2. Student will then create and present a 15-min (plus questions) oral
description of the research undertaken (60%) - Week 33 – May 17th at
11am.**

## Setup

**Data and scripts for practical**

-   Download GitHub project:
    -   <https://github.com/amysw13/Remote_sensing_GIS_coral_bleaching.git>
    -   Click on green “code” button
    -   Choose to Download or clone project
        -   **Right click on downloaded file and extract/uncompress file
            (though you can navigate in the compress file on Windows,
            the files will not function correctly).**
        -   The folder contains all the scripts and example data files.
            **Do not use these example data files to complete your
            assignment.**

**Important presentations:**

1.  Presentation A:
    [Mapping\_temperature\_anomalies](https://amysw13.github.io/Remote_sensing_GIS_coral_bleaching/Mapping_temperature_anomalies_xar.html#1)

2.  Presentation B:
    [Bleaching\_analysis](https://amysw13.github.io/Remote_sensing_GIS_coral_bleaching/Bleaching_analysis_xar.html#1)

## Part A: Exploring sea surface temperature remote sensing data – comparing long to short term variation

Spatial trends in sea surface temperature anomalies as it relates to a
mass bleaching events. Maps can be powerful visual tools for the
interpretation of spatial data. Mapping environmental conditions that
can lead to bleaching can allow targeted monitoring and management
responses (Liu et al., 2014). Mapping predicted environmental conditions
can lead to the identifications of locations that can act as refugia for
corals (Hooidonk, Maynard, & Planes, 2013) or that are made particularly
vulnerable to bleaching and disease by future conditions (Maynard et
al., 2015).

**Objectives:**

• Identify a mass-bleaching event (location and a year) from the
literature.

• For the year of the mass-bleaching event, create a world map of the
mean temperature deviation from long-term climactic averages
(Presentation A).

• Observe if temperature was particularly high or low in locations that
experienced mass bleaching.

• Identify potential local coral refugia.

### Downloading data from GIOVANNI

Go to the [GIOVANNI webpage](https://giovanni.gsfc.nasa.gov/giovanni/)

**Data download for Part A**

Long-term averaged sea surface temperature

1.  Create a register an &gt; log in

2.  Under “Select Plot”, select “Time Averaged Map”

3.  Type “sea surface temperature” in the search bar.

4.  A list of sea surface temperature variables will appear. Select “Sea
    Surface temperature at 4 micron (Night), Monthly data.” *Note: The
    best resolution (4km cells) could be large. Try it; if that fails go
    to 9km.*

5.  Choose the whole date range available, if this is too much subset to
    the last 10 years of data (if all fails the 2002 to 2021 data set is
    in the github folder). **Please attempt this step as it reflects the
    time taken to download large scale and temporal data.**

6.  Change the area of the world to an Equator (coral reef area) focus
    in “Select Region”.

-   e.g., -180, -35, 180, 35

1.  Press “Plot data”, then wait. It will take some time to process so
    go get a brew. Look at the data created. It will automatically move
    to a “Data Visualization” tab.

2.  Click on Downloads in the **left-hand list**. Choose the “netCDF”
    format.

*If this all fails use the long term averaged sea surface temperature
data in the data folder.*

Year averaged sea surface temperature

-   Now chose a year time frame that a mass bleaching occurred.

-   Download a map of mean temperature for the year of the mass
    bleaching event using the instructions from steps 3 to 8 above.

**Note: You will need to justify your selection of date range (calendar
year, year centred on bleaching event, month, etc.).**

### Data analyses recommendations

**Part A**

-   Load both datasets into your software of choice (a partial R script
    is provided on github, but you are free to use the GIS software of
    your choice).

-   Calculate the difference between the 10-year temperature average (or
    time-frame you have downloaded) and the mean temperature for the
    year of the mass-bleaching event.

-   Explore your data:

    -   What is the range of temperature anomalies? Note the data
        contains freshwater systems that can have a far larger
        temperature anomaly than marine system. If needed, select the
        relevant data.

-   Plot (map) the resulting difference, highlighting the location of
    the mass bleaching event(s). With positive and negative cell values
    in a map, a two colour gradient can better highlight differences
    than a single colour gradient covering the whole range. This is
    often encoded as blue for negative and red for positive, but you may
    want to consider colour palettes that accommodate for
    colour-blindness. Steps for data analysis are provided in the
    “Mapping\_temperature\_anomalies.R” R script file.

*Additional challenges (not assessed):*

• Add to the map the distribution of coral reefs.

• Add to the map the location and severity of bleaching events reported
by <http://www.reefbase.org>.

• Create a map of an alternative metric (eg. NOAA Coral Reef Watch Coral
Bleaching Thermal Stress HotSpot, or anomalies for only the hottest
month,…)

**Extra resources:**

These additional resources will guide you through using NetCDF files in
QGIS and ArcGIS should you wish to use them over R.

Part A in QGIS:
[Instructions](http://www.ggiuliani.ch/download/netcdf_qgis_GG.pdf)

Part A in ArcGIS:
[Instructions](https://help.arcgis.com/en/arcgisdesktop/10.0/pdf/netcdf-tutorial.pdf)

### Part A write up:

Produce and present a map of temperature deviations from the long-term
average with appropriate caption, which includes the key findings and
interpretation of the figure. Discuss why the location of the
mass-bleaching event can or cannot be identified on a map of temperature
deviations from the long-term average. This discussion should include
reference to the biological process of thermally induced coral
bleaching, the calculation process (temporal resolution, comparison to
integrated anomaly calculations, averaging across years by month) and
limitation of remote sensing. Discuss the presence of potential local
temperature refugia. This discussion should integrate oceanography
concepts, including local predominant currents. This section should be
around 600 words.

## Part B: Spatial and temporal trends in sea surface temperature anomalies as it relates to a mass bleaching event.

Coral-bleaching susceptibility linked to the variability of the system
(Donner 2011, Oliver & Palumbi 2011) and degree of exposure to
environmental anomalies (Maina et al.,2008, 2011, Donner 2011).

**Objectives:**

• Identify three mass-bleaching sites and three associated (not
bleached) reference sites.

• Calculate yearly temperature anomalies for these sites

• Compare sites based on these anomalies.

• Observe temporal trends in these anomalies.

### Steps for data retrieval:

1.  Based on your observations in part A and in reference to the
    literature, select three locations that have experienced a mass
    bleaching event or a large temperature anomaly and to which you pair
    a nearby coral reef location for which mass bleaching is not
    reported or little to no temperature anomaly was observed (reference
    site). Hint: see NOAA Coral Reef Watch:
    <https://coralreefwatch.noaa.gov/index.php>

2.  Note their longitude and latitude.

3.  Download time series data for 3 sites with 2 areas each - 1 bleached
    coral reef location and 1 reference unbleached coral reef location.
    E.g. Toliara (Site 1): reef bleached + reference unbleached reef.

4.  In Select Plot, choose: Time Series: Area Averaged (Note: slightly
    different from Part A)

5.  Select a suitable sea surface temperature layer. Note: the smaller
    area can allow you or may require you to select a higher spatial
    resolution.

6.  Select the beginning and end date so as to capture the longest time
    series available.

7.  Constrain the map to a 0.5 degree longitude and 0.5 degree latitude
    area centred on your first selected location (Caution: does a 1
    degree by 1 degree cell cover the same area everywhere on the
    planet?)

8.  Click “Plot Data” g. Select the Download tab and download the CSV
    file (you may need to right click and “Save file as…”).

9.  Open the .csv file and add a column with the header “Site” and to
    which you add the name of the 3 sites to all cells in the column.
    Add a second column with the header “Bleached” and to which you the
    values of TRUE or FALSE.

10. Repeat this process until you have the data you need for all 6
    timeseries.

**HINT: You can open a window for each site to simultaneously download
all the data.**

*Additional challenges (not assessed):*

• Calculate alternative metric based on SST (eg. NOAA Coral Reef Watch
Coral Bleaching Thermal Stress HotSpot, or anomalies for only the
hottest month,…)

• Calculate alternative metric which integrates other variables (eg.
Irradiance).

### Part B DAI write up:

(\~600 words) Is the variance in temperature different between sites
(this can be based on annual temperature range or other measures of
temperature variability within site)? Current work suggests that
variability promotes stress tolerance (e.g. Oliver & Palumbi 2011). At
which site would corals be expected to be more tolerant to temperature
extremes? This section of the DAI should be supported by three visual
elements (tables and/or figures), each accompanied by a complete caption
including key results and interpretation. One of the visual elements
should introduce the selected sites. All statistical statements should
include a measure of the difference or trend with relevant units in
addition to standard reporting of statistical test.

Discuss a management strategy that could harness this information.
(\~600 words) Discuss why years of mass bleaching can or cannot be
detected in temperature anomaly time series. This discussion should
include limitations of the calculation approach used, reference to
alternative methods of detecting temperature conditions likely to cause
bleaching and the possibility of including other remotely sensed
variables in the calculation of bleaching risk. Discuss the cause of
temporal trends in sea-surface temperature anomalies at your observed
sites, why these trends are or are not consistent across sites, or why
no trend can be detected. This discussion should include reference to
global climatic events and global change.

Handed in assessment – 2000-word max

Your write up is essentially split into 3 sections:

1.  a 10-year averaged to one year / month averaged temperature
    comparison (DAI) to set the scene (\~600 words),
2.  A DAI section focused on temperature differences between bleached
    and unbleached sites (\~600 words),
3.  a discussion of how management strategies may use such information
    and its strengths and weaknesses (\~600 words).

**Upload to Faser by Friday (week 32) 7th May 4pm 2021.**

## Acknowledgements:

This practical is based on a practical initially developed by Dr David
Suggett and Dr Etienne Low-Décarie.

## Further reading

Foo, S. A., & Asner, G. P. (2019). Scaling up coral reef restoration
using remote sensing technology. Frontiers in Marine Science, 6(MAR),
1–8. <https://doi.org/10.3389/fmars.2019.00079>

Hedley, J. D., Roelfsema, C. M., Chollett, I., Harborne, A. R., Heron,
S. F., Weeks, S. J., … Mumby, P. J. (2016). Remote sensing of coral
reefs for monitoring and management: A review. Remote Sensing, 8(2).
<https://doi.org/10.3390/rs8020118>

Hickey, S. M., Radford, B., Roelfsema, C. M., Joyce, K. E., Wilson, S.
K., Marrable, D., … Murray, K. (2020). Between a Reef and a Hard Place:
Capacity to Map the Next Coral Reef Catastrophe. Frontiers in Marine
Science, 7(September), 1–9. <https://doi.org/10.3389/fmars.2020.544290>

Mason, R. A. B., Skirving, W. J., & Dove, S. G. (2020). Integrating
physiology with remote sensing to advance the prediction of coral
bleaching events. Remote Sensing of Environment, 246(February), 111794.
<https://doi.org/10.1016/j.rse.2020.111794>

Parsons, M., Bratanov, D., Gaston, K. J., & Gonzalez, F. (2018). UAVs,
hyperspectral remote sensing, and machine learning revolutionizing reef
monitoring. Sensors (Switzerland), 18(7), 1–20.
<https://doi.org/10.3390/s18072026>

Putra, R. D., Suhana, M. P., Kurniawn, D., Abrar, M., Siringoringo, R.
M., Sari, N. W. P., … Suryanti, A. (2019). Detection of reef scale
thermal stress with Aqua and Terra MODIS satellite for coral bleaching
phenomena. AIP Conference Proceedings, 2094(April).
<https://doi.org/10.1063/1.5097493>

Safaie, A., Silbiger, N. J., McClanahan, T. R., Pawlak, G., Barshis, D.
J., Hench, J. L., … Davis, K. A. (2018). High frequency temperature
variability reduces the risk of coral bleaching. Nature Communications,
9(1), 1–12. <https://doi.org/10.1038/s41467-018-04074-2>

Van Hooidonk, R., Maynard, J. A., & Planes, S. (2013). Temporary refugia
for coral reefs in a warming world. Nature Climate Change, 3(5),
508–511. <https://doi.org/10.1038/nclimate1829>

Van Hooidonk, Ruben, Maynard, J. A., Manzello, D., & Planes, S. (2014).
Opposite latitudinal gradients in projected ocean acidification and
bleaching impacts on coral reefs. Global Change Biology, 20(1), 103–112.
<https://doi.org/10.1111/gcb.12394>
