plot2 <- function () {
  
  library(dplyr)
   data <- as_tibble(read.table("./household_power_consumption.txt", header = TRUE, sep = ";", 
             na.strings = "?"))
   filteredData <- data %>% filter(Date == "1/2/2007" | Date == "2/2/2007") %>%
     mutate(Date = as.Date(Date, format ="%d/%m/%Y")) %>%
     mutate(DateTime = strptime(paste(Date,Time), format ="%Y-%m-%d %H:%M:%S" ))
   
   with(filteredData, plot(DateTime, Global_active_power, type = "l", 
                           xlab = "", ylab = "Global Active Power (kilowatts)"))
   dev.copy(png, file = "plot2.png" )
   dev.off()
}