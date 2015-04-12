#
# Exploratory Data Analysis
# Project 1
# 2015.04.10
#
setwd("C://Users//jnewell.BI//Documents//Coursera//Exploratory Data Analysis//Project1")
# Date;Time;Global_active_power;Global_reactive_power;Voltage;Global_intensity;Sub_metering_1;Sub_metering_2;Sub_metering_3
# 1/2/2007;00:00:00;0.326;0.128;243.150;1.400;0.000;0.000;0.000
energyData <- read.table("data/household_power_consumption.txt", 
                      header  = TRUE,
                       sep = ";",
                       colClasses = c("character", "character","numeric","numeric","numeric","numeric","numeric","numeric"),
                      col.names = c("Date","Time","Global_active_power","Global_reactive_power","Voltage","Global_intensity","Sub_metering_1","Sub_metering_2","Sub_metering_3"),
                      na.strings="?"
)
#convert the Dates
energyData[,1]<-as.Date(energyData[,1],format="%d/%m/%Y")

#subset out the dates of interest
plot1_ss<-subset(energyData, Date>="2007-02-01" & Date<="2007-02-02")

png(file = "plot1.png",width=480,height=480)

#construct plot 1 adding the title, color and x and y axis labels
hist(plot1_ss$Global_active_power, 
     main="Global Active Power",
     col="red", 
     xlab="Global active power (kilowatts)",
     ylab="Frequency")
dev.off() ## Don't forget to close the PNG device!
