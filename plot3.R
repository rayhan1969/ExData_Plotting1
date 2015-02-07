#read in data file(set up working directory)
setwd("C:/Users/ALIENWARE/Desktop/Ray/Plot")
#formatted a certain way
data <- read.table("household_power_consumption.txt", header=TRUE, sep=";", stringsAsFactors=FALSE, dec=".")
#check that data is between 1/2/2007 and 2/2/2007
#only want data between these dates
subSetData <- data[data$Date %in% c("1/2/2007","2/2/2007") ,]
#str(subSetData)
#convert Date and Time variables to Date/Time classes
datetime <- strptime(paste(subSetData$Date, subSetData$Time, sep=" "), "%d/%m/%Y %H:%M:%S")
#make sure it is numeric
globalActivePower <- as.numeric(subSetData$Global_active_power)
#make sure submeter is numeric
subMetering1 <- as.numeric(subSetData$Sub_metering_1)
subMetering2 <- as.numeric(subSetData$Sub_metering_2)
subMetering3 <- as.numeric(subSetData$Sub_metering_3)
#plot dimensions
png("plot3.png", width=480, height=480)
#the plots
plot(datetime, subMetering1, type="l", ylab="Energy Submetering", xlab="Day")
lines(datetime, subMetering2, type="l", col="red")
lines(datetime, subMetering3, type="l", col="blue")
legend("topright", c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3"), lty=1, lwd=2.5, col=c("black", "red", "blue"))
dev.off()
