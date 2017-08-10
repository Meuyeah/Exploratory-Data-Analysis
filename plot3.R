## Read the table
data<- read.table("household_power_consumption.txt",sep=";",header=TRUE,na.strings = "?")
##Convert the dates
data$Date<- as.Date(data$Date,format= "%d/%m/%Y")
##Subsetting the data
subdata<- subset(data,(Date>="2007-02-01" & Date <= "2007-02-02"))
##Convert dates and times
subdata$datetime <- strptime(paste(subdata$Date, subdata$Time),"%Y-%m-%d %H:%M:%S")
subdata$datetime <- as.POSIXct(subdata$datetime)
## Plot 3
with(subdata,{
  plot(Sub_metering_1~datetime,type="l",ylab="Global Active Power (kilowatts)",xlab="")
    lines(Sub_metering_2~datetime,col="red")
    lines(Sub_metering_3~datetime,col="blue")
    })
legend("topright",col=c("black","red","blue"),lty=1,lwd=2,
       legend=c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3"))
dev.copy(png, file="plot3.png", height=480, width=480)
dev.off()