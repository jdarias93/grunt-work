pollutantmean <- function(directory, pollutant, id = 1:332) {
  setwd("/Users/ariasjd/Desktop/grunt-work/Coursera/DataScienceJohnHopkins/02-R_Programming/")
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
#  setwd("~/Desktop/grunt-work/Coursera/DataScienceJohnHopkins/02-R_Programming/")
  nobs <- 0
  mat <- matrix(ncol=2,nrow=1)
  colnames(mat) <- c("id","nobs")
  for (i in id) {
    nobs <- 0
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
    for (j in 1:length(s)) {
      if(is.na(s[j]) == FALSE && is.na(n[j]) == FALSE) {
        nobs <- nobs + 1
      } else {
        next
      }
    }
    newrow <- c(i,nobs)
    mat <- rbind(mat,newrow)
  }
  rownames(mat) <- c()
  mat <- mat[-c(1),]
  mat <- as.data.frame(mat)
  print(mat)
}

corr <- function(directory, threshold = 0) {
#  setwd("~/Desktop/grunt-work/Coursera/DataScienceJohnHopkins/02-R_Programming/")
  nobs <- 0
  id <- 1:332
  mat <- matrix(ncol=1,nrow=1)
  for (i in id) {
    nobs <- 0
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
    for (j in 1:length(s)) {
      if(is.na(s[j]) == FALSE && is.na(n[j]) == FALSE) {
        nobs <- nobs + 1
      } else {
        next
      }
    }
    if(nobs > threshold) {
      corre <- cor(s,n,use="complete.obs")
      mat <- rbind(mat,corre)
    } else {
      next
    }
  }
  rownames(mat) <- c()
  mat[-c(1)]
}
