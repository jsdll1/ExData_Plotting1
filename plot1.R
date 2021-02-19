plot1 <- function () {
  
  library(dplyr)
   data <- as_tibble(read.table("./household_power_consumption.txt", header = TRUE, sep = ";", 
             na.strings = "?"))
   filteredData <- data %>% filter(Date == "1/2/2007" | Date == "2/2/2007") %>%
     mutate(Date = as.Date(Date, format ="%d/%m/%Y")) %>%
     mutate(DateTime = strptime(paste(Date,Time), format ="%Y-%m-%d %H:%M:%S" ))
   
   hist(filteredData$Global_active_power, col = "red", main = "Global Active Power",
        ylab = "Frequency", xlab = "Global Active Power (kilowatts)")
   dev.copy(png, file = "plot1.png" )
   dev.off()
   
}