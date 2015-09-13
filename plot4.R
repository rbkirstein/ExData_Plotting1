library(RSQLite)
library(sqldf)
library(dplyr)
## Created by Rebeca Kirstein for Exploratory Data Analysis, Project 1

## Read data using sql just for the two day period required

power <- read.csv.sql("household_power_consumption.txt", 
                      sql = " select * from file where Date='1/2/2007' or Date='2/2/2007'",
                      header=TRUE, sep=';')
## Convert Date char to Date variable
power$Date <- as.Date(power$Date , format = "%d/%m/%Y")
str(power)
## add new DateTime variable
DateTime <- paste(power2$Date, power2$Time)
DateTime <- strptime(DateTime, format = "%Y-%m-%d %H:%M:%S")
head(DateTime)
class(DateTime)
DataTime <- transform(DataTime)

## For Plot 4 we need to combine plot2, plot 3, a date/time (x) against global reactive power (y) and voltage by dateTime

par(mfrow = c(2,2))
## 1
with(power,plot( c(DateTime), c(Global_active_power),type="l",col=c("Black"),
                 ylab = "Global Active Power (kilowatts)"), xlab=" ")
## 2
with(power,plot( c(DateTime), c(Voltage),type="l",col=c("Black"),
                 ylab = "Voltage"), xlab=" ")
## 3
with(power,plot(c(DateTime),c(Sub_metering_1),type="l",col=c("Black"),ylab = "Energy sub metering"))
lines(DateTime, power$Sub_metering_2, col = "red")
lines(DateTime, power$Sub_metering_3, col = "blue")
##legend("topright",pch = 20, col = c("black", "red", "blue"), 
#       legend = c("Sub_metering_1","Sub_metering_2","Sub_metering_3"),adj = c(0, 0.5))
## 4
with(power,plot( c(DateTime), c(Global_reactive_power),type="l",col=c("Black"),
                 ylab = "Voltage"), xlab=" ")

## Create a png file of my graph
dev.copy(png, "plot4.png")

## Close the PNG device
dev.off()
