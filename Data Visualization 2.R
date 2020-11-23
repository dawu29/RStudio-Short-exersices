library(tidyverse)
hiv <- read.csv("HIVprev.csv",stringsAsFactors = FALSE)
hiv <- select(hiv,Country, year, prevalence)
head(hiv)
tail(hiv)
summary(hiv)

ggplot(hiv,aes(x=year,y=prevalence,group=Country)) + geom_line()

e1 <- ggplot(hiv,aes(x=year,y=prevalence,group=Country)) + 
  geom_line(aes(color=prevalence)) +
  ggtitle("Estimated HIV Prevalence 1990-2000") +
  labs(y="estimated prevalence")
e1

e2 <- ggplot(hiv,aes(x=year,y=prevalence,group=Country)) + 
  geom_line(color="orange") +
  #ggtitle("Estimated HIV Prevalence 1990-2000") +
  labs(y="estimated prevalence (%)")
e2


e2 <- ggplot(hiv,aes(x=year,y=prevalence,group=Country)) + 
  geom_smooth(color="orange", se=FALSE) +
  #ggtitle("Estimated HIV Prevalence 1990-2000") +
  labs(y="estimated prevalence (%)")
e2

cc <- c("Botswana","Central African Republic","Congo","Kenya","Lesotho","Malawi",
        "Namibia","South Africa","Swaziland","Uganda","Zambia","Zimbabwe")
hihiv <- filter(hiv,Country %in% cc)


e3 <- ggplot(hiv,aes(x=year,y=prevalence)) + 
  #geom_line(mapping=aes(group=Country),color="grey",alpha=0.3) + 
  geom_line(data=hihiv, mapping=aes(group=Country), color="blue", alpha=0.3) +
  #geom_smooth(data=hiv, color="black") +
  geom_smooth(data=hihiv, color="orange") 
  #ggtitle("Estimated HIV Prevalence 1990-2000") +
  #labs(y="estimated prevalence")
e3


?geom_line
?geom_smooth

#Question 2
ggplot(hiv,aes(x=year,y=prevalence,group=Country)) + 
  geom_smooth(color="orange", se=FALSE) +
  labs(y="estimated prevalence (%)")
#Question 3
ggplot(hiv,aes(x=year,y=prevalence)) + 
  geom_line(data=hihiv, mapping=aes(group=Country), color="blue", alpha=0.3) +
  geom_smooth(data=hihiv, color="orange") 
windows.options(antialias = "cleartype") 




