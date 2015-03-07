columns = c(rep("character", 2), rep("numeric", 7))
raw_data <- read.table("household_power_consumption.txt", sep = ";",
                       header = TRUE, colClasses = columns, na.strings = "?")

data <- subset(raw_data, Date == "1/2/2007" | Date == "2/2/2007")

png("plot1.png")

hist(data$Global_active_power, col = "red", main = "Global Active Power",
     xlab = "Global Active Power (kilowatts)")

dev.off()
