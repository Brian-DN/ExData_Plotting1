#Read data
d<-read.table("household_power_consumption.txt",header = TRUE,sep = ";")
#Format numeric
d$Global_active_power<-as.numeric(d$Global_active_power)
d$Sub_metering_1<-as.numeric(d$Sub_metering_1)
d$Sub_metering_2<-as.numeric(d$Sub_metering_2)
d$Sub_metering_3<-as.numeric(d$Sub_metering_3)
#Add column datetime
datetime<-as.POSIXlt(paste(d$Date,d$Time),format = "%d/%m/%Y %H:%M:%S")
d<-data.frame(d,datetime)
#Subset data with datetime from 2007-02-01 00:00:00 to 2007-02-02 23:59:00
d<-subset(d,datetime>="2007-02-01 00:00:00"&datetime<="2007-02-02 23:59:00")
#Create plot
plot(d$datetime,d$Sub_metering_1,ylab = "Energy sub metering",xlab = "",type = "l")
points(x=d$datetime,y=d$Sub_metering_2,col="red",type = "l")
points(x=d$datetime,y=d$Sub_metering_3,col="blue",type = "l")
legend("topright",legend = c("Sub_metering_1","Sub_metering_2","Sub_metering_3"),col = c("black","red","blue"),lwd=1)
#Copy to png
dev.copy(png,file="plot3.png")
dev.off()