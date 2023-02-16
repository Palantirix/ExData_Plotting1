power <- read.table("household_power_consumption.txt", header=TRUE, sep=";",
                    na.strings = "?")
dsn1 <- subset(power, Date %in% c("1/2/2007","2/2/2007"))
dsn1$Date <- as.Date(dsn1$Date,format="%d/%m/%Y")
Timeframe <- paste(as.Date(dsn1$Date),dsn1$Time)
dsn1$Timeframe <- as.POSIXct(Timeframe)

with(dsn1, {plot(Global_active_power~Timeframe,
        type='l',
        ylab = "Global Active Power (kilowatts)",
        xlab = "")
        })

dev.copy(png, file="Plot2.png", width=480, height=480)
dev.off()
