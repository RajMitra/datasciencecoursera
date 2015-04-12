epc <- read.table("", sep = ";")
epc$Time  <- strptime(paste(epc$Date,epc$Time),format = "%d/%m/%Y %H:%M:%S", tz = "")
epc$Date <- as.Date(epc$Date,"%d/%m/%Y")
sapply(epc,class)

epcmod <- epc[which(epc$Date == "2007-02-01" | epc$Date == "2007-02-02"),]
epcmod$Global_active_power <- as.numeric(epcmod$Global_active_power)
sapply(epcmod,class)

plot(epcmod$Time,epcmod$Sub_metering_1, type = "l", ylab = "Energy sub metering")
par(new = TRUE)
plot(epcmod$Time,epcmod$Sub_metering_3, type = "l", ylab = "Energy sub metering", col = "blue")
par(new = TRUE)
plot(epcmod$Time,epcmod$Sub_metering_2, type = "l", ylab = "Energy sub metering", col = "orange")

dev.copy(png, file = "plot3.png")
dev.off()