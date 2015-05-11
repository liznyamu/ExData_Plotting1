plot3 <- function(makePNG = TRUE){
        if(makePNG){
                png(file = "plot3.png", width = 480, 
                    height = 480)     
        }
        with(hpc, plot(Date_Time, Sub_metering_1, 
                      type = "l", 
                       ylab = "Energy sub metering")) # make line plot
        with(hpc, lines(Date_Time, Sub_metering_2, 
                        col = "red")) # add lines to above plot
        with(hpc, lines(Date_Time, Sub_metering_3, 
                        col = "blue"))# add lines to above plot
        
        # problem with legend
        legend("topright", 
               c("Sub_metering_1", "Sub_metering_2", 
                 "Sub_metering_3"), 
               lty=c(1,1,1), cex = 0.8, 
               col=c("black", "red", "blue"))
              
        
        if(makePNG){
                dev.off()      
        }
}