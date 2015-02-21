## This series of functions takes a matrix and creates its inverse using the
## solve function. If the if the inverse has been calculated previouly the 
## function returns a cached value instead of recalculating.


## The following function creates a list containing a function that:
##    1. sets the value of a matrix
##    2. gets the value of a matrix
##    3. sets the inverse of a matrix
##    4. gets the inverse of a matrix

makeCacheMatrix <- function(x = matrix()) {
      m = null
      set  = function(x) {
            x <<- y
            m <<- NULL
      }
      
      get = function() x
      setinverse = function(solve) m <<- solve
      getinverse = function() m
      list(set = set, 
           get = get, 
           setinverse = setinverse, 
           getinverse = getiverse)
}


## The following fuction creates the inverse of a matrix based on the above 
## fuction. Before the inverse is calculated it checks to see if it has already 
## been calcuated. If the inverse has already been calculated it pull the value 
## from the cache, otherwise it is calculated and cached via the  setinverse
## fuction

cacheSolve <- function(x, ...) {
        ## Return a matrix that is the inverse of 'x'
      m = x$getinverse()
      if(!is.null(m)) {
            message("getting cached data")
            return(m)
      }
      data = x$get()
      m = solve(data, ...)
      x$setinverse(m)
      m
}
