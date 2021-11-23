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

#Plot3
png(filename ="Plot3.png",
    width = 480, height = 480)
with(data, plot(Date_Time1, Sub_metering_1, type="l", xlab = "", ylab ="Global Active Power(kilowatts)", col = "black"))
with(data, points(Date_Time1, Sub_metering_2, type="l", col = "red"))
with(data, points(Date_Time1, Sub_metering_3, type="l", col = "blue"))
legend("topright", lwd = 2, col= c("black","red","blue"), legend = c("Sub_metering_1","Sub_metering_2","Sub_metering_3"))

dev.off()
