columns = c(rep("character", 2), rep("numeric", 7))
raw_data <- read.table("household_power_consumption.txt", sep = ";",
                       header = TRUE, colClasses = columns, na.strings = "?")

data <- subset(raw_data, Date == "1/2/2007" | Date == "2/2/2007")

data$DateTime <- as.POSIXct(paste(data$Date, data$Time),
                            format = "%d/%m/%Y %H:%M:%S")

png("plot4.png")

par(mfrow = c(2,2))

## Top left: Global Active Power

with(data, plot(DateTime, Global_active_power, type="l",
     ylab = "Global Active Power", xlab = ""))


## Top right: Voltage

with(data, plot(DateTime, Voltage, type="l", xlab = "datetime"))


## Bottom left: Sub Metering

with(data, plot(DateTime, Sub_metering_1, type="n",
     ylab = "Energy sub metering", xlab = ""))

with(data, lines(DateTime, Sub_metering_1))
with(data, lines(DateTime, Sub_metering_2, col = "red"))
with(data, lines(DateTime, Sub_metering_3, col = "blue"))

legend("topright", colnames(data)[7:9],lwd=(c(1,1)),
       col=c("black","red","blue"), bty="n")


## Bottom right: Global Reactive Power

with(data, plot(DateTime, Global_reactive_power, type="l", xlab = "datetime"))


dev.off()
