#Set Working Directory (to stay organized !)
setwd("C:/00 - Projets/99 - Coursera/Exploratory Data Analysis/Week 1")

# load full data from txt files downloaded
datas <- read.csv("./household_power_consumption.txt", header = TRUE, sep = ";",  na.strings = "?")

#convert Date column to Date classe
datas$Date <- as.Date(datas$Date, format="%d/%m/%Y")

# extratct subset of data (1st Feb 2007 to 2nd Feb 2007) and delete full set of data
mydates <- as.Date(c("1/02/2007", "2/2/2007"), format = "%d/%m/%Y")
data <- subset(datas, (Date %in% mydates))
#rm(datas)

# convert  time column from text to Date class and concatenate date and time
# Add a new column DateTime
data$DateTime <-  strptime(paste(data$Date, data$Time), "%Y-%m-%d %H:%M:%S")


png("plot3.png", width=480, height=480, units = "px")
plot( as.POSIXct(data$DateTime), as.numeric(data$Sub_metering_1), type="l", ylab="Energy Submetering", xlab="")
lines( as.POSIXct(data$DateTime), as.numeric(data$Sub_metering_2), type="l", col="red")
lines( as.POSIXct(data$DateTime), as.numeric(data$Sub_metering_3), type="l", col="blue")
legend("topright", c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3"), lty=1, lwd=2.5, col=c("black", "red", "blue"))
dev.off()
