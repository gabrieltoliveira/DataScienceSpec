set.seed(20)
x <- rnorm(100)
e <- rnorm(100, 0, 2)
y <- 0.5 + 2 * x + e
summary(y)
plot(x, y)

set.seed(10)
x <- rbinom(100, 1, .5) # binary variable
e <- rnorm(100, 0, 2)
y <- 0.5 + 2 * x + e
summary(y)
plot(x, y)


set.seed(1)
x <- rnorm(100) # binary variable
log.mu <- 0.5 + 0.3 * x
e <- rnorm(100, 0, 2)
y <- rpois(100, exp(log.mu))
summary(y)
plot(x, y)
