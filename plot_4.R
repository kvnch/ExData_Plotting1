x <- read.csv("household_power_consumption.txt", sep = ";")

simple <-
  subset(
    x,
    Date == "1/2/2007" |
      Date == "2/2/2007",
    select = c(
      Date,
      Time,
      Global_active_power,
      Global_reactive_power,
      Voltage,
      Sub_metering_1,
      Sub_metering_2,
      Sub_metering_3
    )
  )

date <-
  as.POSIXct(paste(simple$Date, simple$Time), format = "%d/%m/%Y %H:%M:%S")

png("plot4.png", width = 480, height = 480)

par(mfcol = c(2, 2))

# Plot 1
plot(
  x = date,
  y = simple$Global_active_power,
  type = "l",
  xlab = "",
  ylab = "Global Active Power"
)

# Plot 2
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


# Plot 3
plot(date,
     simple$Voltage,
     type = "l",
     xlab = "datetime",
     ylab = "Voltage")

# Plot 4
plot(
  date,
  simple$Global_reactive_power,
  type = "l",
  xlab = "datetime",
  ylab = "Global Reactive Power"
)

dev.off()