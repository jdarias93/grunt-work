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

### They can also be PARTIALLY matched, meaning you don't need to type the entire argument out

## Defining a Function
g <- function(a, b=1, c=2, d=NULL) {
  # You can set a default argument to NULL, meaning no argument
}

## Lazy Evalutation: Argument to functions are evaluated lazily, so ONLY as needed
h <- function(a,b) { # Argument "b" isn't needed so h(2) won't produce an error, because 2 just becomes "a"
  a^2
}
h(2) 
# This next function produces an error because argument "b" is missing, but it still prints "a"!
j <- function(a,b) {
  print(a)
  print(b)
}
j(45)

## The "..." Argument: ... indicates a variable number of arguments usually passed on to OTHER functions
## ... is often used when extending another function and you don't want to copy the entire arugment list

myplot <- function(x,y,type="l",...) { # Here, we pass on arguments to function "plot"
  plot(x,y,type = type, ...)
}

## ... is also necessary when the number of arguments passed to the function can't be known in advance
args(paste) # You could be dealing with many strings: they take the place of the ...
args(cat)
## One catch with ... is that any arguments that appear AFTER ... must be named explicitly and CAN'T be partially matched


# Scoping Rules
## How does R know which value to assign to which symbol? When you type
lm <- function(x) {x*x} # effectively defining another function for lm (already a function in the stats package)
## ... how does R know which lm() to use?

## Binding Values to Symbol
### When R tries binding a value to a symbol, it search through a series of environments to find the apropos value
### The order is roughly: (1) search global environment for symbol name and (2) search namespaces of packages
search() # Allows us to see the hierarchy of how R will match symbols
### Global Enviornment is always number 1 and last is the BASE packages
### When you load a package with library, THE NAMESPACE OF THAT PACKAGE IS PUT IN POSITION 2 OF THE SEARCH LIST
### Everything else is shifted DOWN

## Scoping rules are the main feature making R different from S; they determine how a value is associated with a free
## variable in a function

## R uses LEXICAL or STATIC SCOPING (alt: dynamic scoping)
### Lexical scoping is useful for simplifying statistical computation

## Lexical Scoping
k <- function(x,y) {
  x^2 + y / z
}
### This function has 2 formal args (x,y); z is a FREE VARIABLE
### Scoping rules determine how values are assigned to FREE VARIABLES, which are NOT formal args or local variables
### ***The values of free variables are searched for in the environment in which the function was defined***

## Environments
### An environment is a collection of (symbol,value) pairs (e.g., x = symbol and 3.14 = value)
### Every environment has a parent environment; each environment can have multiple children
### Only enviornment without a parent is the empty environment
### Function + Environment = A FUNCTION CLOSURE

## Searching for FREE VARIABLE value
### If value of a symbol IS NOT found in the environment in which a function was defined, then the search is continued
### in the PARENT ENVIRONMENT.

### Search continues down the sequence of parent environments until we hit the TOP-LEVEL ENVIRONMENT
### After the top-level environment, search continues down the search list until we hit the EMPTY ENVIRONMENT
### If R can't find the FREE VARIABLE value before this happens, we encounter an error.
### FREE VARIABLE? -> PARENT ENV -> TOP-LEVEL ENV -> EMPTY ENV

## Why does it matter?
### Typically, functions are defined in global env, so values of free variables are found in user's workspace
### R allows you to have functions defined INSIDE other function; other languages like C don't let you do this
### Let's try a function within a function:

make.power <- function(n) { # Main function
  pow <- function(x) { # Nested function
    x^n
  }
  pow
}

cube <- make.power(3) # We first "make" the function by setting the power (n). Cube is now the new function
cube(3) # We've set n to 3, so now we choose 3 again for cubing
square <- make.power(2) # Another example: making a function square() that allows us to square values
square(3) # Returns 9, because 3^2 = 9

## Exploring a Function Closure: How to find out what is in a function's environment
ls(environment(cube)) # Checks for environment variables
get("n",environment(cube)) ## Closure environment in which n has been previously set to 3
ls(environment(square))
get("n", environment(square))

## Lexical vs. Dynamic Scoping
y <- 10
f <- function(x) { # In this function, y and g are free variables
  y <-2
  y^2 + g(x)
}

g <- function(x) { # In this function, y is the only free variable
  x*y
}
f(3) # == 34. What???

### With Lexical Scoping, y in function g is looked up in the environment in which the function was defined (global env)
### So for g alone, y = 10.
### Once we go into function f, y is REDEFINED to 2, but ONLY IN THAT ENVIRONMENT; Outside the function env, y is still 10.
### With Dynamic scoping, y is looked up in the env from which the func was CALLED (the CALLING ENV == PARENT FRAME)

### When a func is defined in global env and is then called from the global env, then the defining env == calling env.
### This sometimes gives the appearance of dynamic scoping:
rm(y)
g <- function(x) {
  a <-3 # Defined within func env; dynamically scoped
  x+a+y # y is free variable, previous undefined
}
g(2) # Error?! y was not found.
y <- 3 # Make R happy by giving it y, but now y is in the global environment (instead of defined in func)
g(2) # All good(?). Not really, we've just switched to lexical scoping

## Consequences of Lexical Scoping
### All objects must be stored in memory
### All functions must carry a pointer to their respective defining environments, which could be anywhere
### In S-PLUS, free variables are always looked up in global workspace, so everything can be stored on the disk
### because the defining env of all functions is THE SAME

## Optimization Example
### Optimization routines in R like optim, nlm, and optimize require you to pass a function whose argument is a 
### vector of parameters (e.g., a log-likelihood)

### But, an object function might depend on other things besides its parameters
### When writing software that does optimization, it may be desirable to allow the user to fix certain parameters