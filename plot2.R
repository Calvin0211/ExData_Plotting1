hhdata<-read.csv2("household_power_consumption.txt",header = TRUE,sep=";",na.strings = "?")
hhdata$Date=as.Date(as.character(hhdata$Date),"%d/%m/%Y")
hhdata2<-hhdata[hhdata$Date == "2007-02-01" ,]
hhdata3<-hhdata[hhdata$Date == "2007-02-02" ,]
hhdata4<-rbind(hhdata2,hhdata3)
hhdata5<-hhdata4
hhdata5[,c(3:9)]<-sapply(hhdata5[,c(3:9)],as.character)
hhdata5[,c(3:9)]<-sapply(hhdata5[,c(3:9)],as.numeric)

hhdata5<-within(hhdata5, { datendtime=strptime(paste(Date,Time),"%Y-%m-%d %H:%M:%S")})
with(hhdata5,plot(datendtime,Global_active_power,type="l",xlab=" ",ylab="Global Active Power (kilowatts)")) 
png(filename = "plot2.png")
with(hhdata5,plot(datendtime,Global_active_power,type="l",xlab=" ",ylab="Global Active Power (kilowatts)")) 
dev.off()


