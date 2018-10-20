# Control Structures
## Allow you to control the flow of an R program.
## if, else, for, while, repeat (infinite loop), break (end loop), next (skip iteration of loop), return (exit)
## Most of these are used when writing functions or longer expressions

## If, Else
if(condition) {
  ## Do something
} else {
  ## Do something else
} else if (condition2) {
    # Do something different given a different condition
}

### Else must be at the end, there can be as many else ifs as needed
### An example:
a = 4
if(a > 3) {
  b <- 10
} else {
  b <- 0
}

## For
for(i in 1:10) {
  # Loop index is i = 1 through 10
  print(i)
}

### Try a character vector
c <- c("a","b","c","d")
for(i in 1:4) {
  # Calling by index here
  print(c[i])
}

for(i in seq_along(c)) { # Creates integer sequence equal to the length of argument vector
  # This loop equivalent to the last
  print(c[i])
}

for(letter in c) {
  #This time we only care about letters in the vector (which happen to be all of them)
  print(letter)
}

for(i in 1:4) print(c[i]) # Don't need the bracket format!

### Nested for loops
d <- matrix(1:6, 2, 3)
for(i in seq_len(nrow(d))) {
  for(j in seq_len(ncol(d))) {
    print(d[i,j])
  }
}
#### Nesting beyond 2-3 levels is often very difficult to read or understand.

## While Loops
### Begin by testing a condition: if it is true, the loop body is executed until the initial condition
### is no longer met.

count <- 0
while(count < 10) {
  print(count)
  count <- count + 1 # This command stops at 9
}

### Sometimes there will be more than one condition in the test
z <- 5
while(z >= 3 && z <= 10) { # Keep z between 3 and 10
  print(z)
  coin <- rbinom(1,1,0.5) # Flips a coin
  if(coin==1) { ## Random walk
    z <- z + 1 # Add to z if coin is 1
  } else {
    z <- z - 1 # Subtract from z if coin is not one
  }
}


## Repeat Loops
### Initiates an infinite loop, and the only way to exit one is to call a BREAK
e <- 1
tol <- 1e-8
repeat{
  f <- computeEstimate() # THIS IS A FAKE FUNCTION
  if(abs(f-e) < tol) {   # if the absolute value of f-e is less than the tolerance...
    break                # break the function
  } else {               # If its not greater than tol...
    f <- e               # e is the new f.
  }
}

### Repeat loops are dangerous because there is no guarantee it will stop, so it is better to set a hard limit
### on the number of iterations (like with a for loop) than report whether convergence was achieved or not.

## Next and Return Control Functions
### next is used to skip a loop iteration
for(i in 1:100) {
  if(i <= 20) {
    ## Skip the first 20 iterations
    next
  }
  ## Do something here
}

### Return signals that a function should exit and return a given value

# Functions
## Functions are created using the function() directive and are stored as R object like anything else
## They are of class "function"
## Functions can be passed as arguments to other functions
## Functions can be nested so you can define a function inside another one
## Functions have NAMED ARGUMENTS which potentially have default values

## FORMAL ARGUMENTS are included in function definition; sometimes they aren't ALL used
### formals() returs a list of all formal arguments of function
### Can be missing or might have default values

## Argument Matching: When an argument is matched by name, it is "taken out" of the argument list and 
## the remaining unnamed arguments are matched in the order they are listed in the function definition.
### Named arguments are helpful when you have a long argument list and you want to use the defaults
### for everything except an argument near the end of the list (like in plotting functions)
### They can also be PARTIALLY matched
