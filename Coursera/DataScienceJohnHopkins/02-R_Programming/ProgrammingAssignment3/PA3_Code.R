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
        o <- read.csv("outcome-of-care-measures.csv", colClasses = "character")
        o[c(1,3:6,8:10,12:16,18:22,24:46)] <- NULL
        names(o) <- c("name","state","heart attack","heart failure","pneumonia")
        
        # Check if state variable is valid
        if (state %in% o$state == FALSE) {
                stop("invalid state")
        } else if (outcome %in% names(o) == FALSE) {
                stop("invalid outcome")
        }
        else {
                p <- o[o$state == state,]
                if (outcome == "heart attack") {
                        q <- as.numeric(p$`heart attack`)
                        r <- min(q,na.rm=TRUE)
                        s <- match(r,q)
                        p$name[s]
                } else if (outcome == "heart failure") {
                        q <- as.numeric(p$`heart failure`)
                        r <- min(q,na.rm=TRUE)
                        s <- match(r, q)
                        p$name[s]
                } else {
                        q <- as.numeric(p$pneumonia)
                        r <- min(q, na.rm=TRUE)
                        s <- match(r, q)
                        p$name[s]
                }
        }
}

# 2. Ranking hospitals by outcome in a state

rankhospital <- function(state, outcome, num="best") {
# Clean outcome data
        o <- read.csv("outcome-of-care-measures.csv")
        o[c(1,3:6,8:10,12:16,18:22,24:46)] <- NULL
        names(o) <- c("name","state","heart attack","heart failure","pneumonia")
        p <- o[o$state == "TX",]

# Check if state variable is valid
        if (state %in% o$state == FALSE) {
                stop("invalid state")
        } else if (outcome %in% names(o) == FALSE) {
                stop("invalid outcome")
        } else {
                if (outcome == "heart attack") {
                        p$`heart failure` <- NULL
                        p$pneumonia <- NULL
                        q <- split(p,p$`heart attack`,drop=TRUE)
                        }
                } else if (outcome == "heart failure") {
                        p$`heart attack` <- NULL
                        p$pneumonia <- NULL
                        q <- split(p,p$`heart failure`,drop=TRUE)
                } else {
                        p$`heart attack` <- NULL
                        p$`heart failure` <- NULL
                        q <- split(p,p$pneumonia,drop=TRUE)
                        
                }
                q$`Not Available` <- NULL
                for (i in 1:length(q)) {
                        r <- as.data.frame(q[i])
                        write.table(x=r,file="HosLs.csv",append=TRUE,col.names=FALSE,row.names=FALSE)
                }
        }
        s <- read.csv("HosLs.csv",header=FALSE)
        
# Pull out requested rank
        if (num == "best") {
                s[1,]
        } else if (num == "worse") {
                s[length(s[,1]),]
                
        } else {
                s[num,]
        }
}
