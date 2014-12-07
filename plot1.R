## Assumes this project is the current working directory
source("prepare.R")
source("export.R")

data <- getData()

hist(
    data$Global_active_power,
    main="Global Active Power", 
    xlab="Global Active Power (kilowatts)",
    ylab="Frequency",
    col="Red"
)

export2png("plot1.png")
