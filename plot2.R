#read in data file(set up working directory)
setwd("C:/Users/ALIENWARE/Desktop/Ray/Plot")
#data is read in as filename
filename<-“ household_power_consumption.txt"
data <- read.table(filename, header=TRUE, sep=";", colClasses=c(“character”,”character”, rep(”numeric”,7)),na=”?”)

#We only want data between 1/2/2007 and 2/2/2007

checkData <- data[data$Date %in% c("1/2/2007","2/2/2007") ,]
#convert the Date and Time variables to Date/Time classes
datetime <- strptime(paste(checkData$Date, checkData$Time, sep=" "), "%d/%m/%Y %H:%M:%S")
#must be numeric
globalActivePower <- as.numeric(checkData$Global_active_power)
#specify plot
png("plot2.png", width=480, height=480)  
#label axes and plot
plot(datetime, globalActivePower, type="l", xlab="", ylab="Global Active Power (in kilowatts)")
dev.off()
