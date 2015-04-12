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

#subset out the dates of interest and select the columns
plot4_ss<-subset(energyData, Date>="2007-02-01" & Date<="2007-02-02",select=c(Date,Time,Global_active_power,Sub_metering_1,Sub_metering_2,Sub_metering_3,Voltage, Global_reactive_power))

# concatenate Date and Time and convert
plot4_ss$Date<-(strptime(paste(plot2_ss$Date, plot2_ss$Time, sep=" "),format="%Y-%m-%d %H:%M:%S"))

# create a PNG file
png(file = "plot4.png",width=480,height=480)

#set up to plot 2x2
par(mfrow = c(2, 2), mar = c(4, 4, 2, 1), oma = c(0, 0, 2, 0))

#construct the 4 plots
with(plot4_ss, {
  plot(as.POSIXct(Date),Global_active_power,
     type="n",
     xlab="",
     ylab="Global Active Power")

# draw the line graph
lines(as.POSIXct(Date),Global_active_power,type="l")

plot(as.POSIXct(Date),Voltage,
     type="n",
     xlab="datetime",
     ylab="Voltage")

# draw the line graph
lines(as.POSIXct(Date),Voltage,type="l")

plot(as.POSIXct(Date),Sub_metering_1,
     type="n",
     xlab="",
     ylab="Energy sub metering",
     )

# draw the line graph for sub_metering1
lines(as.POSIXct(Date),Sub_metering_1,type="l",col="black")

# draw the line graph for sub_metering2
lines(as.POSIXct(Date),Sub_metering_2,type="l",col="red")

# draw the line graph for sub_metering3
lines(as.POSIXct(Date),Sub_metering_3,type="l",col="blue")

legend("topright", col = c("black","red", "blue"), 
       legend = names(plot4_ss[,4:6]), lty=1,
       bty="n",seg.len=1)

plot(as.POSIXct(Date),Global_reactive_power,
     type="n",
     xlab="datetime",
     ylab="Global_reactive_power")

# draw the line graph
lines(as.POSIXct(Date),Global_reactive_power,type="l")

})

dev.off() ## Don't forget to close the PNG device!

