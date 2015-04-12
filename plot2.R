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
plot2_ss<-subset(energyData, Date>="2007-02-01" & Date<="2007-02-02",select=c(Date,Time,Global_active_power))

# concatenate Date and Time and convert
plot2_ss$Date<-(strptime(paste(plot2_ss$Date, plot2_ss$Time, sep=" "),format="%Y-%m-%d %H:%M:%S"))

# create a PNG file
png(file = "plot2.png",width=480,height=480)

#construct plot 2 adding the x and y axis labels, but do not plot
plot(as.POSIXct(plot2_ss$Date),plot2_ss$Global_active_power,
     type="n",
     xlab="",
     ylab="Global active power (kilowatts)")

# draw the line graph
lines(as.POSIXct(plot2_ss$Date),plot2_ss$Global_active_power,type="l")

dev.off() ## Don't forget to close the PNG device!
