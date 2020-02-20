#reading data 
dataFile <-"household_power_consumption.txt"
data <-read.table(dataFile, header=TRUE,sep=";",stringsAsFactors=FALSE,dec=".")

#names data 
names(power) <-c("Date","Time","Global_active_power","Global_reactive_power","Voltage","Global_intensity","Sub_metering_1","Sub_metering_2","Sub_metering_3")

#subsetting data to correct dates 
subpower <-data[data$Date %in% c("1/2/2007","2/2/2007"),]

#call basic plot function 
png("plot1.png",width=480,height=480)
hist(as.numeric(as.character(subpower$Global_active_power)),col="red",main="Global Active Power",xlab="Global Active Power(kw)")

#annotating 
title(main="Global Active Power")

dev.off()