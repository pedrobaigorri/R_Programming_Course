########################################################################################
##
## File: cachematrix.R
##
## This file contains the functions "makeCacheMatrix" and "cacheSolve" which
## takes advantage of the Lexical Scoping characteristics of R to become more efficient
## the calculation of the inverse of a matrix

## Author: https://github.com/pedrobaigorri
## Date: 22/10/2015
##
#########################################################################################


#########################################################################################
##
## function: makeCacheMatrix
##
## Creates a list of functions to manage the creation 
## of a cache of the invers of a matrix. It returns a list with the functions:
##
## 1) set the value of the matrix
## 2) get the value of the matrix
## 3) set the value of the inverse of the matrix
## 4) get the value of the inverse of the matrix
##
##
makeCacheMatrix <- function(x = matrix()) {
  
    m <- NULL
    
    ## creation of the set function
    set <- function(y) {
    
        ## caching the matrix within the parent environment
        x <<- y 
        m <<- NULL
    }
    
    ## creation of the get function to obtain the cached matrix
    get <- function() x
    
    ## creation of set inverse funcion to cache the value of the inverse
    setinverse <- function(inverse) m <<- inverse
    
    ## creation of get inverse function to obtain the cached value of the inverse
    getinverse <- function() m
    
    ## returning the list of the functions
    list(set = set, get = get,
         setinverse = setinverse,
         getinverse = getinverse)
}
  
#########################################################################################
##
## function: cacheSolve
##
## Computes the inverse of a matrix. If the inverse has computed and cached previously
## over the same matrix it returns the value without repeating the calculation
##
##
##
cacheSolve <- function(x, ...) {

    ## checking if inverse has already created. if so returning the cache
    m <- x$getinverse()
    if(!is.null(m)) {
        message("getting cached data")
        return(m)
        
    }
    
    ## if not, calculate the inverse and cache it
    data <- x$get()
    m <- solve(data, ...)
    x$setinverse(m)
    m
}


