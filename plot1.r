### Exploratory Data Analysis
###
### Course Project 1 Plot 1
###
###

###note unzipped data file "household_power_consumption.txt"
### should be in your working directory


x<- read.table ("household_power_consumption.txt", sep=";", header=TRUE, na.strings="?") ##read data

x$ydate<-strptime(x$Date, "%d/%m/%Y") ##create new date variable from character variable Date - don't need time

z<-(x$ydate == "2007-02-01" |x$ydate== "2007-02-02") ##logical variable to subset for two required days

x<-x[z,] ##x now has the data for Feb 1 2007 and Feb 2 2007

rm(z) ##remove z

##Plot 1

png(filename="plot1.png", widt=480, height=480, units="px")

hist (x$Global_active_power,col="red", main="Global Active Power",xlab="Global Active Power (kilowatts)", ylab="Frequency")

dev.off()
