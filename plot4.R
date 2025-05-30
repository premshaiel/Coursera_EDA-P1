# File: plot4.R

data <- read.table("household_power_consumption.txt", header = TRUE, sep = ";", na.strings = "?", stringsAsFactors = FALSE)
subset_data <- data[data$Date %in% c("1/2/2007", "2/2/2007"), ]
subset_data$datetime <- as.POSIXct(paste(subset_data$Date, subset_data$Time), format = "%d/%m/%Y %H:%M:%S")
datetime <- strptime(paste(subset_data$Date, subset_data$Time), format = "%Y-%m-%d %H:%M:%S")

png("plot3.png", width = 480, height = 480)
par(mfrow = c(2, 2))
plot(datetime, subset_data$Global_active_power, type = "l", xlab = "", ylab = "Global Active Power")
plot(datetime, subset_data$Voltage, type = "l", xlab = "datetime", ylab = "Voltage")
plot(datetime, subset_data$Sub_metering_1, type = "l", xlab = "", ylab = "Energy sub metering")

lines(datetime, subset_data$Sub_metering_2, col = "red")
lines(datetime, subset_data$Sub_metering_3, col = "blue")

legend("topright", bty = "n", legend = c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3"), col = c("black", "red", "blue"), lty = 1)
plot(datetime, subset_data$Global_reactive_power, type = "l", xlab = "datetime", ylab = "Global_reactive_power")
dev.off()
