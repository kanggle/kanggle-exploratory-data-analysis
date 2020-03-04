setwd("C:/Users/25079/Downloads/exdata_data_household_power_consumption")
datawork<-read.table("household_power_consumption.txt", header = TRUE,sep = ";")
datawork$Date<-as.Date(datawork$Date, "%d/%m/%Y")
datawork$datetime<-strptime(paste(datawork$Date, datawork$Time), "%Y-%m-%d %H:%M:%S")
datawork$Global_active_power<-as.numeric(datawork$Global_active_power)
subSetData <- subset(datawork, subset = (datawork$Date >= "2007-02-01" & 
                                           datawork$Date <= "2007-02-02"))


hist(x=subSetData$Global_active_power, xlab = "Global active power (kilowatts)",
     col = "red",main = "Global Active Power",xaxt="n", xlim = c(0,3000),ylim = c(0,1200))
axis(1,c(0,1000,2000,3000),c(0,2,4,6))
dev.copy(png, file = "plot1.png", height = 480, width = 480)
dev.off()