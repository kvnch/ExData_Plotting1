x <- read.csv("household_power_consumption.txt", sep = ";")

simple <-
  subset(x,
         Date == "1/2/2007" |
           Date == "2/2/2007",
         select = c(Date, Time, Global_active_power))

date <-
  as.POSIXct(paste(simple$Date, simple$Time), format = "%d/%m/%Y %H:%M:%S")

png("plot2.png", width = 480, height = 480)

plot(
  x = date,
  y = simple$Global_active_power,
  type = "l",
  xlab = "",
  ylab = "Global Active Power (kilowatts)"
)

dev.off()