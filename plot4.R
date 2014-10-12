plot4 <- function () {
  #Assigment for Project 1, Plot4 due Oct 12. Creates plot4.png file in directory. 
  
  library(graphics)
  
  # read in data from to limit it from 2007-02-01 to  2007-02-02
  # read the header line is first read then add it back in after dataset constructed. 
  
  # deal with missing data ?  try na.strngs = "?" 
  mainDir <- getwd() 
  header <- read.table('household_power_consumption.txt', nrows = 1, header = FALSE, sep =';', stringsAsFactors = FALSE)
  data = read.table("household_power_consumption.txt", header = FALSE, sep=";", skip = 66637,  nrows = 2880)
  colnames(data)<- unlist(header)
  
  # convert date and time using strptime and as.date add into dataset for later plotting
  data$DateTime <- strptime(paste(data$Date, data$Time), "%d/%m/%Y %H:%M:%S") 
  
  #make 4 plots and set up page for plots
  par(mar=c(4,5,2,2))
  par(mfrow = c(2,2))
  plot(data$DateTime,data$Global_active_power, type="l", ylab="Global Active Power", xlab="")
  plot(data$DateTime,data$Voltage, type="l", ylab="Voltage", xlab="datetime")
  plot(data$DateTime,data$Sub_metering_1, type="l", ylab="Energy sub metering",xlab="", col= "black")
  lines(data$DateTime,data$Sub_metering_2, col="red")
  lines(data$DateTime,data$Sub_metering_3, col="blue")
  legend("topright", pch =1 , col = c("blue", "red", "green"), legend = c("Sub_metering_1","Sub_metering_2", "Sub_metering_3"),cex=0.64)
  plot(data$DateTime,data$Global_reactive_power, type="l", ,ylab="Global_reactive_power", xlab="datetime")
#  plot(data$DateTime,data$Global_reactive_power, type="l", yaxt="n",ylab="Global_reactive_power", xlab="datetime")
  #axis(2, 0:0.5,LETTERS[0.0:0.5])
  dev.copy(png,file= "plot4.png")
  dev.off()

}