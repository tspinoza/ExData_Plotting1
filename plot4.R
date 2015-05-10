# plot4.R script file

# read household txt file
household <- read.table("household_power_consumption.txt", header=TRUE, sep = ";", na.strings = "?")

# convert Date and Time fields to DateTime 
household$DateTime <- strptime(paste(household$Date, household$Time),
                               format ="%d/%m/%Y %H:%M:%S")

#subset relevant dates for plotting
hh_sub <- subset(household, DateTime >= "2007-02-01" & DateTime < "2007-02-03")

# Plot 4: Multiple Plots
png(file = "plot4.png", height = 480, width = 480)
par(mfcol = c(2,2))

#Upper LHS Global Active Power line chart
with(hh_sub, plot(DateTime,Global_active_power, type="l", xlab="", ylab="Global Active Power (kilowatts)"))

#lower LHS Energy sub metering plot
with(hh_sub, plot(DateTime,Sub_metering_1, type="n", xlab="", ylab="Energy sub metering"))
with(hh_sub, points(DateTime, Sub_metering_1, type='l', col="black"))
with(hh_sub, points(DateTime, Sub_metering_2, type='l', col="red"))
with(hh_sub, points(DateTime, Sub_metering_3, type='l', col="blue"))
legend("topright", lty=1, bty='n', col=c("black", "red", "blue"), legend=c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3"))

#Upper RHS Voltage line chart
with(hh_sub, plot(DateTime, Voltage, type="l", xlab = "datetime", ylab="Voltage"))

#Lower LHS Global Reactive Power line chart
with(hh_sub, plot(DateTime, Global_reactive_power, type="l", xlab = "datetime", ylab="Global_reactive_power"))

#save file
dev.off()
