power <- read.table("household_power_consumption.txt", header=TRUE, sep=";",
                    na.strings = "?")
dsn1 <- subset(power, Date %in% c("1/2/2007","2/2/2007"))

hist(dsn1$Global_active_power, main="Global Active Power", 
     xlab = "Global Active Power (kilowatts)",
     ylab = "Frequency", col = "red")

dev.copy(png, file="Plot1.png", width=480, height=480)
dev.off()