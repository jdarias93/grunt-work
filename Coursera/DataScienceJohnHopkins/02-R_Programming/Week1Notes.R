## Background material

# Check working directory.
getwd()
dir()

# Change working directory
setwd("C:/Users/joshd/Desktop/grunt-work/Coursera/DataScienceJohnHopkins/02-R_Programming/")

# Reference function
myfunction()

# Make both functions available without running it first.
source("MyCode.R")

# Run second code in MyCode.R only.
second(4)
second(4:10)

# Everytime you change your code, you must use the
# source() function to load your code functions into
# R again.