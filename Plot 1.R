##Get and subset data
data <-read.csv("household_power_consumption.txt", header = T, sep = ";", na.strings = "?")
head(data)
data$Date <- as.Date(data$Date, format = "%d/%m/%Y")
Feb_data <- subset(data, subset=(Date >= "2007-02-01" & Date <= "2007-02-02"))

##Plot 1 
hist(Feb_data$Global_active_power, xlab = "Global Active Power (kilowatts)"
     , ylab = "Frequency", col = "Red", main = "Global Active Power")
##copy to PNG
dev.copy(png, "Plot1.png", units = "in", height = 480, width = 480)
dev.off()
