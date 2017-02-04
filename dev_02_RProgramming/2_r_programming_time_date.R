# DATES
x <- as.Date("2016-07-24")
x
unclass(x)

# TIMES
x <- Sys.time() # already in POSIXct format
p <- as.POSIXlt(x)
names(unclass(p))
p$sec
p <- as.POSIXct(x)
unclass(p)

# CONVERTING TIME
datestring <- c("Janeiro 10, 2016 10:00:00", "Dezembro 20, 2014 08:00:00")
datestring <- "Janeiro 10 2016 10:00:00"
x <- strptime(datestring, "%b %d %Y %H:%M:%S")
x
?strptime


format(Sys.time(), "%a %b %d %X %Y %Z")

z <- strptime("20/2/06, 11:16:16.683", "%d/%m/%y, %H:%M:%OS")
z
