# Patrick L. Francis
# me@GoodFriar.com
#
# Script: fetcher.R
#
# Fetch data for a desired location and date range using the rnoaa package
#

library(rnoaa)
options(noaakey = "zhXCQGRddBdxEZzrGVZBQbLdeLkCbQVX")

#
# See what data is available for a particular station
# A good place to search for station IDs is the NCDC
# https://www.ncdc.noaa.gov/cdo-web/search
#

dataSOURCE<- "GHCND:"
stationID <- "USW00023183" # Enter your ID here

# Retrieve Metadata
# Reference: https://www.rdocumentation.org/packages/rnoaa/versions/0.8.4/topics/ncdc_stations

ncdc_stations(stationid=paste(dataSOURCE, stationID, sep=""))

# Fetch Desired Data inserting MetaInfo from above
# enter the minimum date provided from above
minDATE <- "1933-06-01"

stationDATA <- meteo_tidy_ghcnd(stationID, keep_flags = FALSE, var = "all",
                                date_min = minDATE, date_max = NULL)

# Save the dataframe as an R object
directory <- "./data/"
rEXT <- ".Rdata"

save(stationDATA, file = paste(directory, stationID, rEXT, sep =""))

# Export the dataframe as a csv file
csvEXT <- ".csv"

write.csv(stationDATA, file = paste(directory, stationID, csvEXT, sep =""))


#
#
#