#Set Working Directory (to stay organized !)
setwd("C:/00 - Projets/99 - Coursera/Exploratory Data Analysis/Week 1")

# load full data from txt files downloaded
datas <- read.csv("./household_power_consumption.txt", header = TRUE, sep = ";")


#convert Date column to Date classe
datas$Date <- as.Date(datas$Date, format="%d/%m/%Y")

# extratct subset of data (1st Feb 2007 to 2nd Feb 2007) and delete full set of data
mydates <- as.Date(c("1/02/2007", "2/2/2007"), format = "%d/%m/%Y")
data <- subset(datas, (Date %in% mydates))
rm(datas)

#plot png file (480px *480px)
png("plot1.png", width = 480, height = 480, units = "px")
hist(as.numeric(data$Global_active_power), main = "Global Active Power", xlab = "Global Active Power (kilowatts)", ylab = "Frequency", col = "red")
dev.off()
