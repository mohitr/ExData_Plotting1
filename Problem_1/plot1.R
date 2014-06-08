# reading complete data
complete_data <- read.csv("household_power_consumption.txt", header = TRUE, sep=";", comment.char="", na.string="?")

# filtering out only first 2 days of feb
reduced_set <- subset(complete_data, Date=='1/2/2007' | Date=='2/2/2007')

# plot histogram with relevant labels
hist(reduced_set$Global_active_power, col="red", main = "Global Active Power", xlab="Global Active Power (kilowatts)", ylab="Frequency")

# copy plot to png
dev.copy(png, "plot1.png", width=480, height=480)

# close
dev.off()