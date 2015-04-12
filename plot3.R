epc <- read.table("", sep = ";")
epc$Time  <- strptime(paste(epc$Date,epc$Time),format = "%d/%m/%Y %H:%M:%S", tz = "")
epc$Date <- as.Date(epc$Date,"%d/%m/%Y")
sapply(epc,class)

epcmod <- epc[which(epc$Date == "2007-02-01" | epc$Date == "2007-02-02"),]
epcmod$Global_active_power <- as.numeric(epcmod$Global_active_power)
sapply(epcmod,class)

plot(epcmod$Time,epcmod$Global_active_power, type = "l", ylab = "Global Active Power (Kilowatts)")
dev.copy(png, file="plo2.png")
dev.off()