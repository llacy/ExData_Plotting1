##Get and subset data
data <-read.csv("household_power_consumption.txt", header = T, sep = ";", na.strings = "?")
head(data)
data$Date <- as.Date(data$Date, format = "%d/%m/%Y")
Feb_data <- subset(data, subset=(Date >= "2007-02-01" & Date <= "2007-02-02"))

##Plot 2
datetime <- paste(as.Date(Feb_data$Date), Feb_data$Time)
Feb_data$datetime <- as.POSIXct(datetime)
plot(Feb_data$Global_active_power~Feb_data$datetime, type = "l"
     , xlab = "", ylab = "Global Active Power (kilowatts)")
