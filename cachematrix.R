
makeCacheMatrix <- function(x) {
  matrix <- NULL
  cached_inverse <- NULL
 # Set the matrix and reset the cached inverse matrix
  set <- function(y) {
    matrix <<- y
    cached_inverse <<- NULL
  }
  get <- function() {
    matrix
  }
  # Calculate and cache the inverse matrix
  cache_inverse <- function() {
    if (!is.null(cached_inverse)) {
      message("Gets the inverse of the cache")
      return(cached_inverse)
    } else {
      cached_inverse <<- solve(matrix)
      return(cached_inverse)
    }
  }

  list(set = set, get = get, cache_inverse = cache_inverse)
}
# Calculate the inverse matrix and use the cached result
cacheSolve <- function(cacheMatrix) {
  cacheMatrix$cache_inverse()
}


matrix <- makeCacheMatrix(matrix(c(6, 8, 7, 9), nrow = 2))
matrix$set(matrix(c(6, 8, 7, 9), nrow = 2))
cacheSolve(matrix)
