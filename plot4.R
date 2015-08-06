#only import the lines for Feb 1 and Feb 2
usage <- read.table("household_power_consumption.txt", header = FALSE, sep = ";", skip = 66637, nrows = 2880, col.names = c("Date","Time","Global_active_power","Global_reactive_power","Voltage","Global_intensity","Sub_metering_1","Sub_metering_2","Sub_metering_3"))
colnames(usage)[1] <- "datetime"

#convert date column to date/time format and change label
usage$Date <- strptime(paste(usage$Date, usage$Time), "%d/%m/%Y %H:%M:%S")
colnames(usage)[1] <- "datetime"

#set up for 4 plots
par(mfcol = c(2,2))

#make the plot
png("plot4.png")
#top left plot
plot(usage$datetime, usage$Global_active_power, type = "l", xlab = "", ylab = "Global Active Power (kiliwatts)")

#bottom left plot
plot(usage$datetime, usage$Sub_metering_1, type = "l", xlab = "", ylab = "Energy sub metering")
lines(usage$datetime, usage$Sub_metering_2, type = "l", col = "red")
lines(usage$datetime, usage$Sub_metering_3, type = "l", col = "blue")
legend("topright", lty = 1, col = c("black", "blue", "red"), legend = c("Sub_metering_1","Sub_metering_2","Sub_metering_3"))

#top right plot
with(usage, plot(datetime, Voltage, type = "l"))

#bottom right plot
with(usage, plot(datetime, Global_reactive_power, type = "l"))

dev.off(6)
