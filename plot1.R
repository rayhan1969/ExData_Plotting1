#read in data file(set up working directory)
setwd("C:/Users/ALIENWARE/Desktop/Ray/Plot")
#formatted a certain way
data <- read.table("household_power_consumption.txt", header=TRUE, sep=";", stringsAsFactors=FALSE, dec=".")
#check that data is between 1/2/2007 and 2/2/2007
#only want data between these dates
subSetData <- data[data$Date %in% c("1/2/2007","2/2/2007") ,]
#str(subSetData)
#make sure we get numeric data
globalActivePower <- as.numeric(subSetData$Global_active_power)
#set plot dimensions
png("plot1.png", width=480, height=480)
#draw histogram
hist(globalActivePower, col="red", main="Global Active Power", xlab="Global Active Power (in kilowatts)")
dev.off()
