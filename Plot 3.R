##Get and subset data
data <-read.csv("household_power_consumption.txt", header = T, sep = ";", na.strings = "?")
head(data)
data$Date <- as.Date(data$Date, format = "%d/%m/%Y")
Feb_data <- subset(data, subset=(Date >= "2007-02-01" & Date <= "2007-02-02"))

##Plot 3
with(Feb_data,
     {plot(Sub_metering_1~datetime, type = "l", xlab = "", 
           ylab = "Energy Sub Metering")
           lines(Sub_metering_2~datetime, col = "Red")
           lines(Sub_metering_3~datetime, col = "Blue")}
     )
legend("topright", col= c("black", "red", "blue"), lty = 1, 
       legend = c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3"))

##copy to png
dev.copy(png, "Plot3.png", height = 480, width = 480)
dev.off()
