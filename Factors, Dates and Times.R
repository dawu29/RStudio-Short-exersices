library(tidyverse)
library(forcats)
library(lubridate)
yvr <- read_csv("weatherYVR.csv")
yvr

# 1. Coerce the Date/Time variable to a date object and rename it Date.
yvr <- yvr %>% mutate(`Date/Time` = ymd(`Date/Time`,tz="America/Vancouver")) %>%
  rename(Date=`Date/Time`)
yvr

# 2. Make a time series plot (with lines) of the daily maximum temperature by day.
ggplot(yvr,aes(x=Date,y=`Max Temp`)) + geom_line()

# 3. Change the Month variable from numeric to a factor. (Hint: The month() function with the label=TRUE
# will extract the months from a date-time object.)
yvr$Month <- month(yvr$Date, label = TRUE)
yvr
levels(yvr$Month)
# 4. Plot the average maximum temperature versus month. Then, redo this plot with months ordered by
# average maximum.
yvr %>% group_by(Month) %>%
  summarize(`Average Maximum` = mean(`Max Temp`,na.rm=TRUE)) %>%
  ggplot(aes(x=Month,y=`Average Maximum`)) +  
  geom_point() + labs(y="Average Maximum", x = "Month")

yvr %>% group_by(Month) %>%
  summarize(`Average Maximum` = mean(`Max Temp`,na.rm=TRUE)) %>%
  ggplot(aes(x=fct_reorder(Month,`Average Maximum`),y=`Average Maximum`)) +  
  geom_point() + labs(y="Average Maximum", x = "Month")

