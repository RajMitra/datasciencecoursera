epc <- read.table("", sep = ";")
epc$Time  <- strptime(paste(epc$Date,epc$Time),format = "%d/%m/%Y %H:%M:%S", tz = "")
epc$Date <- as.Date(epc$Date,"%d/%m/%Y")
sapply(epc,class)

epcmod <- epc[which(epc$Date == "2007-02-01" | epc$Date == "2007-02-02"),]
epcmod$Global_active_power <- as.numeric(epcmod$Global_active_power)
sapply(epcmod,class)

par(mfrow = c(2,2), mar = c(2,2,2,2))
plot(epcmod$Time,epcmod$Global_active_power, type = "l", ylab = "Global Active Power (Kilowatts)")
plot(epcmod$Time,epcmod$Voltage, type = "l", ylab = "Voltage")
plot(epcmod$Time,epcmod$Sub_metering_3, type = "l", ylab = "Energy sub metering", col = "blue")
plot(epcmod$Time,epcmod$Global_reactive_power, type = "l", ylab = "Global_reactive_power")
dev.copy(png, file = "plot4.png")
dev.off()