library(tidyverse)
dfiles <- dir("Data",full.names=TRUE)
dfiles
# 1. Read the first datafile into a tibble named ex_data. Change the name of the res column to experiment1,
# by manipulating the names attribute of ex_data. That is, use names(ex_data)[2] <- "experiment1".
ex_data <- read_csv(dfiles[1])
names(ex_data)[2] <- "experiment1"
ex_data

# 2. Write a function read_ex() that takes dfiles and an experiment number i as arguments and returns
# a tibble with the name of the res column changed to the experiment number. That is,
# read_ex(dfiles,1) should return the same tibble as in question 1.
read_ex <- function (x, i) {
  t <- read_csv(x[i])
  names(t)[2] <- paste0("experiment", i)
  return (t)
}
w <- read_ex(dfiles, 3)
w

# 3. Use your function from question 2 to read in the second data file. 
# Join this second file to ex_data by'ID.
ex_data %>% left_join(read_ex(dfiles, 2), by="ID")

# Or, since ID is the only common column name
ex_data %>% left_join(read_ex(dfiles, 2))

# 4. Write a function called read_ex_data() that takes a folder name as its argument and
#  1. reads in the data filenames from that folder,
#  2. calls read_ex() to read the first datafile into ex_data,
#  3. loops through the remaining data files, successively joining them to ex_data, and
#  4. returns ex_data.

ex_data
ex4 <- read_ex_data("Lab10Data")
ex4

# Method 1
read_ex_data <- function (x) {
  dfiles <- dir(x, full.names=TRUE)
  data <- read_ex(dfiles, 1)
  for(i in seq_along(dfiles))
    { if(i>1) { ex_data <- left_join(ex_data,read_ex(dfiles,i)) } }
  return (ex_data)
}

# Method 2
read_ex_data <- function (x) {
  filenames <- dir(x, full.names=TRUE)
  data <- read_ex(filenames, 1)
  for (i in 2:length(filenames)){
    data <- left_join(data, read_ex(filenames, i), by="ID")
  }
  return (data)
}

# Another method
read_ex_data <- function (x) {
  filenames <- dir(x, full.names=TRUE)
  data <- read_ex(filenames, 1)
  if (length(filenames)>1) {
    for (i in 2:length(filenames)){
      data <- left_join(data, read_ex(filenames, i), by="ID")
    }
    return (data)
  }
  else{
    return (data)
  }
}

