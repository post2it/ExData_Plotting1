plot4 <- function () {
  #Assigment for Project 1, Plot4 due Nov 9. Creates plot4.png file in directory. 
  
  #Note this repo is from last month as I was in the class last time and had to drop
  #due to a project at work. So I am retaking the class this month. This continued from 
  #my work from that class.
  
  library(graphics)
  #In the requirement the professor did not specify that you were required to read in the entire data set.
  #Hence, it would be a waste of computing resources and space to do so. Since the file is
  #non changing and limited to only this homework I limited the data read in to the data required 
  #by the professor for the assignement. 
  
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
  par(mar=c(4,5,2,1))
  par(mfrow = c(2,2))
  #plot 1
  par(tcl= -0.5)
  plot(data$DateTime,data$Global_active_power, type="l", ylab="Global Active Power", xlab="")

  #plot 2
  plot(data$DateTime,data$Voltage, type="l", ylab="Voltage", xlab="datetime", yaxt="n")
  #two axis one with labels and one with only tick marks
  par(tcl= -0.5)
  axis(2,at = c(234,238,242,246), labels = c(234,238,242,246) )
  axis(2, at =c(236,240,244), labels=F)


  #plot 3
  #legend remove box redo spacing from graph three
  plot(data$DateTime,data$Sub_metering_1,  type="l", ylab="Energy sub metering",xlab="", col= "black")
  lines(data$DateTime,data$Sub_metering_2, col="red", type="l")
  lines(data$DateTime,data$Sub_metering_3, col="blue", type="l")
  legend("topright",adj=0, col=c("black", "red", "blue"), c("Sub_metering_1","Sub_metering_2", "Sub_metering_3"),
         text.width = strwidth("1,1,1"),bty="n",cex=.45,pt.cex=12,xjust=1,lwd=2 )

  #plot 4
  plot(data$DateTime,data$Global_reactive_power, type="l", ylab="Global_reactive_power", xlab="datetime", yaxt="n")
  #added tick and labels desired and decreased font 
  axis(2,at = c(0.0,0.1,0.2,0.3,0.4,0.5), labels = c(0.0,0.1,0.2,0.3,0.4,0.5), cex.axis=.8 )

  dev.copy(png,file= "plot4.png")
  dev.off()

}