#Reading data from created csv file
data <- read.csv("household_power_consumption.csv",header=TRUE)

#Plotting 
plot(strptime(paste(data$Date, data$Time, sep = " "),"%d/%m/%Y %H:%M:%S"),
     data$Global_active_power,type="l",ylab="Global Active Power (kilowatts)",
     xlab="")

###################### Save plot as PNG device ###########################
dev.copy(png, file="plot2.png") # save plot to png image 
dev.off() #Closing device
