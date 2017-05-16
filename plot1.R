library(dplyr)

pd1 <- read.table("household_power_consumption.txt", sep=";", header=TRUE, na.strings="?", stringsAsFactors=FALSE)
 
pd1$Date <- as.Date(pd1$Date, "%d/%m/%Y")

pd2 <- pd1 %>% filter(Date >= "2007-02-01" & Date <= "2007-02-02")

hist(pd2$Global_active_power, col="red", main="Global Active Power", xlab="Global Active Power (Kilowatts)")

dev.copy(png, file="plot1.png")
dev.off() 