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

##plot 4

png(file="plot4.png")
par(mfrow=c(2,2))

with(data3,plot(DayTime, Global_active_power,type='l',ylab="Global Active Power",xlab=""))

with(data3,plot(DayTime, Voltage,type='l',ylab="Voltage",xlab="datetime"))

with(data3,plot(DayTime,Sub_metering_1,type="l",ylab="Energy sub metering",xlab=""))
with(data3,lines(DayTime,Sub_metering_2,type='l',col="red"))
with(data3,lines(DayTime,Sub_metering_3,type='l',col="blue"))
legend("topright",legend=c("Sub_metering_1","Sub_metering_2","Sub_metering_3"),lty=c(1,1,1),col=c("black","red","blue"),cex=0.7,bty="n")

with(data3,plot(DayTime,Global_reactive_power,type='l',xlab="datetime"))

dev.off()