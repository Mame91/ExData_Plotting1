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
png(file = "plot4.png", width = 480, height = 480)

par(mfrow=c(2,2))
with(data,{
        plot(DateTime, as.numeric(Global_active_power), xlab="", ylab="Global Active Power (kilowatts)", type="l")        
        plot(DateTime, as.numeric(Voltage), type="l",  xlab="datetime", ylab="Voltage")				
        plot(DateTime, as.numeric(Sub_metering_1), xlab="", ylab="Energy sub metering", type="l")		
        points(DateTime, as.numeric(Sub_metering_2), col="red", type="l")
        points(DateTime, as.numeric(Sub_metering_3), col="blue", type="l")
        legend("topright", lty = c(1, 1, 1), bty = "n", col=c("black", "red", "blue"), legend=c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3"))
        plot(DateTime, as.numeric(Global_reactive_power), type="l",  xlab="datetime", ylab="Global_reactive_power")})

## Turning off graphic device
dev.off()  