## Assumes this project is the current working directory
source("prepare.R")

## Update locale in order to have the right labels
locale <- Sys.getlocale(category = "LC_TIME")
Sys.setlocale("LC_TIME", "en_US.UTF-8")

data <- getData()

png("plot3.png", width = 480, height = 480)
with(
    data,
    {
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
    }
)
legend(
    x = "topright",
    legend = c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3"),
    col = c("Black", "Red", "Blue"),
    lwd = 1
)
dev.off()

## Restore the locale
Sys.setlocale("LC_TIME", locale)
