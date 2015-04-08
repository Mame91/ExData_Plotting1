## Uncomment the followings to download packages needed
#install.packages("sqldf")
#install.packages("dplyr")

## Packages needed to execute the script
library(sqldf)
library(dplyr)

## Reading csv file
data <- read.csv.sql("household_power_consumption.txt", sql = "select * from file where Date = '2/2/2007' or Date = '1/2/2007'",sep = ";", header=TRUE)

## Generating a new column of type date
data$DateTime <- strptime(paste(data$Date, data$Time), "%d/%m/%Y %H:%M:%S")

## Creating png graphic device for the plot
png(file = "plot2.png", width = 480, height = 480)

## Generating plot
with(data, plot(DateTime, as.numeric(Global_active_power), ylab="Global Active Power (kilowatts)", type="l"))

## Turning off graphic device
dev.off()