## makeCacheMatrix and cacheSolve work collectively to compute and cache the inverse of 
## an invertable matrix.

## makeCacheMatrix - function that takes a matrix as input, then stores the value 
## of that matrix in a list along with a placeholder for its inverse.

makeCacheMatrix <- function(x = matrix()) {

    inv <- NULL
    set <- function(y) {
        x <<- y
        inv <<- NULL
    }
    get <- function() x
    setinverse <- function(inverse) inv <<- inverse
    getinverse <- function() inv
    list(set = set, get = get,
         setinverse = setinverse,
         getinverse = getinverse)
}

## cacheSolve uses the matrix/placeholder object generated by makeCacheMatrix to return the cached 
## value of the inverse of x if it exists, otherwise uses the solve function to find the inverse of 
## x and store it. 

cacheSolve <- function(x, ...) {
    inv <- x$getinverse()
    if(!is.null(inv)) {
        message("getting cached data")
        return(inv)
    }
    data <- x$get()
    inv <- solve(data, ...)
    x$setinverse(inv)
    inv
}
