## Function plot2
# generatePNG = TRUE, use png graphical device

plot2 <- function(generatePNG = TRUE){
  
  if(generatePNG){
    ## Construct the plot and save it to a PNG file with a 
    #width of 480 pixels and a height of 480 pixels.
    png(file = "plot2.png", width = 480, height = 480)
  }
  
  ## Create a Generic X-Y Plot, plot()
  # x = "Date_Time", y = "Global_active_power"
  with(hpc,
       plot(x = Date_Time,
            y = Global_active_power,
            type = "l",
            xlab = "",
            ylab = "Global Active Power (kilowatts)",
            col = "black"))
  
  if(generatePNG){
    ## close png graphical device
    dev.off()
  }
}