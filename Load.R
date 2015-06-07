## Code for reading the data 
# so that the plot can be fully reproduced

## create data directory to store downloaded file
if(!file.exists("data")){
  dir.create("data")
}

## download file -
## below solution is from : http://rpubs.com/thoughtfulbloke/downloadtips
require(downloader)
url <- "https://d396qusza40orc.cloudfront.net/exdata%2Fdata%2Fhousehold_power_consumption.zip"
download(url, destfile="data/household_power_consumption.zip")

## unzip file
unzip("data/household_power_consumption.zip", exdir = "data/")

## load specific number of rows- specified by an sql statement
library(sqldf)

# read the data from dates 2007-02-01 and 2007-02-02
# missing values are coded as '?' on the dataset
hpc <- read.csv2.sql(file = "data/household_power_consumption.txt", 
                     sql = "select * from file where Date = '1/2/2007' 
                     or Date = '2/2/2007'", 
                     header =TRUE, row.names = NULL,
                     colClasses = "character", na.strings = "?")

## convert the Date and Time variables to Date/Time classes
hpc$Date <- as.Date(hpc$Date, format = "%d/%m/%Y") #Convert date into YYYY-MM-DD format
hpc$Date_Time <- paste(hpc$Date, hpc$Time) # Paste Date and Time columns
hpc <- hpc[, -(1:2)] # remove the separate Date and Time columns

library(lubridate)
hpc$Date_Time <- ymd_hms(hpc$Date_Time) #Convert column to Date class

## Pattern Matching and Replacement \r on hpc$Sub_metering_3
hpc$Sub_metering_3 <- sub(pattern = "\r", replacement = "",
                          x = hpc$Sub_metering_3)
