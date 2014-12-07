## Assumes this project is the current working directory
source("prepare.R")
source("export.R")

## Update locale in order to have the right labels
locale <- Sys.getlocale(category = "LC_TIME")
Sys.setlocale("LC_TIME", "en_US.UTF-8")

data <- getData()

plot(
    y = data$Global_active_power,
    x = data$DateTime,
    type="l",
    xlab="",
    ylab="Global Active Power (kilowatts)"
)

export2png("plot2.png")

## Restore the locale
Sys.setlocale("LC_TIME", locale)
