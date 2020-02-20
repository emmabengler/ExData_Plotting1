#reading data 
dataFile <-"household_power_consumption.txt"
data <-read.table(dataFile, header=TRUE,sep=";",stringsAsFactors=FALSE,dec=".")

#names data 
names(power) <-c("Date","Time","Global_active_power","Global_reactive_power","Voltage","Global_intensity","Sub_metering_1","Sub_metering_2","Sub_metering_3")

#subsetting data to correct dates 
subpower <-data[data$Date %in% c("1/2/2007","2/2/2007"),]


#transform date & time variables from characters into objects of date and POSIXlt format 
datetime <-strptime(paste(subpower$Date, subpower$Time,sep=" "),"%d/%m/%Y %H:%M:%S")
globalActivePower <-as.numeric(subpower$Global_active_power)
png("plot2.png",width=480,height=480)
plot(datetime,globalActivePower,type="l",xlab="",ylab="Global Active Power(kilowatts)")
dev.off()
