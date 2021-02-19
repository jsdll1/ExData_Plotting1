plot4 <- function () {
  
  library(dplyr)
   data <- as_tibble(read.table("./household_power_consumption.txt", 
                                header = TRUE, sep = ";", na.strings = "?"))
   filteredData <- data %>% filter(Date == "1/2/2007" | Date == "2/2/2007") %>%
     mutate(Date = as.Date(Date, format ="%d/%m/%Y")) %>%
     mutate(DateTime = strptime(paste(Date,Time), format ="%Y-%m-%d %H:%M:%S" ))
   par(mfrow = c(2,2))
   
   #Plot 1
   with(filteredData, plot(DateTime, Global_active_power, type = "l", 
                           xlab = "", ylab = "Global Active Power (kilowatts)"))
   
   #Plot 2
   with(filteredData, plot(DateTime, Voltage, type = "l", 
                           xlab = "datetime", ylab = "Voltage"))
   
   #Plot 3
   with(filteredData, plot(DateTime, Sub_metering_1, type = "l", 
                           xlab = "", ylab = "Energy sub metering"))
   with(filteredData, lines(DateTime, Sub_metering_2, type = "l", col = "red"))
   with(filteredData, lines(DateTime, Sub_metering_3, type = "l", col = "blue"))
   legend("topright", 
          legend = c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3"),
          lwd = c(1,1,1), col = c("black", "red", "blue"))
   
   #Plot 4
   with(filteredData, plot(DateTime, Global_reactive_power, type = "l", 
                           xlab = "datetime"))
   
   #Copy to PNG
   dev.copy(png, file = "plot4.png" )
   dev.off()
}