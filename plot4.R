#read in data file(set up working directory)
setwd("C:/Users/ALIENWARE/Desktop/Ray/Plot")
#read in filename
filename<-"household_power_consumption.txt"
data <- read.table(filename, 
header=TRUE, 
sep=";", 
colClasses=c(“character”,character”,
rep(“numeric”,7)),
na=”?”)

# data must be  between 1/2/2007 and 2/2/2007

checkData <- data[data$Date %in% c("1/2/2007","2/2/2007") ,]

#Date and Time variables must be converted to Date/Time classes
datetime <- strptime(paste(subSetData$Date, subSetData$Time, sep=" "), "%d/%m/%Y %H:%M:%S")
#must be numeric
globalActivePower<-as.numeric(checkData$Global_active_power)
globalReactivePower <- as.numeric(checkData$Global_reactive_power)
voltage <- as.numeric(checkData$Voltage)
subMetering1 <- as.numeric(checkData$Sub_metering_1)
subMetering2 <- as.numeric(checkData$Sub_metering_2)
subMetering3 <- as.numeric(checkData$Sub_metering_3)
#outline plot
png("plot4.png", width=480, height=480)
par(mfrow = c(2, 2))
plot(datetime, globalActivePower, type="l", xlab="", ylab="Global Active Power")
plot(datetime, voltage, type="l", xlab="datetime", ylab="Voltage")
plot(datetime, subMetering1, type="l",col=”black”, ylab="Energy Submetering", xlab="")
lines(datetime, subMetering2, col="red")
lines(datetime, subMetering3, col="blue")
legend("topright", 
col=c("black", "red", "blue"),
c(“Sub_metering_1”,”Sub_metering_2”,”Sub_metering_3”),lty=1,box.lwd=0)

plot(datetime, globalReactivePower, type="n", xlab="datetime", ylab="Global_reactive_power")
lines(datetime,globalReactivePower)

dev.off()
