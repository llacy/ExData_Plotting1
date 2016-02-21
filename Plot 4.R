##Get and subset data
data <-read.csv("household_power_consumption.txt", header = T, sep = ";", na.strings = "?")
head(data)
data$Date <- as.Date(data$Date, format = "%d/%m/%Y")
Feb_data <- subset(data, subset=(Date >= "2007-02-01" & Date <= "2007-02-02"))

##Plot 4
par(mfrow = c(2,2))
datetime <- paste(as.Date(Feb_data$Date), Feb_data$Time)
Feb_data$datetime <- as.POSIXct(datetime)

plot(Feb_data$Global_active_power~Feb_data$datetime, type = "l"
            , xlab = "", ylab = "Global Active Power (kilowatts)")

plot(Feb_data$Voltage~Feb_data$datetime, type= "l", xlab = "date time", ylab = "Voltage")

with(Feb_data,
     {plot(Sub_metering_1~datetime, type = "l", xlab = "", 
           ylab = "Energy Sub Metering")
       lines(Sub_metering_2~datetime, col = "Red")
       lines(Sub_metering_3~datetime, col = "Blue")}
)
legend("topright", col= c("black", "red", "blue"), lty = 1, 
       legend = c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3"))

plot(Feb_data$Global_reactive_power~Feb_data$datetime, type="l", 
          ylab="Global Rective Power",xlab=" date time")

##copy to png
dev.copy(png, "Plot4.png", height = 480, width = 480)
dev.off()
