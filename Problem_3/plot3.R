# reading complete data
complete_data <- read.csv("household_power_consumption.txt", header = TRUE, sep=";", comment.char="", na.string="?")

# filtering out only first 2 days of feb
reduced_set <- subset(complete_data, Date=='1/2/2007' | Date=='2/2/2007')

# creating a new field as datetime
reduced_set$ts <- strptime(paste(reduced_set$Date, reduced_set$Time), "%d/%m/%Y %H:%M:%S")

# plot the graph
plot(reduced_set$ts,  reduced_set$Sub_metering_1, ylim=c(0,30), type="l", xlab="", ylab="Energy sub metering")

# not deleting the previous plot
par(new=T)
plot(reduced_set$ts,  reduced_set$Sub_metering_2, ylim=c(0,30), type="l", col="red", xlab="", ylab="")

# not deleting the previous plot
par(new=T)
plot(reduced_set$ts,  reduced_set$Sub_metering_3, ylim=c(0,30), type="l", col="blue", xlab="", ylab="")

# adding legend now
legend( "topright", legend=c("Sub_metering_1", "Sub_metering_2","Sub_metering_3"), col=c("black", "red", "blue"), lwd=1, cex=.7)

# copy plot to png
dev.copy(png, "plot3.png", width=480, height=480)

# close
dev.off()