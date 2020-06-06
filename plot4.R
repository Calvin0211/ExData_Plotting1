hhdata<-read.csv2("household_power_consumption.txt",header = TRUE,sep=";",na.strings = "?")
hhdata$Date=as.Date(as.character(hhdata$Date),"%d/%m/%Y")
hhdata2<-hhdata[hhdata$Date == "2007-02-01" ,]
hhdata3<-hhdata[hhdata$Date == "2007-02-02" ,]
hhdata4<-rbind(hhdata2,hhdata3)
hhdata5<-hhdata4
hhdata5[,c(3:9)]<-sapply(hhdata5[,c(3:9)],as.character)
hhdata5[,c(3:9)]<-sapply(hhdata5[,c(3:9)],as.numeric)
hhdata5<-within(hhdata5, { datendtime=strptime(paste(Date,Time),"%Y-%m-%d %H:%M:%S")})

png(filename = "plot4.png")
par(mfrow=c(2,2),mar=c(4,4,1,1),oma=c(0,0,0,0))
with(hhdata5,plot(datendtime,Global_active_power,type="l",xlab=" ",ylab="Global Active Power")) 
with(hhdata5,plot(datendtime,Voltage,type="l",xlab="datetime",ylab="Voltage")) 

with(hhdata5,plot(datendtime,Sub_metering_1,xlab=" ",ylab="Energy sub metering",type="l"))
lines(hhdata5$datendtime,hhdata5$Sub_metering_2,col="red")
lines(hhdata5$datendtime,hhdata5$Sub_metering_3,col="blue")
legend("topright",legend =c("Sub_metering_1","Sub_metering_2","Sub_metering_3"),lty=1,col=c("black","red","blue"),bty="n")

with(hhdata5,plot(datendtime,Global_reactive_power,type="l",xlab="datetime",ylab="Global_reactive_power")) 

dev.off()

