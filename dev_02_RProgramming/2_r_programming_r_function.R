# FUNCTIONS
add2 <- function(x, y){
  x + y
}

add2(1,2)

above <- function(x, n = 10){
  use <- x > n
  x[use]
}

x = c(3,5,6,7,12,12,15,16,4)
n = 10
above(x, n)


x <- airquality

columnmean <- function(x, removeNA = TRUE){
  nc <- ncol(x) # number of columns for the data frame
  means <- numeric(nc) # creates the vector the size of the number of columns
  for(i in 1:nc){
    means[i] <- mean(x[,i], na.rm = removeNA)
  }
  means
}

