#Read file, merge date and time columns and transform it into a date
household_power_consumption <- read.table(file = "./household_power_consumption.txt", stringsAsFactors = FALSE, header = TRUE, sep = ";", na.strings = "?")
household_power_consumption <- household_power_consumption[household_power_consumption$Date %in% "1/2/2007" | household_power_consumption$Date %in% "2/2/2007",]
household_power_consumption$Date <- as.Date(household_power_consumption$Date,"%d/%m/%Y")
household_power_consumption$Time <- format(household_power_consumption$Time,format = "%T")
household_power_consumption$DateTime <- as.POSIXct(paste(household_power_consumption$Date, household_power_consumption$Time, sep = " "), "%d/%m/%Y %H:%M:%S")

#Plot 4
par(mar = c(3,5,2,2), mfrow=c(2,2))
plot(household_power_consumption$DateTime, household_power_consumption$Global_active_power, type = "l", xlab = "", ylab = "Global Active Power")
plot(household_power_consumption$DateTime, household_power_consumption$Voltage , type = "l", xlab = "datetime", ylab = "Voltage")
plot(household_power_consumption$DateTime, household_power_consumption$Sub_metering_1 , type="l", xlab="", ylab="Energy sub metering")
lines(household_power_consumption$DateTime,household_power_consumption$Sub_metering_2,col="red")
lines(household_power_consumption$DateTime,household_power_consumption$Sub_metering_3,col="blue")
legend("topright", col=c("black","red","blue"), c("Sub_metering_1  ","Sub_metering_2  ", "Sub_metering_3  "),lty=c(1,1), bty="n", cex = 0.7)
plot(household_power_consumption$DateTime, household_power_consumption$Global_reactive_power ,type = "l", xlab = "datetime", ylab = "Global_reactive_power")
dev.copy(png, file="plot4.png", width=480, height=480)
dev.off()
 