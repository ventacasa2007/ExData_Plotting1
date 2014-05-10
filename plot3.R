plot3 <- function() {
        
        ##First read the data
        total <- read.csv("household_power_consumption.txt",sep=";", header = TRUE, na.strings = "?")
        
        ##Create new field to have date time in the same
        total$DateTime <- paste(total$Date, total$Time, sep= " ")
        total$DateTime <- strptime(total$DateTime,format="%d/%m/%Y %H:%M:%S")
        
        ##Convert field data to date/time
        total$Date <- as.Date(total$Date,format='%d/%m/%Y')
        
        ##Subset the data to get only the requiered
        parcial <- subset(total, total$Date == "2007-02-01" | total$Date == "2007-02-02")
        
        ##Build the plot
        plot(parcial$DateTime,parcial$Sub_metering_1,main = "", type = "n", ylab = "Energy sub metering", xlab = "")
        points(parcial$DateTime,parcial$Sub_metering_1,pch=".")
        lines(parcial$DateTime,parcial$Sub_metering_1,col = "black")
        points(parcial$DateTime,parcial$Sub_metering_2, col = "red",pch=".")
        lines(parcial$DateTime,parcial$Sub_metering_2,col = "red")
        points(parcial$DateTime,parcial$Sub_metering_3, col = "blue",pch=".")
        lines(parcial$DateTime,parcial$Sub_metering_3,col = "blue")
        
        ##copy to a png
        dev.copy(png, file = "plot3.png",width = 480, height = 480) 
        
        legend("topright", lty=1 , col = c("black","blue", "red"), legend = c("Sub_metering_1", "Sub_metering_2","Sub_metering_3"), cex=0.75)
        
        
        ##Close png device
        dev.off() 
}
