source("readdata.R")

data <- readData()
png("./plot4.png", width = 480, height = 480)
par(mfrow=c(2,2))	# draw 4 plots in a 2 x 2 grid.

# plot 1
plot(data$DateTime, data$Global_active_power, type="l", xlab="", ylab="Global Active Power")

# plot 2
plot(data$DateTime, data$Voltage, type="l", xlab="datetime", ylab="Voltage")

# plot 3
plot(data$DateTime, data$Sub_metering_1, type="l", xlab="", ylab="Energy sub metering", col="black")
lines(data$DateTime, data$Sub_metering_2, col="red")
lines(data$DateTime, data$Sub_metering_3, col="blue")
legend("topright", c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3"), lty=1, box.lwd=0, col=c("black", "red", "blue"))

# plot 4
plot(data$DateTime, data$Global_reactive_power, type="n", xlab="datetime", ylab="Global_reactive_power")
lines(data$DateTime, data$Global_reactive_power)

dev.off()