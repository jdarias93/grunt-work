# Data Science John Hopkins Coursera
# Programming Assignment 3

# 2. Finding the best hospital in a state (csv #11)

best <- function(state, outcome) {
        # Clean outcome data
        o <- read.csv("outcome-of-care-measures.csv",colClasses="character")
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
