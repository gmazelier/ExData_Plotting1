## Assumes this project is the current working directory
source("prepare.R")

data <- getData()

png("plot1.png", width = 480, height = 480)
hist(
    data$Global_active_power,
    main="Global Active Power", 
    xlab="Global Active Power (kilowatts)",
    ylab="Frequency",
    col="Red"
)
dev.off()
