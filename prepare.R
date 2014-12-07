## This utility script will fetch, load, clean and subset the required data.

fetchData <- function(src, dst) {
    if (!file.exists(dst)) {
        target <- "data.zip"
        message(sprintf("Downloading data from '%s'", src))
        download.file(src, target, method = "curl", quiet = TRUE)
        message(sprintf("Extracting to '%s' directory", dst))
        unzip(target)
    } else {
        message(sprintf("File '%s' already exists, skipping download", dst))
    }
}

loadData <-function(input) {
    message(sprintf("Loading '%s'", input))
    orig <- read.table(
        input,
        colClasses = c("character", "character", rep("numeric",7)),
        header = TRUE,
        sep = ";",
        na = "?"
    )
    message("Converting Date and Time to DateTime")
    orig$DateTime <- strptime(
        paste(orig$Date, orig$Time),
        format="%d/%m/%Y %H:%M:%S"
    )
    message("Subsetting")
    subset(
        orig,
        subset = (DateTime >= "2007-02-01 00:00:00"
                  & DateTime < "2007-02-03 00:00:00")
    )
}

getData <- function() {
    src <- "https://d396qusza40orc.cloudfront.net/exdata%2Fdata%2Fhousehold_power_consumption.zip"
    dst <- "household_power_consumption.txt"
    fetchData(src, dst)
    loadData(dst)
}
