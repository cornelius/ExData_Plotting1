columns = c(rep("character", 2), rep("numeric", 7))
raw_data <- read.table("household_power_consumption.txt", sep = ";",
                       header = TRUE, colClasses = columns, na.strings = "?")

data <- subset(raw_data, Date == "1/2/2007" | Date == "2/2/2007")

data$DateTime <- as.POSIXct(paste(data$Date, data$Time),
                            format = "%d/%m/%Y %H:%M:%S")

png("plot2.png")

with(data, plot(DateTime, Global_active_power, type="l",
     ylab = "Global Active Power (kilowatts)"))

dev.off()
