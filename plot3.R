#### plot3.R ####

library(lubridate)

hpc <- read.table("household_power_consumption.txt", sep=";", header=TRUE)
head(hpc)


hpc$Date <- dmy(as.character(hpc$Date))
hpc2 <- subset(hpc, hpc$Date %in% c(ymd("2007-02-01"), ymd("2007-02-02 UTC")))

timeDate <- paste(hpc2$Date, hpc2$Time)

hpc2$timeDate <- strptime(timeDate, "%Y-%m-%d %X")

hpc2$Sub_metering_1 <- as.numeric(as.character(hpc2$Sub_metering_1))
hpc2$Sub_metering_2 <- as.numeric(as.character(hpc2$Sub_metering_2))

### Plot

with(hpc2, plot(timeDate, Sub_metering_1, type="l"))
with(hpc2, lines(timeDate, Sub_metering_2, col= "red"))
with(hpc2, lines(timeDate, Sub_metering_3, col= "blue"))



