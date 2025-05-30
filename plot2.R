# File: plot2.R
data <- read.table("household_power_consumption.txt", header = TRUE, sep = ";", 
                   na.strings = "?", stringsAsFactors = FALSE)
subset_data <- data[data$Date %in% c("1/2/2007", "2/2/2007"), ]
datetime <- strptime(paste(subset_data$Date, subset_data$Time), format = "%Y-%m-%d %H:%M:%S")
png("plot2.png", width = 480, height = 480)
plot(datetime, subset_data$Global_active_power, type = "l", xlab = "", ylab = "Global Active Power (kilowatts)")
dev.off()