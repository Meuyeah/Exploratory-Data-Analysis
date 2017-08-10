## Read the table
data  <- read.table("household_power_consumption.txt",sep=";",header=TRUE,na.strings = "?")
##Subsetting the data
subdata<- subset(data,(data$Date=="1/2/2007" | data$Date=="2/2/2007"))
## Plot 1
png("plot1.png", width = 480, height = 480)
hist(subdata$Global_active_power,main="Globlal Active Power",col="red",ylab="Frequency" ,xlab="Global Active Power (kilowats)")
dev.off()


