## cachematrix.R
## provides makeCacheMatrix() and cacheSolve() to implement a cached matrix inverse
## function
##
## John D. Phillips
## john.d.phillips@sbcglobal.net
## February 15, 2015
##

## These functions use the <<- operator to assign a value to an object in an
## environment that is different from the current environment.

## Below are two functions that are used to create a special object that stores a
## matrix and cache its inverse.

## The first function, makeCacheMatrix creates a special "matrix", which is really
## a list containing functions to
##
## 1. Set the matrix -- set()
## 2. Get the matrix -- get()  The matrix is stored in the environment of get()
## 3. Set the inverse of the matrix -- setinverse()
## 4. Get the inverse of the matrix -- getinverse()

makeCacheMatrix <- function(x = matrix()) {
        m <- NULL
        set <- function(y) {
                x <<- y
                m <<- NULL
        }
        get <- function() x
        setinverse <- function(inverse) m <<- inverse
        getinverse <- function() m
        list(set = set, get = get,
             setinverse = setinverse,
             getinverse = getinverse)
}

## The following function calculates the mean of the special "matrix" created with
## the above function. However, it first checks to see if the inverse has already
## been calculated. If so, it gets the inverse from the cache and skips the
## computation. Otherwise, it calculates the inverse of the data and sets the value
## of the inverse in the cache via the setinverse function.

cacheSolve <- function(x, ...) {
        m <- x$getinverse()
        if(!is.null(m)) {
                message("getting cached inverse")
                return(m)
        }
        data <- x$get()
        m <- solve(data, ...)
        x$setinverse(m)
        m
}