##### plot1.R #####
library(lubridate)
### Read data
hpc <- read.table("household_power_consumption.txt", sep=";", header=TRUE)

### Transform variables
# Date
head(hpc$Date)
hpc$Date <- dmy(as.character(hpc$Date))

### Subset data
hpc2 <- subset(hpc, hpc$Date %in% c(ymd("2007-02-01"), ymd("2007-02-02 UTC")))

# Global_active_power
hpc2$Global_active_power <- as.numeric(as.character(hpc2$Global_active_power))

### Creating and saving the Plot

png("plot1.png")

with(hpc2, hist(Global_active_power, col="red", 
                 main="Global Active Power",
                 xlab="Global Active Power (kilowatts)"))

dev.off()
