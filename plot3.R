####Create several plots with legend###

#Reading data from created csv file
data <- read.csv("household_power_consumption.csv",header=TRUE)

header<-colnames(data)
#Plotting 

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

#Plot Legend
legend("topright", pch = 151, col = c("black","blue", "red"), 
       legend = header[8:10], text.width =strwidth("100000000000"),
        xjust=0, yjust=0,
       cex=0.75)

###################### Save plot as PNG device ###########################
dev.copy(png, file="plot3.png") # save plot to png image 
dev.off() #Closing device