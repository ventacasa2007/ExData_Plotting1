plot1 <- function() {

        ##First read the data
        total <- read.csv("household_power_consumption.txt",sep=";", header = TRUE, na.strings = "?")
        
        ##Convert field data to date/time
        total$Date <- as.Date(total$Date,format='%d/%m/%Y')
        
        ##Subset the data to get only the requiered
        parcial <- subset(total, total$Date == "2007-02-01" | total$Date == "2007-02-02")
        
        ##Build the histogram
        hist(parcial$Global_active_power, xlab = "Global Active Power (Kilowatts)",col="red", main = "Global Active Power")
        
        ##copy to a png
        dev.copy(png, file = "plot1.png",width = 480, height = 480) 
        
        ##Close png device
        dev.off() 
}
