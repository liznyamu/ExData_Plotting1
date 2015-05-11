plot1 <- function(makePNG = TRUE){
        if(makePNG){
                png(file = "plot1.png", width = 480, 
                    height = 480)     
        }
        
        hist(as.numeric(hpc[, 1]),
             xlab = "Global Active Power (kilowatts)", 
             main = "Global Active Power", col = "red")
        par(col = "black")
        
        if(makePNG){
                dev.off()      
        }
}