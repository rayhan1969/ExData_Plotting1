#read in data file(set up working directory)
setwd("C:/Users/ALIENWARE/Desktop/Ray/Plot")
#formatted a certain way
data <- read.table("household_power_consumption.txt", header=TRUE, sep=";", stringsAsFactors=FALSE, dec=".")
#check that data is between 1/2/2007 and 2/2/2007
#only want data between these dates
subSetData <- data[data$Date %in% c("1/2/2007","2/2/2007") ,]
#str(subSetData)
#convert the Date and Time variables to Date/Time classes
datetime <- strptime(paste(subSetData$Date, subSetData$Time, sep=" "), "%d/%m/%Y %H:%M:%S")
#make sure it is numeric
globalActivePower <- as.numeric(subSetData$Global_active_power)
#set plot dimensions
png("plot2.png", width=480, height=480)  
#draw plot with axes labeled
plot(datetime, globalActivePower, type="l", xlab="Day", ylab="Global Active Power (in kilowatts)")
dev.off()
