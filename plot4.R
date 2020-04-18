# plot4.R

# reading data
houseHoldPowerDT <- read.table("household_power_consumption.txt", skip = 1, na.strings="?", sep=";")

# name the columns
names(houseHoldPowerDT)<- c("Date","Time","Global_active_power","Global_reactive_power","Voltage","Global_intensity","Sub_metering_1","Sub_metering_2","Sub_metering_3")

# new datatable with relevant dates
relevant_houseHoldPowerDT <- subset(houseHoldPowerDT, houseHoldPowerDT$Date == "1/2/2007" | houseHoldPowerDT$Date == "2/2/2007")

# new column with proper date format "%d/%m/%Y %H:%M:%S"
relevant_houseHoldPowerDT$DateTime <- as.POSIXct(paste(relevant_houseHoldPowerDT$Date, relevant_houseHoldPowerDT$Time), format = "%d/%m/%Y %H:%M:%S")

## creating png
# open the device
png(file = "plot4.png")

# create 2 coloumns and 2 rows for 4 graphs
par(mfrow = c(2, 2))

# plot 1
plot(x = relevant_houseHoldPowerDT$DateTime, y = relevant_houseHoldPowerDT$Global_active_power,type="l", xlab ="", ylab = "Global active power")

# plot 2
plot(x = relevant_houseHoldPowerDT$DateTime, y = relevant_houseHoldPowerDT$Voltage, type="l", xlab ="datetime", ylab = "Voltage")

# plot 3
plot(x = relevant_houseHoldPowerDT$DateTime, y = relevant_houseHoldPowerDT$Sub_metering_1,type="l", main = "Energy sub metering", xlab ="", ylab = "Energy sub metering")
lines(relevant_houseHoldPowerDT$DateTime, relevant_houseHoldPowerDT$Sub_metering_2,type="l",col = "red")
lines(relevant_houseHoldPowerDT$DateTime, relevant_houseHoldPowerDT$Sub_metering_3,type="l",col = "blue")
legend("topright", lty=1, col=c("black","red","blue"),legend=c("Sub_metering_1","Sub_metering_2","Sub_metering_3"), bty = 'n', cex=.75)
# plot 4
plot(x = relevant_houseHoldPowerDT$DateTime, y = relevant_houseHoldPowerDT$Global_reactive_power ,type="l", xlab ="datetime", ylab = "Global reactive power")


# close the device
dev.off()
