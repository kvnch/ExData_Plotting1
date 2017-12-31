x <- read.csv("household_power_consumption.txt", sep = ";")

simple <-
  subset(
    x,
    Date == "1/2/2007" |
      Date == "2/2/2007",
    select = c(Date, Time, Sub_metering_1, Sub_metering_2, Sub_metering_3)
  )

date <-
  as.POSIXct(paste(simple$Date, simple$Time), format = "%d/%m/%Y %H:%M:%S")

png("plot3.png", width = 480, height = 480)

plot(
  date,
  simple$Sub_metering_1,
  type = "l",
  xlab = "",
  ylab = "Energy Sub Metering"
)
lines(date, simple$Sub_metering_2, col = "red")
lines(date, simple$Sub_metering_3, col = "blue")

legend(
  "topright",
  col = c("black", "red", "blue"),
  c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3"),
  lty = c(1, 1)
)

dev.off()