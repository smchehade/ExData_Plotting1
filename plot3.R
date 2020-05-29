library(dplyr)
library(lubridate)

#dowload the dataset for household power consumption and load table into hpc, feb2007hpc
downloader()
plot3 <- function(){
with(feb2007hpc,
     {     
       plot(Sub_metering_1~Time, col="black", type="l",xlab = "",ylab = "") 
       lines(Sub_metering_2~Time, col="red", type="l", xlab = "",ylab = "")
       lines(Sub_metering_3~Time, col="blue", type="l", xlab = "",ylab = "")})
title(ylab = "Energy Sub Metering", xlab = "")
legend( "topright",col=c("black", "red", "blue"), lwd=c(1,1,1), 
        legend=c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3"))
}

dev.copy(png, file="plot3.png", height=480, width=480)
dev.off()