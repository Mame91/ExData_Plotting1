## Uncomment the followings to download packages needed
#install.packages("sqldf")
#install.packages("dplyr")

## Packages needed to execute the script
library(sqldf)
library(dplyr)

## Reading csv file
data <- read.csv.sql("household_power_consumption.txt", sql = "select * from file where Date = '2/2/2007' or Date = '1/2/2007'",sep = ";", header=TRUE)

## Creating png graphic device for the plot
png(file = "plot1.png", width = 480, height = 480)

## Generating the histogram of Global Active Power
hist(data$Global_active_power, xlab="Global Active Power (kilowatts)", col="red", main="Global Active Power")

## Turning off graphic device
dev.off()