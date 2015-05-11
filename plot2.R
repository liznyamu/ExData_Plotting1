plot2 <- function(makePNG = TRUE){
        if(makePNG){
                png(file = "plot2.png", width = 480, 
                    height = 480)    
        }
        
        par(col = "black") # reset col to black
        plot(hpc[,8], as.numeric(hpc[,1]) , 
             type="l", xlab="",
             ylab="Global Active Power (kilowatts)")
       
        lines(hpc[,8], as.numeric(hpc[,1]), col = "black")
        
        if(makePNG){
                dev.off()      
        }
}