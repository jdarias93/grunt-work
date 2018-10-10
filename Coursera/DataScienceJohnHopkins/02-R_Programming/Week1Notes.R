# Background material

## Check working directory.
getwd()
dir()

## Change working directory
setwd("C:/Users/joshd/Desktop/grunt-work/Coursera/DataScienceJohnHopkins/02-R_Programming/")

## Reference function
myfunction()

## Make both functions available without running it first.
source("MyCode.R")

## Run second code in MyCode.R only.
second(4)
second(4:10)

### Everytime you change your code, you must use the
### source() function to load your code functions into
### R again.

# Free Software

## With free software, you have the freedom to:
### Run the program for any purpose
### Study and adapt the program as you see fit.
### Redistribute copies of the program.
### Improve and release the program.

# Drawbacks of R

## No helpline; if the feature is not there, you must make it
## Limited to physical memory of machine you are on.

# Design of the R system

## The "base" R system has the base packages needed
## ...and everything else. Over 4000+ packages

# Getting Help

## Try to find answer to something by
### Searching the web
### Searching the archives of the forum you plan to post to
### Reading the manual
### Reading a FAQ
### Inspection or experimentation
### Asking a skilled friend
### Reading the source code

## Make sure to specify that you say you have read the documentation
## Specify:
### Steps to reproduce the problem
### Expected output
### What you see instead
### The version you are using
### Your OS

## Do:
### Describe the Goal not the step
### Be explicit about your question
### Provide minumum amount of info necessary
### Be courteous
### Follow up with the solution if you find it

## Don't:
### Claim you found a bug
### Grovel as a substitute for doing your homework
### Post homework questions on mailing lists
### E-mail multiple mailing lists at once
### Ask others to debug your broken code without a hint as to what sort of problem it might be

# R Input and Evaluation

## "<-" is the assignment operator
## Entering an object's name "auto-prints" its value
x <- 1:20
x

# R Data Types
# Objects and Attributes

## 5 Atomic Classes of Objects
### Character
### Numeric (Real Numbers)
### Integer
#### 1 gives you a numeric object, but 1L explicitly gives you an integer.
### Complex (imaginary numbers)
### Logical (T/F)

## Most basic object is a vector, which can only contain objects of the same class
### A LIST on the other hand, can contain objects of different classes but still be represented as a vector.

## Attributes
### Names, dimnames
### Dimensions
### Class
### Length
### User-defined
### attributes() lets you set attributes for an Object

# Vectors and Lists
## Done with the c() function
## When you mix objects in a vector, COERCION occurs so that every vector element is of the SAME CLASS!
## Explicit Coercion
### When you want to explicitly set a class for a vector, you use the as.* functions.
x <- 0:6
class(x) # Gives the class
as.numeric(x) # Coerces to numeric
as.logical(x) # Coerces to logical; 0 is false, everything else is TRUE
as.character(x) # Coerces to character
as.complex(x) # Coerces to complex
# With a character vector
x <- c("a", "b", "c")
as.numeric(x) # A vector of NAs
as.logical(x) # And again.

## Lists
### Can contain elements of different classes
x <- list(1,"a","b", T, 1 + 4i)
x
### Double brackets demark different classes