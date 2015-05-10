# plot2.R script file

# read household txt file
household <- read.table("household_power_consumption.txt", header=TRUE, sep = ";", na.strings = "?")

# convert Date and Time fields to DateTime 
household$DateTime <- strptime(paste(household$Date, household$Time),
                               format ="%d/%m/%Y %H:%M:%S")

#subset relevant dates for plotting
hh_sub <- subset(household, DateTime >= "2007-02-01" & DateTime < "2007-02-03")

# Plot 2: Global Active Power by time line chart
png(file = "plot2.png", height = 480, width = 480)
with(hh_sub, plot(DateTime,Global_active_power, type="l", xlab="", ylab="Global Active Power (kilowatts)"))
dev.off()
