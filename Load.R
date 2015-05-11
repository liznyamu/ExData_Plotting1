#load specific number of rows
library(sqldf)

#create data directory to store downloaded file
if(!file.exists("data")){
        dir.create("data")
}

#download file -
# below solution is from : http://rpubs.com/thoughtfulbloke/downloadtips
require(downloader)
url <- "https://d396qusza40orc.cloudfront.net/exdata%2Fdata%2Fhousehold_power_consumption.zip"
download(url, destfile="data/household_power_consumption.zip")

#unzip file
unzip("data/household_power_consumption.zip", exdir = "data/")

hpc <- read.csv2.sql(file = "data/household_power_consumption.txt", 
                     sql = "select * from file where Date = '1/2/2007' 
                                or Date = '2/2/2007'", 
                     header =TRUE, row.names = NULL,
                     colClasses = "character")

#convert date format
hpc$Date <- as.Date(hpc$Date, format = "%d/%m/%Y")
hpc$Date_Time <- paste(hpc$Date, hpc$Time)

library(lubridate)

hpc$Date_Time <- ymd_hms(hpc$Date_Time)
hpc <- hpc[, -(1:2)] # remove the Date and Time columns

#Pattern Matching and Replacement \r on hpc$Sub_metering_3
hpc$Sub_metering_3 <- sub(pattern = "\r", replacement = "",
                          x = hpc$Sub_metering_3)
