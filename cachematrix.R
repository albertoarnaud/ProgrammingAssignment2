## The makeCacheMatrix function creates a special matrix 
## and returns a list of functions to get and set 
## the value of the matrix and the value of the invese matrix.
##
## Using the special matrix (created with the makeCasheMatrix function) 
## the cacheSolve function return the inverse matrix of 'x' if cached, 
## otherwise computes, caches and returns the value of the inverse matrix of 'x'

## Creates and returns a list of functions to:
## set the value of the matrix
## get the value of the matrix
## set the value of the inverse matrix
## get the value of the inverse matrix

makeCacheMatrix <- function(x = matrix()) {
	s <- NULL
	set <- function(m) {
		x <<- m
		s <<- NULL
 	}
 	get <- function() x
 	setsolve <- function(solve) s <<-solve
 	getsolve <- function() s
 	list(set = set, get = get,
 		setsolve = setsolve, getsolve = getsolve)
}


## Returns a matrix that is the inverse of 'x'.
## If the inverse matrix is cached returns 
## a message and the inverse matrix itself.
## Otherwise calls the solve function computing 
## the inverse matrix, caches it and finally returns it.

cacheSolve <- function(x, ...) {
	s <- x$getsolve()
 	if(!is.null(s)) {
 		message("getting cached data")
		return(s)
	}
	data <- x$get()
 	s <- solve(data, ...)
 	x$setsolve(s)
	s
}
