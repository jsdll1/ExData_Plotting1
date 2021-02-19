plot3 <- function () {
  
  library(dplyr)
   data <- as_tibble(read.table("./household_power_consumption.txt", 
                                header = TRUE, sep = ";", na.strings = "?"))
   filteredData <- data %>% filter(Date == "1/2/2007" | Date == "2/2/2007") %>%
     mutate(Date = as.Date(Date, format ="%d/%m/%Y")) %>%
     mutate(DateTime = strptime(paste(Date,Time), format ="%Y-%m-%d %H:%M:%S" ))
   
   with(filteredData, plot(DateTime, Sub_metering_1, type = "l", 
                           xlab = "", ylab = "Energy sub metering"))
   with(filteredData, lines(DateTime, Sub_metering_2, type = "l", col = "red"))
   with(filteredData, lines(DateTime, Sub_metering_3, type = "l", col = "blue"))
   legend("topright", 
          legend = c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3"),
          lwd = c(1,1,1), col = c("black", "red", "blue"))
   dev.copy(png, file = "plot3.png" )
   dev.off()
}