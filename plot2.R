plot2 <- function() {
    
    # Read data from txt file
    
    dt <- read.table("household_power_consumption.txt", header = TRUE, sep = ";", na.strings = "?")
    
    # Convert Date/Time columns to the correct datatype 
    
    dt$Date <- as.Date(dt$Date, format = "%d/%m/%Y")
    
    # Filter data to keep only the 2 relevant dates
    
    dt <- subset(dt, (Date == "2007-02-01" | Date == "2007-02-02"))
    
    # Create a new DateTime column with combined date and time
    
    dt$DateTime <- as.POSIXct(paste(dt$Date, dt$Time), format="%Y-%m-%d %H:%M:%S")
    
    # Create plot2.png
    
    png("plot2.png", width = 480, height = 480, units = "px")
    plot(dt$DateTime, dt$Global_active_power, type = "l", xlab = '', ylab = "Global Active Power (kilowatts)")
    dev.off()
    
}

plot2()
