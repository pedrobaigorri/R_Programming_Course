########################################################################################
##
## File: cacheTest.R
##
## This file contains some simple instructions to test the functions
## created in the file cachematrix.R

## Author: https://github.com/pedrobaigorri
## Date: 23/10/2015
##
#########################################################################################

source("cachematrix.R")

## creation of the matrix
test_matrix <- matrix(1:4, 2, 2)

## creation of the special matrix
special_test_matrix <- makeCacheMatrix()

## assigning the value to the special matrix
special_test_matrix$set(test_matrix)

## computation of the inverse first time
print(inverse1 <- cacheSolve(special_test_matrix))

## computation of the inverse second time - message of getting cache data should appear
print(inverse2 <- cacheSolve(special_test_matrix))

## standar computation of the inverse of the matrix
print(inverse3 <- solve(test_matrix))


