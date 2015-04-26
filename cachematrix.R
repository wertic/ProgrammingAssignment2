## There are two functions.

##First one is implementation a matrix 
##which allows to saved inverse matrix additionally with otriginal.       

##Second illustrates using a cashed value of inverse matrix. 
##The first call of "solve" takes the same amount of time like a regular function.
##However, second call for the funtion "solve"
##would be faster than first due using a chashed value.e

## Creating matrix for inversion
makeCacheMatrix <- function(x = matrix()) {
    im <- NULL
    set <- function(y) {
        x <<- y
        im <<- NULL
    }
    get <- function() x
    setInverseMatrix <- function(inverseMatrix) im <<- inverseMatrix
    getInverseMatrix <- function() im
    list(set = set, get = get,
         setInverseMatrix = setInverseMatrix,
         getInverseMatrix = getInverseMatrix)
}


## Invoke a function to get an inverse matrix.   
cacheSolve <- function(x, ...) {
    im <- x$getInverseMatrix()
    if(!is.null(im)) {
        message("getting cached data")
        return(im)
    }
    data <- x$get()
    im <- solve(data, ...)
    x$setInverseMatrix(im)
    im
}

