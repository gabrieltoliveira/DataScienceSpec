# 'Vectors'
y <- c(1.8, "a")
as.logical(y)


# ' Lists '
x <- list(1, "a", TRUE, 1 + 4i)
x

# 'Matrices'
m <-matrix (2,3)
m <- matrix(nrow = 2, ncol = 3)
m <- matrix(3:8, nrow = 2, ncol = 3)
m <- 1:10
dim(m) <- c(2,5)
m
x <- 1:3
y <- 10:12
cbind(x,y,x)
rbind(x,x,x,x,x)

# 'Factor'
x <- factor(c("yes","no","no","yes"))
table(x)
unclass(x)

x <- factor(c("yes","no","no","yes"), levels = c("yes", "no"))
x


# 'Data Frames'
x <- data.frame(foo = 1:4, bar = c(T,T,F,F))
x
row.names(x) <- c("3","2","1","4")
x


# 'Names'
x <- list(jacobiano = 1, truman = "a", capote = TRUE, blei = 1 + 4i)
x <- list(1, "a", TRUE, 1 + 4i)
names(x) <- c("jacobiano", "truman", "capote", "blei")
x
