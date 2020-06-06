setwd("C:/Users/calvin/Desktop/Vacation Study Calvin/Exploratory Analysis/Week 1")
hhdata<-read.csv2("household_power_consumption.txt",header = TRUE,sep=";",na.strings = "?")
hhdata$Date=as.Date(as.character(hhdata$Date),"%d/%m/%Y")
##hhdata$Time=(hhdata$Time)

##hhdata$Time=strptime(hhdata$Time,format = "%H:%M:%S")
hhdata2<-hhdata[hhdata$Date == "2007-02-01" ,]
hhdata3<-hhdata[hhdata$Date == "2007-02-02" ,]
hhdata4<-rbind(hhdata2,hhdata3)
hhdata5<-hhdata4
hhdata6<-hhdata4
hhdata5[,c(3:9)]<-sapply(hhdata5[,c(3:9)],as.character)
hhdata5[,c(3:9)]<-sapply(hhdata5[,c(3:9)],as.numeric)

png(filename = "plot1.png")
hist(hhdata5$Global_active_power,col="red",main="Global Active Power",xlab = "Global Active Power (kilowatts)",ylab="Frequency")
dev.off()



