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