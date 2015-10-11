#set up for 1 x 1 plot
par(mfrow = c(1, 1))
file<-"household_power_consumption.txt"

#get raw data 
edaass1<-read.table(paste(path,file,sep="\\"),sep=";")

#convert the Date and Time variables to Date/Time classes in R using the strptime() and as.Date() functions
edaass1$V10<-strptime(paste(edaass1$V1,edaass1$V2),"%d/%m/%Y %H:%M:%S")

#This code selects the Global Active Power column in the data set (V3)
needed<-subset(edaass1,V10>="2007-02-01 00:00:00" & V10<"2007-02-03 00:00:00",select = c(V3,V4,V5,V7,V8,V9,V10))

#Initialise x labels
x=c("Thur","Fri","Sat")

#plot the three Energy sub metering variables
plot(as.character(needed$V7),xaxt="n",xlab="",ylab = "Energy sub metering",type="l")
axis(1,at=c(1,1440,2880),labels=x)
lines(as.character(needed$V8),col="red")
lines(as.character(needed$V9),col="blue")
legend(x="topright",legend=c("Sub_metering_1","Sub_metering_2","Sub_metering_3"),lty=c(1,1,1),lwd=c(2,2,2),col=c("black","red","blue"))
dev.copy(png, file = "plot3.png") ## Copy my plot to a PNG file
dev.off() ## Don't forget to close the PNG device!
