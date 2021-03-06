### Exploratory Data Analysis
###
### Course Project 1 Plot 3
###
###

###note unzipped data file "household_power_consumption.txt"
### should be in your working directory

x<- read.table ("household_power_consumption.txt", sep=";", header=TRUE, na.strings="?") ##read data

x$ydate<-strptime(x$Date, "%d/%m/%Y") ##create new date variable from character variable Date - don't need time to subset


z<-(x$ydate == "2007-02-01" |x$ydate== "2007-02-02") ##logical variable to subset for two required days

x<-x[z,] ##x now has the data for Feb 1 2007 and Feb 2 2007

rm(z) ##remove z

x$datetimech<-paste(x$Date,x$Time) ## building date and time variable - character first

x$newdatetime<- strptime(x$datetimech,"%d/%m/%Y %H:%M:%S") ## combined date and time "POSIXlt" "POSIXt" variable

##Plot 3

png(filename="plot3.png", widt=480, height=480, units="px")

        plot (x$newdatetime, x$Sub_metering_1, type="l", xlab="", ylab="Energy sub metering")

        lines (x$newdatetime, x$Sub_metering_2, col="red")
        lines (x$newdatetime, x$Sub_metering_3, col="blue")
legend("topright", lty = 1, col = c("black","red","blue"), legend = c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3"))

dev.off()



