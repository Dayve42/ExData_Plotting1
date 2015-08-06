#only import the lines for Feb 1 and Feb 2
usage <- read.table("household_power_consumption.txt", header = FALSE, sep = ";", skip = 66637, nrows = 2880, col.names = c("Date","Time","Global_active_power","Global_reactive_power","Voltage","Global_intensity","Sub_metering_1","Sub_metering_2","Sub_metering_3"))

#convert date column to date/time format
usage$Date <- strptime(paste(usage$Date, usage$Time), "%d/%m/%Y %H:%M:%S")

#make the plot
png("plot3.png")
plot(usage$Date, usage$Sub_metering_1, type = "l", xlab = "", ylab = "Energy sub metering")
lines(usage$Date, usage$Sub_metering_2, type = "l", col = "red")
lines(usage$Date, usage$Sub_metering_3, type = "l", col = "blue")
legend("topright", lty = 1, col = c("black", "blue", "red"), legend = c("Sub_metering_1","Sub_metering_2","Sub_metering_3"))
dev.off(6)
