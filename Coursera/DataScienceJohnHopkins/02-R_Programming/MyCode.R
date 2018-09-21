# Simple function.
myfunction <- function()
{
  x <- rnorm(100) # Simulate 100 normal random variables
  mean(x)
} 

second <- function(x) {
  x + rnorm(length(x))
}