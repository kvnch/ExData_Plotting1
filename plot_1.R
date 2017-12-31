x <- read.csv("household_power_consumption.txt", sep = ";")

simple <-
  subset(x,
         Date == "1/2/2007" |
           Date == "2/2/2007",
         select = c(Global_active_power))
n <- simple$Global_active_power


png("plot1.png", width = 480, height = 480)

hist(
  x = as.numeric(levels(n))[n],
  col = "Red",
  main = "Global Active Power",
  xlab = "Global Active Power (kilowatts)"
)

dev.off()