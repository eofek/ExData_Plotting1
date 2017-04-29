
library(sqldf)

setwd("~/Documents/r/coursera/04 exploratory data analysis/week 1/")

##----Select only two days from file----
d0 <- read.csv.sql(
  file="household_power_consumption.txt", 
  sep=";", 
  sql="select * from file where Date='1/2/2007' or Date='2/2/2007'"
  )

##----Review data----
head(d0)
str(d0)
summary(d0)

##----Merge Date and Time columns into separate date-time col----
d0$date.time <- as.POSIXct(
  paste(d0$Date, d0$Time), 
  format="%d/%m/%Y %H:%M:%S"
  )

##----Set local machine timezone to US, to get proper x-labeling----
curr_locale <- Sys.getlocale("LC_TIME")
Sys.setlocale("LC_TIME","en_US")

##----Main plotting function----
png(file="plot3.png", width=480, height=480)
     plot(d0$date.time, d0$Sub_metering_1,
            type="l",
            main="",
            xlab="",
            ylab="Energy sub metering",
            col="black"
       )
       lines(d0$date.time,
            d0$Sub_metering_2,
            type="l",
            main="",
            xlab="",
            col="red"
       )
       lines(d0$date.time,
             d0$Sub_metering_3,
             type="l",
             main="",
             xlab="",
             col="blue"
       )
      legend("topright",
             lty = 1,
             col=c("black", "red", "blue"),
             legend = c("Sub_Metering_1", "Sub_Metering_2", "Sub_Metering_3"))
dev.off()

##----Set timezone back to default----
Sys.setlocale("LC_TIME",curr_locale)





