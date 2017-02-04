# QUESTION 1
# Take a look at the 'iris' dataset that comes with R. The data can be loaded
# with the code: A description of the dataset can be found by running There will
# be an object called 'iris' in your workspace. In this dataset, what is the
# mean of 'Sepal.Length' for the species virginica? Please round your answer to
# the nearest whole number.
library(datasets)
data(iris)
?iris
str(iris)

round(mean(iris[iris$Species == "virginica", "Sepal.Length"], na.rm = TRUE))
s <- split(x = iris, f = iris$Species)
round(mean(s$virginica$Sepal.Length, na.rm = FALSE))

# QUESTION 2
# Continuing with the 'iris' dataset from the previous Question, what R code
# returns a vector of the means of the variables 'Sepal.Length', 'Sepal.Width',
# 'Petal.Length', and 'Petal.Width'?

# colMeans(iris) ==> NO
colMeans(iris[ , 1:4])
apply(iris[ , 1:4], MARGIN = 2, FUN = mean)
# apply(iris, MARGIN = 1, mean) # ==> NO
# apply(iris, MARGIN = 2, mean) # ==> NO
# rowMeans(iris[ , 1:4]) # ==> NO


# QUESTION 3
# Load the 'mtcars' dataset in R with the following code There will be an object
# names 'mtcars' in your workspace. You can find some information about the
# dataset by running. How can one calculate the average miles per gallon (mpg) by
# number of cylinders in the car (cyl)? Select all that apply.

library(datasets)
data(mtcars)
?mtcars
str(mtcars)

sapply(split(x = mtcars$mpg, f = mtcars$cyl), mean)
# apply(mtcars, 2, mean) ==> NO
# lapply(mtcars, mean) ==> NO
with(mtcars, tapply(X = mpg, INDEX = cyl, FUN = mean))
tapply(mtcars$mpg, mtcars$cyl, mean)


# QUESTION 4 
# Continuing with the 'mtcars' dataset from the previous Question,
# what is the absolute difference between the average horsepower of 4-cylinder
# cars and the average horsepower of 8-cylinder cars?
abs(round(
  tapply(mtcars$hp, mtcars$cyl, mean)[["4"]] - tapply(mtcars$hp, mtcars$cyl, mean)[["8"]]
))

# QUESTION 5
# If you run debug(ls) what happens when you next call the 'ls' function?
debug(ls)
ls(NA)
