##
## File name - plot3.r
## Description:- 
## Plot multi elements for sub metering 1, 2, and 3
## against the date time
## use the date for dates 1st Feb 2007 and 2nd Feb 2007
## Approach:-
## Read the lines in file one by one as records are huge
## see if its the specified date frame 
## if yes add it to data.frame
## else discard it
## Use the filtred data to plot the graph
##
##
## Open file connection
file <- file("household_power_consumption.txt", "r")

## First line is the column names
col_names <- readLines(file, n=1)
fileLine <- col_names

## set insert position to 1
insert_position <- 1

## create emmpty dataframe for 2007 feb date 01, 02 
df_household_2007 <- NULL

## Loop untill the End of file
while(length(fileLine) > 0) {
  
  fileLine <- readLines(file, n=1)  
  
  if(length(fileLine) <= 0 )
    break()
  
  vecdata <-  unlist(strsplit(fileLine, "[;]"))
  date_data <- vecdata[1]
  ## if date is 01 feb 2007 or 02 feb 2007 then only procees
  ## actullay I tried using the regular expression but it was failing
  ## may need to work more on it , but following works great
  if(date_data == "1/2/2007" | date_data=="2/2/2007"){
    print(fileLine)  
    
    for( elements in 1:length(vecdata)) {
      if(vecdata[elements] == "?"){
        
        nadataobserved <- TRUE
        vecdata[elements] <- NA
      }       
    }
    
    
    date_time_str <- paste(vecdata[1], vecdata[2])
    date_time_st <- strptime(date_time_str, "%d/%m/%Y %H:%M:%S")
    
    rbind(df_household_2007,data.frame(DateTime = date_time_st,
                                       Global_active_power = as.numeric(vecdata[3]),
                                       Global_reactive_power= as.numeric(vecdata[4]),
                                       Voltage = as.numeric(vecdata[5]),
                                       Global_intensity = as.numeric(vecdata[6]),
                                       Sub_metering_1 = as.numeric(vecdata[7]),
                                       Sub_metering_2 = as.numeric(vecdata[8]),
                                       Sub_metering_3 = as.numeric(vecdata[9])
    )) -> df_household_2007
    
    insert_position <- insert_position + 1
    print(insert_position)
    
  }
  
}

## close file connection
close(file)

## this part plots on png file, plot3.png
png(".\\plot3.png", width=480, height=480, units="px")

## Plot first the DateTime on X and Sub Metering 1 on Y
plot(x = df_household_2007$DateTime, y = df_household_2007$Sub_metering_1, 
     xlab = "DateTime", ylab = "Energy sub metering", type="l")

## Add line now  DateTime on X and Sub Metering 2 on Y
lines(x = df_household_2007$DateTime, y = df_household_2007$Sub_metering_2, col="red")

## Add line now  DateTime on X and Sub Metering 3 on Y
lines(x = df_household_2007$DateTime, df_household_2007$Sub_metering_3, col="blue")

## Add legends
legend("topright", col = c("black", "red", "blue"), 
       legend = c("Sub_Metering_1", "Sub_Metering_2", "Sub_Metering_3"), lty = 1)

## Finally close the device
dev.off()
