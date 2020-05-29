library(dplyr)
library(lubridate)

#dowload the dataset for household power consumption and load table into hpc, feb2007hpc
downloader()
plot2 <- function(){
 with(feb2007hpc,
      plot(Global_active_power~Time,type = "l",pch =19,cex=0.3, xlab="",ylab = "Global Active Power (Kilowatts)")
 )
}

dev.copy(png, file="plot2.png", height=480, width=480)
dev.off()