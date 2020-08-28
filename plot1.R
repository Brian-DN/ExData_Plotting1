#Read data
d<-read.table("household_power_consumption.txt",header = TRUE,sep = ";")
#Format as Date
d$Date<-as.Date(d$Date,"%d/%m/%Y")
#Subset data with date from "2007-02-01" to "2007-02-02"
d<-subset(d,Date>="2007-02-01"&Date<="2007-02-02")
#Format numeric
d$Global_active_power<-as.numeric(d$Global_active_power)
#Create plot1
hist(d$Global_active_power,col="red",xlab = "Global Active Power (kilowatts)",main = "Global Active Power",ylab = "Frequency")
#Copy to PNG
dev.copy(png,file="plot1.png")
dev.off()