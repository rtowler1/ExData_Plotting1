library(dplyr)

pd1 <- read.table("household_power_consumption.txt", sep=";",
                  header=TRUE, na.strings="?", stringsAsFactors=FALSE)

pd1$Date <- as.Date(pd1$Date, "%d/%m/%Y")

pd2 <- pd1 %>% filter(Date >= "2007-02-01" & Date <= "2007-02-02")

plot(pd2$Global_active_power, 
     ylab="Global Active Power (Kilowatts)",
     xlab="",
     type="n",
     xaxt="n"
)
lines(pd2$Global_active_power)
#
# 1 minute sampling rate, 60 samples per hour * 24 hours * 2 days +=> 2880
#
axis(1, c("Thu", "Fri", "Sat"), at=c(0, 1440, 2880))

dev.copy(png, file="plot2.png")
dev.off()