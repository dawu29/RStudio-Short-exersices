library(tidyverse)
hiv <- read.csv("HIVprevRaw.csv",stringsAsFactors = FALSE)
head(hiv)
hivcopy <- hiv


# Exercises:
# 1. The first column of the data frame is the country, but it has been named: 
# Estimated.HIV.Prevalence.....Ages.15.49.1.
# Use the rename() function to rename this column Country

hiv <- rename(hiv, Country = Estimated.HIV.Prevalence.....Ages.15.49.)


# The data from 1979 to 1989 is very sparse. Remove these columns from the data frame
hiv <- select(hiv, -(X1979:X1989))
select(hiv,Estimated.HIV.Prevalence.....Ages.15.49.,(X1990:X2011))

head(hiv)
?rename

# Sort the data in descending order of prevalence in 2011. 
# Print the first 6 rows of your final data set.
hiv <- arrange(hiv,desc(X2011))
hiv <- arrange(desc(X2011))
head(hiv)

# Use the copy hivcopy and the pipe operator to chain or 
# "pipe" the data manipulations of exercises 1-3

head(hivcopy)

rename(hivcopy, Country = Estimated.HIV.Prevalence.....Ages.15.49.) %>%
  select(-(X1979:X1989)) %>% 
  arrange(desc(X2011)) %>%
  head()

hivcopy %>% rename(Country = Estimated.HIV.Prevalence.....Ages.15.49.) %>%
  select(-(X1979:X1989)) %>% 
  arrange(desc(X2011)) %>%
  head()











