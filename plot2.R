#### plot2.R ####
library(lubridate)

hpc <- read.table("household_power_consumption.txt", sep=";", header=TRUE)
head(hpc)


hpc$Date <- dmy(as.character(hpc$Date))
hpc2 <- subset(hpc, hpc$Date %in% c(ymd("2007-02-01"), ymd("2007-02-02 UTC")))

timeDate <- paste(hpc2$Date, hpc2$Time)

hpc2$timeDate <- strptime(timeDate, "%Y-%m-%d %X")

### Plot

with(hpc2, plot(timeDate,Global_active_power, type="l"))
     names(hpc2)
