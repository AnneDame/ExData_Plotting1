## Course Project

## Getting the data

setwd("C:/documents/s626191/Documents/Bibliothèque/Formation Coursera/Exploratory Data Analysis/Week 1/Course Project")
data <- read.table(file='household_power_consumption.txt',sep=";",dec=".",as.is=c(1:9), header=TRUE)

## Keeping the Dates 01/02/2007 and 02/02/2007

data$Date <- as.Date(data$Date,format="%d/%m/%Y")

data2 <- data[which(data$Date == "2007-02-01" | data$Date == "2007-02-02"),]

## Pasting the date and the time

data3 <- data.frame(DayTime=paste(data2$Date,data2$Time),data2)

## Changing the format of the different variables

data3$DayTime <- strptime(data3$DayTime,format="%Y-%m-%d %H:%M:%S")
data3$Global_active_power <- as.numeric(data3$Global_active_power)
data3$Global_reactive_power <- as.numeric(data3$Global_reactive_power)
data3$Sub_metering_1 <- as.numeric(data3$Sub_metering_1)
data3$Sub_metering_2 <- as.numeric(data3$Sub_metering_2)
data3$Sub_metering_3 <- as.numeric(data3$Sub_metering_3)
data3$Voltage <- as.numeric(data3$Voltage)

##plot 1

png(file="plot1.png")
hist(data3$Global_active_power,col="red",main="Global Active Power",xlab="Global Active Power (kilowatts)")
dev.off()