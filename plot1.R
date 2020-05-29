library(dplyr)
library(lubridate)

#dowload the dataset for household power consumption and load table into hpc, feb2007hpc
downloader()
plot1 <- function(){
  
hist(feb2007hpc$Global_active_power, col = "red",xlab = "Global Active Power (Kilowatts)", ylab = "Frequencey", main = "Global Active Power")
}

dev.copy(png, file="plot1.png", height=480, width=480)
dev.off()