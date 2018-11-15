# Data Science John Hopkins Coursera
# Programming Assignment 3

setwd("/Users/jdarias/Desktop/grunt-work/Coursera/DataScienceJohnHopkins/02-R_Programming/ProgrammingAssignment3")

# 1. Plot the 30-day mortality rates for heart attack (csv #19)
o <- read.csv("outcome-of-care-measures.csv", colClasses = "character")
names(o)
o[,11] <- as.numeric(o[,11]) ## NA warning is OK
hist(o[,11])

# 2. Finding the best hospital in a state (csv #11)

best <- function(state, outcome) {
        # Clean outcome data
        o <- read.csv("outcome-of-care-measures.csv",colClasses="character")
        o[c(1,3:6,8:10,12:16,18:22,24:46)] <- NULL
        names(o) <- c("name","state","heart attack","heart failure","pneumonia")
        
        # Check if state variable is valid
        if (state %in% o$State == FALSE) {
                stop("invalid state")
        } else if (outcome %in% names(o) == FALSE) {
                stop("invalid outcome")
        }
        else
                print("WOO")
        ## Read outcome data
        ## Check that state and outcome are valid
        
        ## Return hospital name in that state with lowest 30-day death rate
}
