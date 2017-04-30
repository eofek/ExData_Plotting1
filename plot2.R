
library(sqldf)
setwd("~/Documents/r/coursera/04 exploratory data analysis/week 1/")
d0 <- read.csv.sql(file="household_power_consumption.txt", sep=";", sql="select * from file where Date='1/2/2007' or Date='2/2/2007'")

head(d0)
str(d0)

d0$Date <- as.Date(d0$Date, "%d/%m/%Y" )
?strptime
strptime(d0$Time, "%H:%M:%S")

summary(d0)

png(file="plot2.png")
xrange=range(d0$Date)
plot(d0$Global_active_power,
     type="l",
     main="",
     xlab="",
     ylab="Global Active Power (kilowatts)"
     )
axis(1,labels = c("Thu", "Fri", "Sat"), at=c(1,1500,3000) )

dev.off()



