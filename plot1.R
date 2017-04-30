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

##----Main plotting function----
png(file="plot1.png")
hist(d0$Global_active_power, 
     main="Global Active Power", 
     col="red", 
     xlab="Global Active Power (kilowatts)"
     )
dev.off()
