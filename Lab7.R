library(tidyverse)
library(nycflights13)

# Add the latitude and longitude of each airport destination to the flights table using a join function.
# You will find the data on latitude and longitude in the airports table.
flights %>% left_join(select(airports, "faa", "lat", "lon"), by=c("dest" = "faa"))
flights
airports

#Create a table with the year-month-day-flight-tailnum combinations that have more than 1 flight (careful
# about missing tailnum). Use this table to filter the flights table and then select carrire, flight, origin
# and dest. Which airline used the same flight number for a plane that made a trip from La Guardia to
# St. Louis in the morning and from Newark to Denver in the afternoon?
temp <- flights %>%
  count(year,month,day,flight,tailnum) %>%
  filter(n > 1 , !is.na(tailnum))
temp

t2 <- flights %>%  
  inner_join(temp) %>%
  select(carrier, flight, origin, dest)
t2
view(t2) #WN the carrier, Southwest Airline

# One of the exercises in the lecture 7 notes asked you to create a table called top_dep_delay from the
# flights table. top_dep_delay was comprised of the year-month-days with the 3 largest total delays,
# where total delay is defined as the sum of the dep_delay variable for each year-month-day. Recreate
# top_dep_delay for this lab exercise. For each of the three top-delay days, report the median, third
# quartile and maximum of the dep_delay variable in flights.
flights
top_dep_delay <- flights %>% 
  group_by(year, month, day) %>% 
  summarize(total_delay=(sum(dep_delay, na.rm=TRUE)),
            median=(median(dep_delay,na.rm=TRUE)),
            Q3=(quantile(dep_delay,probs=0.75,na.rm=TRUE)),
            max=(max(dep_delay,na.rm=TRUE))) %>%
  arrange(desc(total_delay)) %>% 
  head(n=3)
top_dep_delay



flights %>% group_by(year, month, day)

?summarize()
?median()









