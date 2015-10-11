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

plot(as.character(needed$V3),xaxt="n",xlab="",ylab = "Global Acive Power (kilowatts)",type="l")
axis(1,at=c(1,1440,2880),labels=x)
dev.copy(png, file = "plot2.png") ## Copy my plot to a PNG file
dev.off() ## Don't forget to close the PNG device!