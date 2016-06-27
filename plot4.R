
##Read raw file
house<-read.table(file="./household_power_consumption.txt",header=TRUE,sep=";",na.strings="?",colClasses = c("factor", "factor", "numeric", "numeric", "numeric", "numeric", "numeric", "numeric", "numeric"))

##create tidy data
library(dplyr)
house<-mutate(house,date=as.Date(Date,"%d/%m/%Y"))
house<-filter(house,date=="2007-02-01"|date=="2007-02-02")
house<-house[,c(10,2:9)]



#plot
par(mfrow=c(2,2))

plot(house$Global_active_power,type='l',xaxt='n',ylab="Global Active Power",xlab="")
axis(1,at=c(0,1500,2900),labels=c("Thu","Fri","Sat"))

plot(house$Voltage,type='l',ylab="Voltage",xlab="datetime",xaxt='n')
axis(1,at=c(0,1500,2900),labels=c("Thu","Fri","Sat"))

plot(house$Sub_metering_1,type='l',col="black",ylab="Energy sub metering",xaxt='n',xlab="")
lines(house$Sub_metering_2,type='l',col="red")
lines(house$Sub_metering_3,type='l',col="blue")
legend("topright",pch="_____",col=c("black","red","blue"),legend=c("Sub_metering_1","Sub_metering_2","Sub_metering_3"))
axis(1,at=c(0,1500,2900),labels=c("Thu","Fri","Sat"))

plot(house$Global_reactive_power,type='o',pch=".",xaxt='n',xlab="datetime",ylab="Global_reactive_power")
axis(1,at=c(0,1500,2900),labels=c("Thu","Fri","Sat"))
axis(1,at=c(0,1500,2900),labels=c("Thu","Fri","Sat"))

par(mfrow=c(1,1))

