setwd("C:/Users/25079/Downloads/exdata_data_household_power_consumption")
datawork<-read.table("household_power_consumption.txt", header = TRUE,sep = ";")
datawork$Date<-as.Date(datawork$Date, "%d/%m/%Y")
datawork$datetime<-strptime(paste(datawork$Date, datawork$Time), "%Y-%m-%d %H:%M:%S")
datawork$Global_active_power<-as.numeric(datawork$Global_active_power)
subSetData <- subset(datawork, subset = (datawork$Date >= "2007-02-01" & 
                                           datawork$Date <= "2007-02-02"))

par(mfcol=c(2,2))
#topleft
plot(subSetData$datetime,subSetData$Global_active_power,type = "l",yaxt="n",
     ylab = "Global active power (kilowatts)")
axis(2,c(0,1000,2000,3000),c(0,2,4,6))
#bottomleft
plot(subSetData$datetime,as.numeric(as.character(subSetData$Sub_metering_1)),type = "l",
     ylab = "Energy sub metering",col="black")
lines(subSetData$datetime,as.numeric(as.character(subSetData$Sub_metering_2)),type = "l", col="red")
lines(subSetData$datetime,as.numeric(as.character(subSetData$Sub_metering_3)),type = "l", col="blue")
legend('topright', lty=1, lwd=2, col = c("black", "red", "blue"),
       legend = c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3"),cex = 0.6)
#topright
plot(subSetData$datetime,as.numeric(as.character(subSetData$Voltage)),type = "l",
     xlab = "datetime",ylab = "Voltage")
#bottomright
plot(subSetData$datetime,as.numeric(as.character(subSetData$Global_reactive_power)),type = "l",
     xlab = "datetime",ylab = "Global_reactive_power")
dev.copy(png, file = "plot4.png", height = 480, width = 480)
dev.off()