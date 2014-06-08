# downloading data
url="https://d396qusza40orc.cloudfront.net/exdata%2Fdata%2Fhousehold_power_consumption.zip"
file="household_power_consumption.txt"
temp_file= "/tmp/a.zip"
download.file(url, destfile=temp_file, method="curl")
complete_data <- read.table(unz(temp_file, file), header=TRUE, sep=";", na.string="?", comment.char="")

# filtering out only first 2 days of feb
reduced_set <- subset(complete_data, Date=='1/2/2007' | Date=='2/2/2007')

# plot histogram with relevant labels
hist(reduced_set$Global_active_power, col="red", main = "Global Active Power", xlab="Global Active Power (kilowatts)", ylab="Frequency")

# copy plot to png
dev.copy(png, "plot1.png", width=480, height=480)

# close
dev.off()