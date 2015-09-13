library(RSQLite)
library(sqldf)
## Created by Rebeca Kirstein for Exploratory Data Analysis, Project 1

## Read data using sql just for the two day period required

power <- read.csv.sql("household_power_consumption.txt", 
                      sql = " select * from file where Date='1/2/2007' or Date='2/2/2007'",
                      header=TRUE, sep=';')

## For Plot 1 we need to plot a histogram of the frequency of Global Active Power
hist(power$Global_active_power, col = "red", xlab = "Global Active Power (kilowatts)", 
     main = "Global Active Power")

## Create a png file of my graph
dev.copy(png, "plot1.png")

## Close the PNG device
dev.off()

