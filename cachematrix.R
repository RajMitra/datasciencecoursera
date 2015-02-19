## makeCacheMatrix is a function to get and set a matrix and inverse of a matrix
## cacheSolve will calculate the inverse of the matrix
## CacheSolve will check the cache first.
## If value present is cache, then retrieves the value from cache

## makeCacheMatrix will get the value of matrix and set the value. 
## It will be also get and set the value of the inverse of the matrix

makeCacheMatrix <- function(x = matrix()) {
  m <- NULL
  set <- function(y) {            ## Function to set value of matrix  
    x <<- y
    m <<- NULL
}
get <- function() x                ## Function to get value of matrix
setinverse <- function(inverse) m <<- inverse ## Function to set inverse of matrix
getinverse <- function() m                    ## Function to get inverse of matrix
list(set = set, get = get,
     setinverse = setinverse,
     getinverse = getinverse)   ## List containing a list of functions

## Function to calculate the inverse of matrix
## First checks whether the value is present in the cache or not.
## If present, then gets value from cache and does not compute.

cacheSolve <- function(x, ...) {
        ## Return a matrix that is the inverse of 'x'
  m <- x$getinverse()
  if(!is.null(m)) {
    message("getting cached data")
    return(m)
  }
  data <- x$get()
  m <- solve(data, ...)
  x$setinverse(m)
  m
}