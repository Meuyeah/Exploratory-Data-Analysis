## Read the table
data<- read.table("household_power_consumption.txt",sep=";",header=TRUE,na.strings = "?")
##Convert the dates
data$Date<- as.Date(data$Date,format= "%d/%m/%Y")
##Subsetting the data
subdata<- subset(data,(Date>="2007-02-01" & Date <= "2007-02-02"))
##Convert dates and times
subdata$datetime <- strptime(paste(subdata$Date, subdata$Time),"%Y-%m-%d %H:%M:%S")
subdata$datetime <- as.POSIXct(subdata$datetime)
## Plot 2
png("plot2.png", width = 480, height = 480)
plot(subdata$Global_active_power~subdata$datetime,type="l",ylab="Global Active Power (kilowats)" ,xlab="")
dev.off()