# Data Science John Hopkins Coursera
# Programming Assignment 3

setwd("/Users/jdarias/Desktop/grunt-work/Coursera/DataScienceJohnHopkins/02-R_Programming/ProgrammingAssignment3")

# 1. Plot the 30-day mortality rates for heart attack
outcome <- read.csv("outcome-of-care-measures.csv", colClasses = "character")
head(outcome)
ncol(outcome) # 46 columns
nrow(outcome) # 4706 rows
names(outcome)
outcome[,11] <- as.numeric(outcome[,11]) ## NA warning is OK
hist(outcome[,11])

# 2. Finding the best hospital in a state

best <- function(state, outcome) {
        ## Read outcome data
        
        ## Check that state and outcome are valid
}