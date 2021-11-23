setwd("~/Coursera/ExploratoryDataAnalysis")
data.pre<-read.csv("~/Coursera/ExploratoryDataAnalysis/household_power_consumption.txt", header=TRUE, sep=";")
data.pre$Date<-as.Date(as.character(data.pre$Date), "%d/%m/%Y")

data.pre$Date_Time<-paste(data.pre$Date, data.pre$Time)
library(lubridate)
data.pre$Date_Time1<as.Date(as.character(data.pre$Date_Time), "%Y-%m-%d %H:%M:%S")

data<-subset(data.pre, Date =="2007-02-01" | Date == "2007-02-02")
data$Format_data<-format(data$Date, "%a")
data$Date_Time1<-ymd_hms(data$Date_Time)

data$Global_active_power<-as.numeric(data$Global_active_power)

#Plot4
png(filename ="Plot4.png",
    width = 480, height = 480)
par(mfrow=c(2,2), mar=c(4,4,3,3))
plot(data$Date_Time1, data$Global_active_power,type ="l", xlab = "", ylab="Gobal Active Power (kilowatts)")
plot(data$Date_Time1, data$Voltage ,type ="l", xlab = "datetime", ylab = "Voltage")


with(data, plot(Date_Time1, Sub_metering_1, type="l", xlab = "", ylab ="Energy sub metering", col = "black"))
with(data, points(Date_Time1, Sub_metering_2, type="l", col = "red"))
with(data, points(Date_Time1, Sub_metering_3, type="l", col = "blue"))
legend("topright", lwd = 2, col= c("black","red","blue"), legend = c("Sub_metering_1","Sub_metering_2","Sub_metering_3"), bty =  "n")

plot(data$Date_Time1, data$Global_reactive_power,type ="l", xlab = "", ylab="Gobal_reactive_power")


dev.off()