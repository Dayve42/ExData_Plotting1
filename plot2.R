#only import the lines for Feb 1 and Feb 2
usage <- read.table("household_power_consumption.txt", header = FALSE, sep = ";", skip = 66637, nrows = 2880, col.names = c("Date","Time","Global_active_power","Global_reactive_power","Voltage","Global_intensity","Sub_metering_1","Sub_metering_2","Sub_metering_3"))

#convert date column to date/time format
usage$Date <- strptime(paste(usage$Date, usage$Time), "%d/%m/%Y %H:%M:%S")

#make the plot
png("plot2.png")
plot(usage$Date, usage$Global_active_power, type = "l", xlab = "", ylab = "Global Active Power (kiliwatts)")
dev.off(6)
