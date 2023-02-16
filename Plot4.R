power <- read.table("household_power_consumption.txt", header=TRUE, sep=";",
                    na.strings = "?")
dsn1 <- subset(power, Date %in% c("1/2/2007","2/2/2007"))
dsn1$Date <- as.Date(dsn1$Date,format="%d/%m/%Y")
Timeframe <- paste(as.Date(dsn1$Date),dsn1$Time)
dsn1$Timeframe <- as.POSIXct(Timeframe)

par(mfrow=c(2,2),mar=c(4,4,2,1),oma=c(0,0,3,0))
with(dsn1,{
        plot(Global_active_power~Timeframe, type='l',
             ylab="Global Active Power (kilowatts)",
             xlab="")
        plot(Voltage~Timeframe, type='l',
             ylab="Voltage (volt)",
             xlab="")
        plot(Sub_metering_1~Timeframe, type='l',
             ylab="Global Active Power (kilowatts)",
             xlab="")
        lines(Sub_metering_2~Timeframe, col="red")
        lines(Sub_metering_3~Timeframe, col="blue")
        legend("topright",col=c("black","red","blue"), lty=1, lwd=2, bty="n",
               legend=c("Sub_metering_1","Sub_metering_2","Sub_metering_3"))
        plot(Global_reactive_power~Timeframe, type='l',
             ylab="Global Reactive Power (kilowatts)",
             xlab="")
})

dev.copy(png, file="Plot4.png", width=480, height=480)
dev.off()