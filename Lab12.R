library(tidyverse)
library(purrr)
dfiles <- dir("Lab11Data",full.names=TRUE)
dfiles

# 1. Write a function read_rename_csv() that (i) reads in a CSV file with read_csv() and (ii) changes
# the names of the columns of the resulting tibble to c("x","y"). (Compare to results from Lab 11.)
read_rename_csv <- function(x) {
  file <- read_csv(x)
  names(file)[1:2] <- c("x","y")
  return (file)
}
ex1 <- read_rename_csv(dfiles[1])
ex1
dfiles[1]
dfiles

# 2. Use map() and read_rename_csv() to read and rename all 9 files from the Lab11Data folder.
ex2 <- map(dfiles, function(x){read_rename_csv(x)})
ex2


# 3. Re-do your call to map() from the previous Exercise (Exercise 2). This time, define the function that
# reads and renames the data files on the fly, using ~ and ., as seen in the lecture notes. Do you prefer
# the approach of Exercise 2 or of Exercise 3 (this Exercise)?
ex3 <- map(dfiles, ~ {
  y <- read_csv(.)
  names(y)[1:2] <- c("x","y")
  return (y)}
)
ex3

# 4. We will now apply the forward pipe several times to get an equivalent to the plot.study_data()
# function you wrote in Lab 11. The steps to take are
#  i. Pipe dfiles through a call to map() that reads and renames the files (use your code from either
#     Exercise 2 or 3, whichever you preferred),
#  ii. pipe the result through bind_rows(.id="study") (read the documentation for bind_rows()),
#  iii. pipe the result through mutate() to change study to a factor, and
#  iv. pipe the result into ggplot() to make the plot.

dfiles %>% 
  map(~{y <- read_csv(.); names(y)[1:2] <- c("x","y"); return (y)}) %>%
  bind_rows(.id="study") %>%
  mutate(study=factor(study)) %>%
  ggplot(aes(x=x,y=y,color=study))+geom_point()+geom_smooth()














