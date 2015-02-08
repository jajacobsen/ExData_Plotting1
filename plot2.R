zipfile <- tempfile() 
download.file("https://d396qusza40orc.cloudfront.net/exdata%2Fdata%2Fhousehold_power_consumption.zip", zipfile)

EWData <- unzip(zipfile)

library(data.table)
EW <- fread(EWData, skip = "1/2/2007", nrows = 2880, na.strings = "?")

dates <- EW[, V1]
times <- EW[, V2]
x <- paste(dates, times)
Time_Met <- strptime(x, "%e/%m/%Y %H:%M:%S")

plot(Time_Met, EW[, V3], type = "l", ylab = "Global Active Power (kilowatts)", xlab = "")

png(file = "plot2.png", height = 480, width = 480)
        plot(Time_Met, EW[, V3], type = "l", ylab = "Global Active Power (kilowatts)", xlab = "")
dev.off()