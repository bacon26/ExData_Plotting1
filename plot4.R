#### plot4.R ####

library(lubridate)

hpc <- read.table("household_power_consumption.txt", sep=";", header=TRUE)
head(hpc)


hpc$Date <- dmy(as.character(hpc$Date))
hpc2 <- subset(hpc, hpc$Date %in% c(ymd("2007-02-01"), ymd("2007-02-02 UTC")))

timeDate <- paste(hpc2$Date, hpc2$Time)

hpc2$timeDate <- strptime(timeDate, "%Y-%m-%d %X")


### Plot

png("plot4.png")

par(mfcol=c(2,2))

# plot 1
with(hpc2, plot(timeDate,Global_active_power, type="l"))
# plot 2
with(hpc2, plot(timeDate, Sub_metering_1, type="l",
                ylab="Energy sub metering", xlab=""))
with(hpc2, lines(timeDate, Sub_metering_2, col= "red"))
with(hpc2, lines(timeDate, Sub_metering_3, col= "blue"))

legend("topright", c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3"), 
       col=c("black", "red", "blue"), lty=1)
# plot 3
with(hpc2, plot(timeDate, as.character(as.numeric(Voltage)), type="l", ylab="Voltage"))
# plot 4
hpc2$Global_reactive_power <- as.character(as.numeric(hpc2$Global_reactive_power))
with(hpc2, plot(timeDate, Global_reactive_power, type="l"))

dev.off()
