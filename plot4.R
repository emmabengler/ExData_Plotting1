#reading data 
dataFile <-"household_power_consumption.txt"
data <-read.table(dataFile, header=TRUE,sep=";",stringsAsFactors=FALSE,dec=".")

#names data 
names(power) <-c("Date","Time","Global_active_power","Global_reactive_power","Voltage","Global_intensity","Sub_metering_1","Sub_metering_2","Sub_metering_3")

#subsetting data to correct dates 
subpower <-data[data$Date %in% c("1/2/2007","2/2/2007"),]

#str(subpower)
datetime <-strptime(paste(subpower$Date,subpower$Time,sep=" "), "%d/%m/%Y %H:%M:%S")
globalActivePower <-as.numeric(subpower$Global_active_power)
globalReactivePower <-as.numeric(subpower$Global_reactive_power)
voltage <-as.numeric(subpower$Voltage)
subMetering1 <-as.numeric(subpower$Sub_metering_1)
subMetering2 <-as.numeric(subpower$Sub_metering_2)
subMetering3 <-as.numeric(subpower$Sub_metering_3)

#plot functions 
png("plot4.png",width=480,height=480)
par(mfrow=c(2,2))
plot(datetime,globalActivePower,type="l",xlab="",ylab="Global Active Power",cex=0.2)
plot(datetime,voltage,type="l",xlab="datetime",ylab="Voltage")
plot(datetime,subMetering1,type="l",ylab="Energy Submetering",xlab="")
lines(datetime,subMetering2,type="l",col="red")
lines(datetime,subMetering3,type="l",col="blue")
legend("topright",c("Sub_metering_1","Sub_metering_2","Sub_metering_3"),lty=,lwd=2.5,col=c("black","red","blue"),bty="o")
plot(datetime,globalReactivePower,type="l",xlab="datetime",ylab="Global_reactive_power")
dev.off()