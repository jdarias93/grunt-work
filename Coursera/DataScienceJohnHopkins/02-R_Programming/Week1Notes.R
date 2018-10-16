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

## Matrices
### Matrices are vectors with a dimension attribute which can be checked with dim(matrixobject)
### Matrices are constructed column-wise (lists of data fill up an entire column before moving to the next)
### You can turn a vector into a matrix using the dim() function
m <- 1:10
dim(m) <-c(2,5)
m
### You can combine two vectors into a single matrix using cbind() or rbind()
x <- 1:3
y <- 10:12
cbind(x,y)
rbind(x,y)

## Factors
### Used to represent categorical data
### Can by ordered or unordered; an integer vector where each integer has a label
### Treated specially using modelling functions like lm() and glm()
x <- factor(c("yes","yes","no","yes","no"))
x
### Two levels in the above factor vector
table(x) # Shows how many of each factor in a factor vector
unclass(x) # Brings the vector down to an integer vector, "n" comes before "y" in the alphabet, so "no" is factor 1 and "yes" is factor 2
x <- factor(c("yes","yes","no","yes","no"), levels = c("yes","no")) # Ordering factors manually using argument "levels"

## Missing Values
z <- c(NA,NaN, NA, NA, NaN, NaN)
is.na(z) # Used to test objects if they are NA
is.nan(z) # Used to test for NaNs
### NA values have classes also, so there are integer NAs, character NA, etc.
### A NaN value is also NA, but NA is NOT an NaN!!!

## Data Frames
### Used to store tabular data
### Represented as a special list where every element has same length
### Each element of list can be though of as a column and the length of each element is the number of rows
### Data frames can store different classes of objects in each column (unlike matrices/vectors)
### Data frames have special attributes, like row.names and col.names
### Created by calling read.table() or read.csv()
### Can be converted to a matrix by calling data.matrix()
a <- data.frame(foo = 1:4, bar = c(T,T,F,F))
nrow(a) # Counts rows in data frame
ncol(a) # Counts columns in data frame

## The Names Attribute
### Objects can have names which is useful for writing readable code and self-describing objects
b <- 1:3
names(b) <- c("foo","bar","norf") # Gives name to each index in object b
### Lists and matrices can also have names
c <- list(a=1,b=2,c=3)
d <- matrix(1:4,nrow=2,ncol=2)
dimnames(d) <- list(c("a","b"),c("c","d"))

## Summary
### Atomic Classes: Numeric, Logical, Character, Integer, Complex
### Vectors and Lists
### Factors
### Missing Values
### Data Frames
### Names

# Reading Tabular Data

## read.table() and read.csv() for reading tabular data; for writing: write.table(); arguments:
### file = name of file
### header = logical indicating header line for file
### sep = string indicating how columns are separated
### colClasses = Character vector indicating class of each column in dataset
### comment.char = character string indicating comment character
### skip = number of lines to skip from the beginning
### stringsAsFactors = which character variables should be coded as factors
### Typically figures out everything for yourself

## readLines() for reading lines of a text file; for writing: writeLines
## source() for reading in R code files; inverse of dump()
## dget for reading in R code files
## load for reading in saved workspaces
## unserialize for reading single R objects in binary form

# Reading in Larger Datasets with read.table()
## Optimize read.table() by checking out the help page for it
## If your dataset is larger than the amount of RAM on your computer, you can probably stop right there
## colClasses allows you to tell R what type of data is in each column
### if all numeric, you can just set colClasses = "numeric"
### A quick, dirty way to figure out all classes of a datatable:
initial <- read.table("datatable.txt", nrows = 100) # Only reads first 100 rows of a big table to initial
classes <- sapply(initial,class) # Reads a vector of classes to object "classes"
tabAll <- read.table("datatable.txt",colClasses=classes) # Now you can tell read.table() which classes are in which columns

## Calculating Memory Requirements
### Rows x Columns x 8 bytes/character = # Bytes
### Bytes/(2^20 Bytes/Megabyte) = # Megabytes
### MB/1000 = # Gigabytes of Memory Required
### Rule of Thumb: 2*GB = # Gigabytes ACTUALLY Required

# Textual Data Formats
## Dumping and dputing are useful because resulting format is editable
## Unlike writing out a table/csv, dump() and dput() perserve metadata
## Textual formats can work much better with version control programs like subversion or git 
##  which can only track changes meaningfully in text files
## They can also be longer-lived, with easily-identifiable corruption
e <- data.frame(a=1,b="a")
dput(e) # Makes R code to make your data frame "e" reproducible.
dput(e,file="e.R")
new.e <- dget("e.R") # dget() allows you reconstruct an object made reporducible with dput()
new.e

## Dumping Objects (dput() but for multiple objects)
f <- "foo" 
dump(c("e","f"),file="data.R") # Dumps your objects into data.R file
rm(e,f) # Removes e and f (to show you that your data is reproducible)
source("data.R") # Sources your dump and reads them back to your global environment
e # Ta
f # Da

# Interfaces to the Outside World
## Data can be read in using connection interfaces, which can be made to file or more exotic things (websites)
## Can be useful when you want to read parts of a file
g <- gzfile("words.gz") # "Opens" words.gz to to g
h <- readLines(g,10) # Reads only the first 10 lines from words.gz
## You can read lines from a webpage using url()
i <- url("https://www.jhsph.edu","r") # Connect to this site using url() and feed to object i
j <- readLines(i) # Read lines from connnection i to object j
head(j) # See the first few lines of j

# Subsetting
## Basics
### [ ] always returns object of the same class as the original; can be used to select more than one element
### [[]] is used to extract elements of a list or a data frame; it can only be used to extract a single
###  element and the class of the returned object will not necessarily be a list/data frame
### $ is used to extract element of a list/data frame by name
k <- c("a","b","c","c","d","a")
k[1] # Extracts first element in the vector k: "a"
k[1:4] # Extracts first FOUR elements in the vector k
k[k > "a"] # Subsetting with a logical index (returns only letters after "a")
l <- k > "a" # Creates logical vector
l
k[l] # Subsets according to your logical vector (F T T T T F)

## Lists