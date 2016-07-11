library(dplyr)

h_consump <- read.csv("household_power_consumption.txt", header=TRUE, sep=";", na.strings="?")
#head(h_consump)

#filter feb 1st and 2nd data
feb_h_consump <- filter(h_consump, Date %in% c("1/2/2007", "2/2/2007"))

feb_DateTime <- paste(feb_h_consump$Date, feb_h_consump$Time)

feb_h_consump$DateTime <- strptime(feb_DateTime, "%d/%m/%Y %H:%M:%S")

#open and name the plot as plot4.png
png("plot4.png", height=480, width=480)

par(mfcol=c(2, 2))

#draw plot 1
plot(feb_h_consump$DateTime, feb_h_consump$Global_active_power, xlab="", ylab="Global Active Power (kilowatts)", type="l")

plot(feb_h_consump$DateTime, feb_h_consump$Sub_metering_1, col="black", xlab="", ylab = "Energy sub metering", type='l')

lines(feb_h_consump$DateTime, feb_h_consump$Sub_metering_2, col="red")
lines(feb_h_consump$DateTime, feb_h_consump$Sub_metering_3, col="blue")

#add legend
legend("topright", legend = c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3"), col=c("black", "red", "blue"))

#draw plot 3
plot(feb_h_consump$DateTime, feb_h_consump$Voltage, xlab="datetime", ylab="Voltage", type="l")

#draw plot 4
plot(feb_h_consump$DateTime, feb_h_consump$Global_reactive_power, xlab="datetime", ylab="Global_reactive_power", type="l")

#close the device
dev.off()

