plot1 <- function () {
  #Assigment for Project 1 due Nov 9. Creates plot1.png file in directory. 
  #Note this repo is from last month as I was in the class last time and had to drop
  #due to a project at work. So I am retaking the class this month. This continued from 
  #my work from that class.
  
    library(graphics)
    #In the requirement the professor did not specify that you were required to read in the entire data set.
    #Hence, it would be a waste of computing resources and space to do so. Since the file is
    #non changing and limited to only this homework I limited the data read in to the data required 
    #by the professor for the assignement. 
    
    # read in data from to limit it from 2007-02-01 to  2007-02-02
    # was able to use skip to go to starting line and nrows to read to last line
    # Since skip is used read the header line is first read then add it back in after dataset constructed. 
  
  header <- read.table('household_power_consumption.txt', nrows = 1, header = FALSE, sep =';', stringsAsFactors = FALSE)
  data = read.table("household_power_consumption.txt", header = FALSE, sep=";", skip = 66637,  nrows = 2880)
  colnames(data)<- unlist(header)
  
  # convert date and time using strptime and as.date add into dataset for later plotting
  data$DateTime <- strptime(paste(data$Date, data$Time), "%d/%m/%Y %H:%M:%S") 
 
  # make plot1 default 480 x 480 plot1.png
  #fix margin for label
  par(mar=c(5,5,4,4))
  hist(data$Global_active_power, xlab="Global Active Power (kilowatts)", col="red", main="Global Active Power" )
  #write png file out to directory
  dev.copy(png,file= "plot1.png")
  #close device
  dev.off()
  
 
}