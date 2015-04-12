#read in data file(set up working directory)
setwd("C:/Users/ALIENWARE/Desktop/Ray/Plot")
#read in filename
filename <- "household_power_consumption.txt"
data <- read.table(filename, header=TRUE, sep=";",colClasses=c(“character”,”character”,rep(“numeric”,7)),na=”?”)
#only want data between 1/2/2007 and 2/2/2007

checkData <- data[data$Date %in% c("1/2/2007","2/2/2007") ,]

#Date and Time variables converted to Date/Time classes
datetime <- strptime(paste(checkData$Date, checkData$Time, sep=" "), "%d/%m/%Y %H:%M:%S")
#we want to worth numerics
globalActivePower <- as.numeric(checkData$Global_active_power)
submeters must also be numeric
subMetering1 <- as.numeric(checkData$Sub_metering_1)
subMetering2 <- as.numeric(checkData$Sub_metering_2)
subMetering3 <- as.numeric(checkData$Sub_metering_3)
#make outline
png("plot3.png", width=480, height=480)

plot(datetime, subMetering1, type="l", col=”black”,ylab="Energy Submetering", xlab="")
lines(datetime, subMetering2, type="l", col="red")
lines(datetime, subMetering3, type="l", col="blue")
legend(“topright”,
col=c(“black,”red”,”blue”),
c(“Sub_metering_1”,”Sub_metering_2”,
“Sub_metering_3”),
lty=1)
dev.off()
