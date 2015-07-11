#Reading data from created csv file
data <- read.csv("household_power_consumption.csv",header=TRUE)


#Plotting multiple plots
par(mfrow = c(2, 2), mar = c(4, 4, 2, 1), oma = c(0, 0, 2, 0))

#Global active power plot
plot(strptime(paste(data$Date, data$Time, sep = " "),"%d/%m/%Y %H:%M:%S"),
     data$Global_active_power,type="l",ylab="Global Active Power",
     xlab="")

#Voltage plot
plot(strptime(paste(data$Date, data$Time, sep = " "),"%d/%m/%Y %H:%M:%S"),
     data$Voltage,type="l",ylab="Voltage",
     xlab="datetime")

#Energy sub metering plot
plot(strptime(paste(data$Date, data$Time, sep = " "),"%d/%m/%Y %H:%M:%S"),
     data$Sub_metering_1,type="l",
     ylab="Energy sub metering",
     xlab=""
)
lines(strptime(paste(data$Date, data$Time, sep = " "),"%d/%m/%Y %H:%M:%S"),
      data$Sub_metering_2,type="l",
      col="blue"
)
lines(strptime(paste(data$Date, data$Time, sep = " "),"%d/%m/%Y %H:%M:%S"),
      data$Sub_metering_3,type="l",
      col="red"
)

#Energy sub metering plot Legend
legend("topright", pch = 151, col = c("black","blue", "red"), 
       legend = colnames(data)[8:10], text.width =strwidth("100000000000"),
       xjust=0, yjust=0,bty="n",y.intersp = 0.6,
       adj = c(0,0),
       cex=0.75)

#Global reactive power plot
plot(strptime(paste(data$Date, data$Time, sep = " "),"%d/%m/%Y %H:%M:%S"),
     data$Global_reactive_power,type="l",ylab=colnames(data)[3],
     xlab="datetime")

###################### Save plot as PNG device ###########################
dev.copy(png, file="plot4.png") # save plot to png image 
dev.off() #Closing device