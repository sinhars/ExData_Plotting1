plot4 <- function() {

    # Read data from txt file
    
    dt <- read.table("household_power_consumption.txt", header = TRUE, sep = ";", na.strings = "?")
    
    # Convert Date/Time columns to the correct datatype 
    
    dt$Date <- as.Date(dt$Date, format = "%d/%m/%Y")
    
    # Filter data to keep only the 2 relevant dates
    
    dt <- subset(dt, (Date == "2007-02-01" | Date == "2007-02-02"))
    
    # Create a new DateTime column with combined date and time
    
    dt$DateTime <- as.POSIXct(paste(dt$Date, dt$Time), format="%Y-%m-%d %H:%M:%S")
    
    # Create plot4.png
    
    png("plot4.png", width = 480, height = 480, units = "px")
    
    par(mfrow = c(2,2))
    plot(dt$DateTime, dt$Global_active_power, type = "l", xlab = '', ylab = "Global Active Power (kilowatts)")
    plot(dt$DateTime, dt$Voltage, type = "l", xlab = "datetime", ylab = "Voltage")
    plot(dt$DateTime, dt$Sub_metering_1, type = "n", xlab = '', ylab = "Energy sub metering")
    points(dt$DateTime, dt$Sub_metering_1, col = "black", type = "l")
    points(dt$DateTime, dt$Sub_metering_2, col = "red", type = "l")
    points(dt$DateTime, dt$Sub_metering_3, col = "blue", type = "l")
    legend("topright", legend = c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3"), col = c("black", "red", "blue"), lty = c(1, 1, 1), pch = c(NA, NA, NA), bty = "n")
    plot(dt$DateTime, dt$Global_reactive_power, type = "l", xlab = "datetime", ylab = "Global_reactive_power")
    
    dev.off()
        
}

plot4()