library(tidyverse)
dfiles <- dir("Lab11Data",full.names=TRUE)
dfiles

# 1.Write R code to read in the first file. Print the tibble that you just read in. Use names() to change the
# column names of the tibble to x and y. Repeat for the second file. How many observations are in these first two files?
file1 <- read_csv(dfiles[1])
file1
names(file1)[1:2] <- c("x","y")
file1
file2 <- read_csv(dfiles[2])
file2
names(file2)[1:2] <- c("x","y")
file2

file1 %>% full_join(file2, by ="x")
# 100 150 observations in each file

# 2. Use vector() to create an empty vector called ff that is of mode "list" and length 9. Now write a
# for() loop to loop over the 9 files in dfiles and for each (i) read the file in to a tibble, and change
# the column names to x and y as in part (1), and (ii) copy the tibble to an element of your list ff.
ff <-vector(mode="list", length=9)
for(i in 1:9) {
  file <- read_csv(dfiles[i])
  names(file)[1:2] <- c("x","y")
  ff[[i]] <- file
}
ff
# 3. Write a function called read.study_data that takes a vector of data file names (like dfiles) as input,
# reads the data files into a list, assigns class "study_data" to the list, and returns the list. Your function
# should use length(dfiles) to determine the number of files
read.study_data <- function(dfiles){
  ff <-vector(mode="list", length=length(dfiles))
  for(i in 1:length(dfiles)) {
    file <- read_csv(dfiles[i])
    names(file)[1:2] <- c("x","y")
    ff[[i]] <- file
  }
  class(ff) <- "study_data"
  return (ff)
}
fb <- read.study_data(dfiles)
fb

# 4. Write a function plot.study_data() that takes an object of class "study_data" as input. The first 5
# lines of your function should be the following, which creates a tibble with columns study, x and y:
# Have your function coerce study to a factor, and then call ggplot() to make a plot of y versus x, with
# different colours for the different studies. Add points and smoothers to your plot.
plot.study_data <- function(ff){
  dat <- NULL
  for(i in seq_along(ff)) {
    d <- ff[[i]]
    dat <- rbind(dat,tibble(study=i,x=d$x,y=d$y))
  }
  dat$study <- as.factor(dat$study)
  ggplot(dat, aes(x=x,y=y,color=study))+geom_point()+geom_smooth()
}
plot(fb)




plot.study_data <- function(ff){
  dat <- NULL 
  for(i in seq_along(ff)) {d <- ff[[i]]dat <- rbind(dat,tibble(study=i,x=d$x,y=d$y))}dat$study <- as.factor(dat$study)ggplot(dat, aes(x=x,y=y,color=study))+geom_point()+geom_smooth()}


