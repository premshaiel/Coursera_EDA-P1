# File: plot1.R
data <- read.table("household_power_consumption.txt", header = TRUE, sep = ";", 
                   na.strings = "?", stringsAsFactors = FALSE)
subset_data <- data[data$Date %in% c("1/2/2007", "2/2/2007"), ]
png("plot1.png", width = 480, height = 480)
hist(subset_data$Global_active_power, col = "red", main = "Global Active Power", xlab = "Global Active Power (kilowatts)")
dev.off()
