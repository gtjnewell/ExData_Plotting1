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
plot3_ss<-subset(energyData, Date>="2007-02-01" & Date<="2007-02-02",
                 select=c(Date,Time,Sub_metering_1,Sub_metering_2,Sub_metering_3))

# concatenate Date and Time and convert
plot3_ss$Date<-(strptime(paste(plot3_ss$Date, plot3_ss$Time, sep=" "),format="%Y-%m-%d %H:%M:%S"))

# create a PNG file
png(file = "plot3.png",width=480,height=480)

#construct plot 3 adding the x and y axis labels, but do not plot
plot(as.POSIXct(plot3_ss$Date),plot3_ss$Sub_metering_1,
     type="n",
     xlab="",
     ylab="Energy sub metering",
     )

# draw the line graph for sub_metering1
lines(as.POSIXct(plot3_ss$Date),plot3_ss$Sub_metering_1,type="l",col="black")

# draw the line graph for sub_metering2
lines(as.POSIXct(plot3_ss$Date),plot3_ss$Sub_metering_2,type="l",col="red")

# draw the line graph for sub_metering3
lines(as.POSIXct(plot3_ss$Date),plot3_ss$Sub_metering_3,type="l",col="blue")

legend("topright", col = c("black","red", "blue"), legend = names(plot3_ss[,3:5]), lty=1)

dev.off() ## Don't forget to close the PNG device!

