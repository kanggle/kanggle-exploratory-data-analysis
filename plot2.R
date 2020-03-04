setwd("C:/Users/25079/Downloads/exdata_data_household_power_consumption")
datawork<-read.table("household_power_consumption.txt", header = TRUE,sep = ";")
datawork$Date<-as.Date(datawork$Date, "%d/%m/%Y")
datawork$datetime<-strptime(paste(datawork$Date, datawork$Time), "%Y-%m-%d %H:%M:%S")
datawork$Global_active_power<-as.numeric(datawork$Global_active_power)
subSetData <- subset(datawork, subset = (datawork$Date >= "2007-02-01" & 
                                           datawork$Date <= "2007-02-02"))

plot(subSetData$datetime,subSetData$Global_active_power,type = "l",yaxt="n",
     ylab = "Global active power (kilowatts)")
axis(2,c(0,1000,2000,3000),c(0,2,4,6))
dev.copy(png, file = "plot2.png", height = 480, width = 480)
dev.off()