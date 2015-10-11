#set up for 2 x 2 plots
par(mfrow = c(2, 2))
file<-"household_power_consumption.txt"

#get raw data 
edaass1<-read.table(paste(path,file,sep="\\"),sep=";")

#convert the Date and Time variables to Date/Time classes in R using the strptime() and as.Date() functions
edaass1$V10<-strptime(paste(edaass1$V1,edaass1$V2),"%d/%m/%Y %H:%M:%S")

#This code selects the Global Active Power column in the data set (V3)
needed<-subset(edaass1,V10>="2007-02-01 00:00:00" & V10<"2007-02-03 00:00:00",select = c(V3,V4,V5,V7,V8,V9,V10))

#Initialise x labels
x=c("Thur","Fri","Sat")

#Plot 1
plot(as.character(needed$V3),xaxt="n",xlab="",ylab = "Global Acive Power (kilowatts)",type="l")
axis(1,at=c(1,1440,2880),labels=x)


#Plot 2
plot(as.character(needed$V5),xaxt="n",xlab="datetime",ylab = "Voltage",type="l")
axis(1,at=c(1,1440,2880),labels=x)

#Plot 3
plot(as.character(needed$V7),xaxt="n",xlab="",ylab = "Energy sub metering",type="l")
axis(1,at=c(1,1440,2880),labels=x)
lines(as.character(needed$V8),col="red")
lines(as.character(needed$V9),col="blue")


#Plot 4
plot(as.character(needed$V4),xaxt="n",xlab="datetime",ylab = "Global_Reactive_Power",type="l")
axis(1,at=c(1,1440,2880),labels=x)
dev.copy(png, file = "plot4.png") ## Copy my plot to a PNG file
dev.off() ## Don't forget to close the PNG device!