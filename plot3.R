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

## Creating png graphic device
png(file = "plot3.png", width = 480, height = 480)

## Generating the plot
plot(data$DateTime, as.numeric(data$Sub_metering_1), ylab="Energy sub metering", type="l")

## Adding Sub_metering_2 to the plot
points(data$DateTime, as.numeric(data$Sub_metering_2), col="red", type="l")

## Adding sub_metering_3 to the plot
points(data$DateTime, as.numeric(data$Sub_metering_3), col="blue", type="l")

## Generating legend
legend("topright", lty = c(1, 1, 1), col=c("black", "red", "blue"), legend=c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3"))

## Turning off graphic device
dev.off()