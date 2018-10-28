pollutantmean <- function(directory, pollutant, id = 1:332) {
  setwd("~/Desktop/grunt-work/Coursera/DataScienceJohnHopkins/02-R_Programming/")
  num = 0
  denom = 0
  for (i in id) {
    if(i < 10) {
      j <- paste0("00",i)
    } else if(10 <= i & i < 100) {
      j <- paste0("0",i)
    } else {
      j <- as.character(i)
    }
    ndir <- paste0(directory,"/",j,".csv")
    data <- read.csv(ndir)
    attach(data)
    s <- sulfate
    n <- nitrate
    detach(data)
    if (pollutant == "sulfate") {
      reads <- s[!is.na(s)]
    } else if (pollutant == "nitrate") {
      reads <- n[!is.na(n)]
    } else {
      print("You did not specify a pollutant.")
      break
    }
    num <- num + sum(reads)
    denom = denom + length(reads)
  }
  num/denom
}

complete <- function(directory, id = 1:332) {
  setwd("~/Desktop/grunt-work/Coursera/DataScienceJohnHopkins/02-R_Programming/")
  nobs <- 0
  for (i in id) {
    if(i < 10) {
      j <- paste0("00",i)
    } else if(10 <= i & i < 100) {
      j <- paste0("0",i)
    } else {
      j <- as.character(i)
    }
    ndir <- paste0(directory,"/",j,".csv")
    data <- read.csv(ndir)
    attach(data)
    s <- sulfate
    n <- nitrate
    detach(data)
    for (j in 1:length(s))
      if(is.na(s[j]) == FALSE && is.na(n[j]) == FALSE) {
        nobs <- nobs + 1
      } else {
        next
      }
  }
  print(nobs)
  # Now append to a new data array
}
  
