## The following functions create an invertible matrix and store its inverse in the cache environment

## Makes and returns functions used by cacheSolve to get inverse of matrix

makeCacheMatrix <- function(x = matrix()) {
    cache<-NULL
    set<-function(y){
        x<<-y
        cache<<-NULL
    }
    get<-function() x
    setMatrix<-dunction(inverse) cache<<-inverse
    getInverse<-function()cache
    list(set=set, get=get,
        setMatrix = setMatrix
        getInverse = getInverse)
}


## cacheSolve takes inverse of matrix created by makeCacheMatrix

cacheSolve <- function(x, ...) {
  cache<-x$getInverse()
    if(!is.null(cache)){
        message("getting cached data")
        return(cache)
    }
    matrix<-x$get()
    cache<-solve(matrix, ...)
    x$setMatrix(cache)
    return(cache)
}
