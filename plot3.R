# plot3.R script file

# read household txt file
household <- read.table("household_power_consumption.txt", header=TRUE, sep = ";", na.strings = "?")

# convert Date and Time fields to DateTime 
household$DateTime <- strptime(paste(household$Date, household$Time),
                               format ="%d/%m/%Y %H:%M:%S")

#subset relevant dates for plotting
hh_sub <- subset(household, DateTime >= "2007-02-01" & DateTime < "2007-02-03")

# Plot 3: Energy sub metering
png(file = "plot3.png", height = 480, width = 480)
with(hh_sub, plot(DateTime,Sub_metering_1, type="n", xlab="", ylab="Energy sub metering"))
with(hh_sub, points(DateTime, Sub_metering_1, type='l', col="black"))
with(hh_sub, points(DateTime, Sub_metering_2, type='l', col="red"))
with(hh_sub, points(DateTime, Sub_metering_3, type='l', col="blue"))
legend("topright", lty=1, col=c("black", "red", "blue"), legend=c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3"))
dev.off()
