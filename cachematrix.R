## makeCacheMatrix() uses the <<- operator to assign a value to an object in an
## environment that is different from the current environment.

## Below are two functions that are used to create a special object that stores a
## matrix and caches its inverse.

## The first function, makeCacheMatrix creates a special "matrix", which is really
## a list containing functions to
##
## 1. Set the matrix -- set()
## 2. Get the matrix -- get()
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


## Write a short comment describing this function

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