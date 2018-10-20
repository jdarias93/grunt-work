# Let's write a function that adds any two numbers we want
add2 <- function(x, y) { # Specify the arguments you'll take in function()
  x + y # Write the function
} # End with curly bracket

print("Once you run this in the console, you can start using it as a function")

# Like so:
add2(3,5)

# Let's write ANOTHER function that will give us any and all numbers above 10 in a vector
above10 <- function(x) {
  use <- x > 10 # Creates logical vector to figure out which numbers are greater than 10
  x[use] # Now we subset the input vector using the logical vector "use"
}

# Let's write a THIRD function that will give us any and all numbers above a user-defined number in a vector.
above <- function(x, poop=10) { # Where poop is the user-defined number and 10 is the DEFAULT number
  use <- x > poop # Create logical vector
  x[use] # Subset x using logical vector
}

# Create a vector
x <- 1:20
above(x,12) # This returns every number above 12 (so 13:20)
above(x) # Without specifying a number, it assumes the default (poop = 10) and prints 11:20

# Let's write a FOURTH function that will calculate all means in a matrix column
columnmean <- function(mydataframe, removeNA = TRUE) { # Default is to remove NA placeholders
  nc <- ncol(mydataframe) # Get the number of columns in dataframe y
  means <- numeric(nc) # Initialize a vector of all 0s whose length equals the number of columns (nc)
  for(i in 1:nc) { # For each column
    means[i] <- mean(mydataframe[, i], na.rm = removeNA) # Takes mean of every column vector in your matrix and puts it in means
  }
  means # prints mean vector
}

# Test out the function
columnmean(airquality)
columnmean(airquality, FALSE) # DON'T remove NAs
