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

## For Plot 2 we need to plot Global Active Power by day
with(power,plot( c(DateTime), c(Global_active_power),type="l",col=c("Black"),
                 ylab = "Global Active Power (kilowatts)"), xlab=" ")


## Create a png file of my graph
dev.copy(png, "plot2.png")

## Close the PNG device
dev.off()

