## plot1.R

# reading data
houseHoldPowerDT <- read.table("household_power_consumption.txt", skip = 1, na.strings="?", sep=";")

# name the columns
names(houseHoldPowerDT)<- c("Date","Time","Global_active_power","Global_reactive_power","Voltage","Global_intensity","Sub_metering_1","Sub_metering_2","Sub_metering_3")

# new datatable with relevant dates
relevant_houseHoldPowerDT <- subset(houseHoldPowerDT, houseHoldPowerDT$Date == "1/2/2007" | houseHoldPowerDT$Date == "2/2/2007")

## creating png
# open the device
png(file = "plot1.png")
#create a histogram
hist(relevant_houseHoldPowerDT$Global_active_power, col = "red", xlab = "Global active power (kilowatts)", main =  "Global active power")
# close the device
dev.off()