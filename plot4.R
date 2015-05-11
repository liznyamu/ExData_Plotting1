plot4 <- function(makePNG = TRUE){
        if(makePNG){
                png(file = "plot4.png", width = 480, 
                    height = 480)   
        }
        par(mfrow = c(2, 2), mar = c(4, 4, 2, 1),
            oma = c(0, 0, 2, 0))
        with(hpc, {
                plot1(FALSE)
                plot(Date_Time, Voltage, type = "l", 
                     ylab = "Voltage", xlab = "datetime")
                plot3(FALSE)
                plot(Date_Time, Global_reactive_power, type = "l", 
                      xlab = "datetime")
                
        })
        # reset once done
        par(mfrow = c(1, 1), mar = c(5, 4, 4, 2) + 0.1,
            oma = c(0, 0, 0, 0))

        if(makePNG){
                dev.off()
        }
}