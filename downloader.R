
# Download File and Read table --------------------------------------------

downloader <- function(){
  
  library(dplyr)
  library(lubridate)
  library(tidyr)
  setwd("C:/Users/ecaeshh/Documents/R Programs DIrectory/ExData_Plotting1")
  
  if(!file.exists("household_power_Consumption.txt")){
    
    fileurl<- "https://d396qusza40orc.cloudfront.net/exdata%2Fdata%2Fhousehold_power_consumption.zip"
    temp<-tempfile()
    filelocation<-file.path(getwd())
    download.file(fileurl,destfile = temp)
    unzip(temp,exdir = filelocation)
  }
  
  flpath <-file.path(getwd(),"household_power_consumption.txt")
  hpc <- tbl_df(read.csv(flpath,stringsAsFactors = FALSE,sep = ";"))
  
  #Convert Date variable into DAte class
  hpc <- mutate(hpc, Date = dmy(hpc$Date)) 
  
  #convert time variable into POSIXT
  datetime <- paste(hpc$Date,hpc$Time)
  datetime <- ymd_hms(datetime) #define format
  hpc <- mutate(hpc, Time = datetime) # convert time variable into POSIXT
 
  #convert variables 3 -> 9 to numeric
  hpc <- mutate(hpc, Global_active_power = as.numeric(Global_active_power))
  hpc <- mutate(hpc, Global_reactive_power = as.numeric(Global_reactive_power))
  hpc <- mutate(hpc, Voltage = as.numeric(Voltage))
  hpc <- mutate(hpc, Global_intensity = as.numeric(Global_intensity))
  hpc <- mutate(hpc, Sub_metering_1 = as.numeric(Sub_metering_1))
  hpc <- mutate(hpc, Sub_metering_2 = as.numeric(Sub_metering_2))
  hpc <- mutate(hpc, Sub_metering_3 = as.numeric(Sub_metering_3))
  #hpc<-na.omit(hpc)
  #Create global variables
  hpc <<- hpc
  feb2007hpc <<- filter(hpc,Date == dmy(c("2/2/2007","1/2/2007")))
  
  print("household Power Consumption table is created with variable name: hpc, feb2007hpc.
        feb2007hps is filtered on first and second of Febraury 2007")
 
  }