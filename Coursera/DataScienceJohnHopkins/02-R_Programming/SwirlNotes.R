## R Nuts and Bolts

install.packages("swirl")
packageVersion("swirl")
library(swirl)
rm(list=ls())
swirl()
install_from_swirl("R Programming")

## Swirl Lesson 1: Basic Building Blocks
# R recycles vectors! For instance, when you multiple a vector of 3 by 2, you are actually multiplying two
# vectors.

## Swirl Lesson 2: Workspace and Files
# file.exists() great for when you need to run a program that loops through a series of files and does processing
# on each one, because you need to check if a file exists before you process it
# file.info() allows you access info about a certain file in your WD.
# file.rename(from,to)
# file.copy(from,to)
# file.path(file), gives the path to a file

## Swirl Lesson 4: Vectors
# paste(x,collapse=" ") collapses character vectors delimiting them by a single space: " ".

## Swirl Lesson 5: Missing Values
# is.na(X) gives you a Boolean for NA. X == NA will NOT give you a boolean.

## Swirl Lesson 6: Subsetting Vectors
# Three types of index vectors: logical, positive, negative, and named.
# Not only can you call a subset vector with x[1:10], but you can also make a conditional statement, such as:
# x[!is.na(x) & x>0] which will give a subset vector of positive numbers that are not NA in x.
# It can also be a combine vector: x[c(1,3,5)] for the 1st, 3rd, and 5th numbers in vector x.
# To exclude specific point in the index, we can use negative indices, like so:
# x[-c(2,10)] which prints x except the 2nd and 10th index numbers
# To "name" indices, we can do this:
# x <- c(foo=11,bar=2,norf=NA)
# Name indices after the fact with the names() function
# Check for identity using indentical() function

## Swirl Lesson 7: Matrices and Data Frames
# Setting a "vector's" dimension:
# dim(x) <- c(5,4) to give "x" 4 rows and 5 columns. So we've made it a matrix!
# Combining matrices columnally:
# cbind(matrix1, matrix2), but remember that matrices can only contain ONE class of data (e.g., strings)
# data.frame allows us to COMBINE DIFFERENT CLASSES OF DATA intoone matrix
# Specifying column names:
# colnames(data frame) <- string vector
# rownames() for rows

## Swirl Lesson 8: Logic
# && and || only look at the first indexed value in a vector in an expression
# which() lets you know which indices in a LOGICAL vector contain TRUEs.
# any() returns TRUE if one or more of the elements in the LOGICAL vector is TRUE
# all() will return TRUE if EVERY element in the LOGICAL vector is TRUE

## Swirl Lesson 9: Functions
# Sys.Date() returns a Date class object (today's actual date)
# When you explicitly designate argument values by name, the ordering of arguments becomes unimportant
# args() will tell you the accepted arguments of a function
# You can pass functions AS arguments to other functions in a function
# When you use the ... argument in a function, it is a list that must be "unpacked" within the function, like so:
mad_libs <- function(...){
  # Do your argument unpacking here!
  args <- list(...)
  place <- args[["place"]]
  adjective <- args[["adjective"]]
  noun <- args[["noun"]]
  paste("News from", place, "today where", adjective, "students took to the streets in protest of the new", noun, "being installed on campus.")
}

