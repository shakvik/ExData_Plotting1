
##Read raw file
house<-read.table(file="./household_power_consumption.txt",header=TRUE,sep=";",na.strings="?",colClasses = c("factor", "factor", "numeric", "numeric", "numeric", "numeric", "numeric", "numeric", "numeric"))

##create tidy data
library(dplyr)
house<-mutate(house,date=as.Date(Date,"%d/%m/%Y"))
house<-filter(house,date=="2007-02-01"|date=="2007-02-02")
house<-house[,c(10,2:9)]

#plot
plot(house$Global_active_power,type='l',xaxt='n',ylab="Global Active Power (kilowatts)",xlab="")
axis(1,at=c(0,1500,2900),labels=c("Thu","Fri","Sat"))
