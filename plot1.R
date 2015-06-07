## Function plot1
# generatePNG = TRUE, use png graphical device

plot1 <- function(generatePNG = TRUE){
  
  if(generatePNG){
    ## Construct the plot and save it to a PNG file with a 
    #width of 480 pixels and a height of 480 pixels.
    png(file = "plot1.png", width = 480, height = 480)
  }
  
  ## create a histogram - on "Global_active_power"
  with(hpc, hist(as.numeric(Global_active_power),
                 xlab = "Global Active Power (kilowatts)",
                 main = "Global Active Power",
                 col = "red"))
  
  ## reset color parameter to "black"
  par(col = "black")
  
  if(generatePNG){
    ## close png graphical device
    dev.off()
  }
}