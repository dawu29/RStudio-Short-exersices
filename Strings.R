library(tidyverse)
library(stringr)

# Graphing youth unemployment data
# 1. Read the youth unemployment data in the file API_ILO_country_YU.csv, in the Lab8 folder on Canvas,
# into a data frame called youthUI.
youthUI <- read_csv("API_ILO_country_YU.csv")
head(youthUI)
colnames(youthUI)
?extract_numeric()

# 2.Reshape the data on different years into key-value pairs with key year and value Unemployment Rate.
# Convert the year column to numeric.
youthUI <- gather(youthUI, `2010` : `2014`, key = year, value = `Unemployment Rate`, convert=TRUE)
head(youthUI)
sd(youthUI$year)
sapply(youthUI, class)
# youthUI$year <- as.integer(youthUI$year)
# youthUI$year <- parse_integer(youthUI$year)


# 3. Plot unemployment rates by year for each "country" in youthUI. Represent each time series by a line.
# Use an appropriate alpha level to manage overplotting.
ggplot(youthUI,aes(x=year,y=`Unemployment Rate`)) +
  geom_line(aes(group=`Country Name`),alpha=0.3)
ggplot(youthUI,aes(x=year,y=`Unemployment Rate`,group=`Country Name`)) + geom_line(alpha=0.3)
ggplot(youthUI) + geom_line(aes(x=year,y=`Unemployment Rate`,group=`Country Name`),alpha=0.3)


# 4. Using a regular expression, extract the subset of "Countries" whose Country Name contains the
# string "(IDA & IBRD countries)" or "(IDA & IBRD)", and save in a data frame youthDevel. 
# (No cheating by using fixed(). Hint: ( is a special character string, so a character string 
# representation of  regexp involving ( would include "'\(".) Then, using a regular expression, 
#remove the "(IDA & Development Association. Countries that qualify for IDA loans are considered 
# among the poorest developing countries in the world. IBRD stands for International Bank for 
# Reconstruction and Development. IBRD countries are considered middle-income developing countries.
head(youthUI)
youthDevel <- filter(youthUI, str_detect(`Country Name`, " \\(IDA & IBRD countries\\)| \\(IDA & IBRD\\)"))
youthDevel$`Country Name` <- str_replace_all(youthDevel$`Country Name`, " \\(IDA & IBRD countries\\)| \\(IDA & IBRD\\)", "")
youthDevel
youthDevel$`Country Name`

# 5. Plot unemployment rates by year for each region in youthDevel with different colors for 
# each region. Your plot should include both points and lines for each region. Then add a layer 
# that plots the world-wide unemployment data from youthUI (Country.Name==World).
world <- filter(youthUI, `Country Name`== "World")
world
ggplot(youthDevel,aes(x=year,y=`Unemployment Rate`)) +
  geom_line(mapping = aes(color = `Country Name`)) + 
  geom_point(aes(color = `Country Name`)) +
  geom_line(world, mapping = aes(x=year,y=`Unemployment Rate`, color = `Country Name`)) + 
  geom_point(world, mapping = aes(x=year,y=`Unemployment Rate`, color = `Country Name`))



