## This utility script save as plot as a 480*480 png file

export2png <- function(filename) {
    message(sprintf("Saving plot to '%s'", filename))
    dev.copy(png, file = filename, height = 480, width = 480)
    dev.off()
}
