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

## While
