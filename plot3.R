library(dplyr)

pd1 <- read.table("household_power_consumption.txt", sep=";",
                  header=TRUE, na.strings="?", stringsAsFactors=FALSE)

pd1$Date <- as.Date(pd1$Date, "%d/%m/%Y")
 
pd2 <- pd1 %>% filter(Date >= "2007-02-01" & Date <= "2007-02-02")

par(mfrow=c(1,1))

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
# 1 minute sampling rate, 60 samples per hour * 24 hours * 2 days +=> 2880
#
axis(1, c("Thu", "Fri", "Sat"), at=c(0, 1440, 2880))
nm <- names(pd2)
par(col="black")
l1 <- paste(nm[7], "        ")
l2 <- paste(nm[8], "        ")
l3 <- paste(nm[9], "        ")
legend("topright", legend=c(l1,l2,l3), 
       col=c("black", "red", "blue"), lty=c(1,1,1),
       y.intersp=1)

dev.copy(png, file="plot3.png")
dev.off()
