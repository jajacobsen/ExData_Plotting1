zipfile <- tempfile() 
download.file("https://d396qusza40orc.cloudfront.net/exdata%2Fdata%2Fhousehold_power_consumption.zip", zipfile)

EWData <- unzip(zipfile)

library(data.table)
EW <- fread(EWData, skip = "1/2/2007", nrows = 2880, na.strings = "?")

hist(EW[, V3], col = "red", main = "Global Active Power", xlab = "Global Active Power (kilowatts)")

png(file = "plot1.png", height = 480, width = 480)
        hist(EW[, V3], col = "red", main = "Global Active Power", xlab = "Global Active Power (kilowatts)")
dev.off()