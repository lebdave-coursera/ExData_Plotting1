# Read the data, transform the date to a more usable format and subset it to the required dates.

readData <- function()
{
	# Read the data.
	data <- read.csv("./household_power_consumption.txt", header = TRUE, sep = ";", colClasses=c("character", "character", rep("numeric", 7)), na="?")

	# Generate datetime field for easier sampling.
	data$DateTime <- strptime(paste(data$Date, data$Time), "%d/%m/%Y %H:%M:%S")
	# Convert the date from string to Date format.
	data$Date <- as.Date(data$Date , "%d/%m/%Y")

	# Subset the interval.
	date_interval <- as.Date(c("01/02/2007", "02/02/2007"), "%d/%m/%Y")
    data <- subset(data, Date %in% date_interval)

	return (data)
}