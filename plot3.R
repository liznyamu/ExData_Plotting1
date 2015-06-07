## Function plot3
# generatePNG = TRUE, use png graphical device

plot3 <- function(generatePNG = TRUE){
  
  if(generatePNG){
    ## Construct the plot and save it to a PNG file with a 
    #width of 480 pixels and a height of 480 pixels.
    png(file = "plot3.png", width = 480, height = 480)
  }
  
  ## Create a Generic X-Y Plot, plot()
  # x = "Date_Time", y = "Sub_metering_1"
  with(hpc,
       plot(x = Date_Time,
            y = Sub_metering_1,
            type = "l",
            xlab = "",
            ylab = "Energy submetering"))
  
  # Add connected line segments to above plot , lines()
  # x = "Date_Time", y = "Sub_metering_2"
  with(hpc,
       lines(x = Date_Time,
             y = Sub_metering_2,
             col = "red"))
  
  # Add connected line segments to above plot , lines()
  # x = "Date_Time", y = "Sub_metering_3"
  with(hpc,
       lines(x = Date_Time,
             y = Sub_metering_3, 
             col = "blue"))
  
  ## Add legend
  legend("topright", 
         c("Sub_metering_1", "Sub_metering_2", 
           "Sub_metering_3"), 
         lty=c(1,1,1), cex = 0.8, 
         col=c("black", "red", "blue"))
  
  if(generatePNG){
    ## close png graphical device
    dev.off()
  }
}