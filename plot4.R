## Assumes this project is the current working directory
source("prepare.R")

## Update locale in order to have the right labels
locale <- Sys.getlocale(category = "LC_TIME")
Sys.setlocale("LC_TIME", "en_US.UTF-8")

data <- getData()

png("plot4.png", width = 480, height = 480)
par(mfrow = c(2, 2))
with(
    data, {
        plot(
            y = Global_active_power,
            x = DateTime,
            type = "l",
            xlab = "",
            ylab = "Global Active Power"
        )
        plot(
            y = Voltage,
            x = DateTime,
            type = "l",
            xlab = "datetime",
            ylab = "Voltage"
        )
        plot(
            y = Sub_metering_1,
            x = DateTime,
            type="l",
            xlab="",
            ylab="Energy sub metering"
        )
        lines(
            y = Sub_metering_2,
            x = DateTime,
            col = 'Red'
        )
        lines(
            y = Sub_metering_3,
            x = DateTime,
            col = 'Blue'
        )
        legend(
            x = "topright",
            legend = c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3"),
            col = c("Black", "Red", "Blue"),
            lwd = 1,
            bty = "n"
        )
        plot(
            y = Global_reactive_power,
            x = DateTime,
            type = "l",
            xlab = "datetime",
            ylab = "Global_reactive_power"
        )}
)

dev.off()

## Restore the locale
Sys.setlocale("LC_TIME", locale)
