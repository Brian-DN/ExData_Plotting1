#Read data
d<-read.table("household_power_consumption.txt",header = TRUE,sep = ";")
#Format numeric
d$Global_active_power<-as.numeric(d$Global_active_power)
#Add column datetime
datetime<-as.POSIXlt(paste(d$Date,d$Time),format = "%d/%m/%Y %H:%M:%S")
d<-data.frame(d,datetime)
#Subset data with datetime from 2007-02-01 00:00:00 to 2007-02-02 23:59:00
d<-subset(d,datetime>="2007-02-01 00:00:00"&datetime<="2007-02-02 23:59:00")
#Create plot
plot(d$datetime,d$Global_active_power,ylab = "Global Active Power (kilowatts)",xlab = "",type = "l")
#Copy to png
dev.copy(png,file="plot2.png")
dev.off()