
library(dplyr)

#
# Read the data file
#
pd1 <- read.table("household_power_consumption.txt", sep=";",
                  header=TRUE, na.strings="?", stringsAsFactors=FALSE)

#
# Convert the date strings to date objects.
#
pd1$Date <- as.Date(pd1$Date, "%d/%m/%Y")

#
# Filter out the 2 days of data for the plots.
#
pd2 <- pd1 %>% filter(Date >= "2007-02-01" & Date <= "2007-02-02")

#
# Set the plot up to be 2 by 2 filling the plots column by column.
#
par(mfcol=c(2,2))

#
# Setup for plot the 1st plot.
#
plot(pd2$Global_active_power, 
     ylab="Global Active Power",
     xlab="",
     type="n",
     xaxt="n"
)

#
# Draw the lines.
#
lines(pd2$Global_active_power)

#
# Set the x-axis tick marks.
# 1 minute sampling rate, 60 samples per hour * 24 hours * 2 days +=> 2880
#
axis(1, c("Thu", "Fri", "Sat"), at=c(0, 1440, 2880))

#
# Setup for the 2nd plot.
#
plot(pd2$Sub_metering_1, 
     ylab="Energy sub metering",
     xlab="",
     type="n",
     xaxt="n"
)
par(col="black")
lines(pd2$Sub_metering_1)
par(col="red")
lines(pd2$Sub_metering_2)
par(col="blue")
lines(pd2$Sub_metering_3)
# 
# 1 minute sampling rate, 
# 60 samples per hour * 24 hours * 2 days +=> 2880
#
axis(1, c("Thu", "Fri", "Sat"), at=c(0, 1440, 2880))
 
par(col="black")
par(mai=c(0.8466, 0.6806, 0.68, 0.2))
nm < names(pd2)
l1 <- paste(nm[7], "       ")
l2 <- paste(nm[8], "       ")
l3 <- paste(nm[9], "       ")
legend("topright", legend=c(l1,l2,l3),  
       col=c("black", "red", "blue"), lty=c(1,1,1),
       y.intersp=0.75,
       bty="n")

#
# Setup for the 3rd plot
#
plot(pd2$Voltage, 
     ylab=nm[5],
     xlab="datetime",
     type="n",
     xaxt="n"
)
par(col="black") 
lines(pd2$Voltage)
axis(1, c("Thu", "Fri", "Sat"), at=c(0, 1440, 2880))

#
# Setup for the 4th plot
#
plot(pd2$Global_reactive_power, 
     ylab=nm[4],
     xlab="datetime",
     type="n",
     xaxt="n"
)
par(col="black")
lines(pd2$Global_reactive_power)
axis(1, c("Thu", "Fri", "Sat"), at=c(0, 1440, 2880))


#
# Create and close the PNG file.
#
dev.copy(png, file="plot4.png")
dev.off()