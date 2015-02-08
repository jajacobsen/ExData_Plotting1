zipfile <- tempfile() 
download.file("https://d396qusza40orc.cloudfront.net/exdata%2Fdata%2Fhousehold_power_consumption.zip", zipfile)

EWData <- unzip(zipfile)

library(data.table)
EW <- fread(EWData, skip = "1/2/2007", nrows = 2880, na.strings = "?")

dates <- EW[, V1]
times <- EW[, V2]
x <- paste(dates, times)
Time_Met <- strptime(x, "%e/%m/%Y %H:%M:%S")

plot(Time_Met, EW[, V7], type = "l", ylab = "Energy sub metering", xlab = "", col = "black")
lines(Time_Met, EW[, V8], col = "red")
lines(Time_Met, EW[, V9], col = "blue")
legend("topright", c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3"), lty = 1, col = c("black", "red", "blue")) 

png(file = "plot3.png", height = 480, width = 480)
        plot(Time_Met, EW[, V7], type = "l", ylab = "Energy sub metering", xlab = "", col = "black")
        lines(Time_Met, EW[, V8], col = "red")
        lines(Time_Met, EW[, V9], col = "blue")
        legend("topright", c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3"), lty = 1, col = c("black", "red", "blue"))
dev.off()
