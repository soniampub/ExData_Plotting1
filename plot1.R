library(dplyr)
h_consump <- read.csv("household_power_consumption.txt", header=TRUE, sep=";")
#head(h_consump)

feb_h_consump <- filter(h_consump, Date %in% c("1/2/2007", "2/2/2007"))

png("plot1.png", height=480, width=480)

g_active <- feb_h_consump$Global_active_power
hist(g_active, xlab = "Global Active Power (kilowatts)", c="red",main="Global Active Power" )

dev.off()