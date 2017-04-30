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
png(file="plot2.png", width=480, height=480)
plot(d0$date.time,
     d0$Global_active_power,
     type="l",
     main="",
     xlab="",
     ylab="Global Active Power (kilowatts)"
)

dev.off()

##----Set timezone back to default----
Sys.setlocale("LC_TIME",curr_locale)

