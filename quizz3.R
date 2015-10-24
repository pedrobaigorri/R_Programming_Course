#loading data
library(datasets)
data(iris)

# Question 1
# what is the mean of 'Sepal.Length' for the species virginica? 
s <- split(iris, iris$Species)
sapply(s, function(x) colMeans(x[,c("Sepal.Length", "Petal.Length")]))

#Question 1 opcion b
x<- iris[iris[,"Species"]=="virginica", "Sepal.Length"]
mean(x)

#question 1, opcion c
tapply(iris$Sepal.Length, iris$Species, mean)["virginica"]


#loading data
library(datasets)
data(mtcars)

# question 4
# what is the absolute difference between the average horsepower of 4-cylinder cars and the average horsepower 
# of 8-cylinder cars?

x <- with(mtcars, tapply(hp, cyl, mean))
x["4"]-x["8"]
