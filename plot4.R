## Function plot4
# generatePNG = TRUE, use png graphical device

plot4 <- function(generatePNG = TRUE){
  
  if(generatePNG){
    ## Construct the plot and save it to a PNG file with a 
    #width of 480 pixels and a height of 480 pixels.
    png(file = "plot4.png", width = 480, height = 480)
  }
  
  ## Set graphical Parameters, par()
  par(mfrow = c(2, 2), 
      mar = c(4, 4, 2, 1),
      oma = c(0, 0, 2, 0))
  
  # First Plot
  source("plot1.R")
  plot1(F)
  
  # Second Plot
  with(hpc,
       plot(x = Date_Time,
            y = Voltage,
            type = "l", 
            ylab = "Voltage",
            xlab = "datetime"))
  
  # Third Plot
  source("plot3.R")
  plot3(F)
  
  # Fourth Plot
  with(hpc,
       plot(x = Date_Time,
            y = Global_reactive_power,
            type = "l", 
            xlab = "datetime"))
  
  # reset graphical parameters to defaults
  par(mfrow = c(1, 1), 
      mar = c(5, 4, 4, 2) + 0.1,
      oma = c(0, 0, 0, 0))
  
  if(generatePNG){
    dev.off()
  }
}