library(dplyr)
library(lubridate)

#dowload the dataset for household power consumption and load table into hpc, feb2007hpc
downloader()

par(mfrow=c(2,2))
with(feb2007hpc, plot2())
with(feb2007hpc, plot(Voltage~Time,type = "l",pch =19,cex=0.3, xlab="datetime",ylab = "Voltage"))
with(feb2007hpc, plot3())
with(feb2007hpc, plot(Global_reactive_power~Time,type = "l",pch =19,cex=0.3, xlab="datetime",ylab = "Voltage"))

dev.copy(png, file="plot4.png", height=480, width=480)
dev.off()