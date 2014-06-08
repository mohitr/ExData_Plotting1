# reading complete data
complete_data <- read.csv("household_power_consumption.txt", header = TRUE, sep=";", comment.char="", na.string="?")

# filtering out only first 2 days of feb
reduced_set <- subset(complete_data, Date=='1/2/2007' | Date=='2/2/2007')

# creating a new field as datetime
reduced_set$ts <- strptime(paste(reduced_set$Date, reduced_set$Time), "%d/%m/%Y %H:%M:%S")

# splitting screen into 4
par(mfrow=c(2,2))

#reducing bottom margin
par(mar=c(4, 4, 3.5, 2))

# plot 1st graph
plot(reduced_set$ts, reduced_set$Global_active_power, type="l", xlab="", ylab="Global Active Power (kilowatts)")

# 2nd graph
plot(reduced_set$ts, reduced_set$Voltage, type="l", xlab="datetime", ylab="Voltage")

# 3rd graph
par(new=F)
plot(reduced_set$ts,  reduced_set$Sub_metering_1, ylim=c(0,30), type="l", xlab="", ylab="Energy sub metering")
par(new=T)
plot(reduced_set$ts,  reduced_set$Sub_metering_2, ylim=c(0,30), type="l", col="red", xlab="", ylab="")
par(new=T)
plot(reduced_set$ts,  reduced_set$Sub_metering_3, ylim=c(0,30), type="l", col="blue", xlab="", ylab="")
legend( "topright", legend=c("Sub_metering_1", "Sub_metering_2","Sub_metering_3"), col=c("black", "red", "blue"), lwd=1, bty="n", cex=.7)

# 4th graph
plot(reduced_set$ts, reduced_set$Global_reactive_power, type="l", xlab="datetime", ylab="Global_reactive_power")

# copy plot to png
dev.copy(png, "plot4.png", width=480, height=480)

# close
dev.off()