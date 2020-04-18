## plot2.R

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
png(file = "plot2.png")
#create a plot 2
plot(x = relevant_houseHoldPowerDT$DateTime, y = relevant_houseHoldPowerDT$Global_active_power,type="l", xlab ="", ylab = "Global active power (kilowatts)")
# close the device
dev.off()