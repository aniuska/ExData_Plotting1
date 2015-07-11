#Filename to read
f<-c("household_power_consumption.txt")

#Reading the file
t<-read.table(f,
              header=TRUE,
              na.string="?",
              colClasses = c("character","character","numeric","numeric","numeric","numeric","numeric","numeric","numeric"),
              comment.char = "",
              stringsAsFactors = FALSE,
              sep=";",
              quote=""
              )

data<-subset(t,t[,1]%in% c("1/2/2007","2/2/2007")) 

#Saving subset to csv file to reuse it for remaining plots
write.csv(file="household_power_consumption.csv", x=data)

#Plotting 
hist(data$Global_active_power,col="red",xlab="Global Active Power (kilowatts)",main="Global Active Power")

###################### Save plot as PNG device ###########################
dev.copy(png, file="plot1.png") # save histogram plot to png image 
dev.off() #Closing device
