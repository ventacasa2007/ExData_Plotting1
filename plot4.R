plot4 <- function() {
        
        ##First read the data
        total <- read.csv("household_power_consumption.txt",sep=";", header = TRUE, na.strings = "?")
        
        ##Create new field to have date time in the same
        total$DateTime <- paste(total$Date, total$Time, sep= " ")
        total$DateTime <- strptime(total$DateTime,format="%d/%m/%Y %H:%M:%S")
        
        ##Convert field data to date/time
        total$Date <- as.Date(total$Date,format='%d/%m/%Y')
        
        ##Subset the data to get only the requiered
        parcial <- subset(total, total$Date == "2007-02-01" | total$Date == "2007-02-02")
     
        ##Define de canvan for tha grafics
        par(mfrow = c(2, 2))

        ##copy to a png
        dev.copy(png, file = "plot4.png",width = 480, height = 480) 
        
        ##Fist grafic
        plot(parcial$DateTime,parcial$Global_active_power, ylab = "Global Active Power",xlab= "", pch="",cex.axis = 0.5, cex.lab = 0.5)
        lines(parcial$DateTime,parcial$Global_active_power)
        
        ##Second grafic
        plot(parcial$DateTime,parcial$Voltage, ylab = "Voltage",xlab= "datetime", pch="",cex.axis = 0.5,cex.lab = 0.5)
        lines(parcial$DateTime,parcial$Voltage)
        
        ##Third grafic
        plot(parcial$DateTime,parcial$Sub_metering_1,main = "", type = "n", ylab = "Energy sub metering", xlab = "",cex.axis = 0.5)
        points(parcial$DateTime,parcial$Sub_metering_1,pch=".")
        lines(parcial$DateTime,parcial$Sub_metering_1,col = "black")
        points(parcial$DateTime,parcial$Sub_metering_2, col = "red",pch=".")
        lines(parcial$DateTime,parcial$Sub_metering_2,col = "red")
        points(parcial$DateTime,parcial$Sub_metering_3, col = "blue",pch=".")
        lines(parcial$DateTime,parcial$Sub_metering_3,col = "blue")
        
        
        legend("topright", lty=1 , bty = "n", col = c("black","blue", "red"), legend = c("Sub_metering_1", "Sub_metering_2","Sub_metering_3"), cex=0.5)
        
        ##Fourth grafic
        plot(parcial$DateTime,parcial$Global_reactive_power, ylab = "Global_reactive_power",xlab= "datetime", pch="",cex.axis = 0.5,cex.lab = 0.5)
        lines(parcial$DateTime,parcial$Global_reactive_power)    
        ##axis(2, at = seq(0.0, 0.5, by = 0.1),las=2)
        
        ##Close png device
        dev.off() 
}
