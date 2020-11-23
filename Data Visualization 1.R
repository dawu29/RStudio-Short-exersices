library(tidyverse)
hiv <- read.csv("HIVprev.csv",stringsAsFactors = FALSE)
head(hiv)
hiv <- select(hiv,Country, year, prevalence)
head(hiv)
tail(hiv)
summary(hiv)

##hiv <- filter(hiv,Country == "Botswana")


cc <- c("Botswana","Central African Republic","Congo","Kenya","Lesotho","Malawi",
        "Namibia","South Africa","Swaziland","Uganda","Zambia","Zimbabwe")
hihiv <- filter(hiv,Country %in% cc)

p <- ggplot(hiv, aes(x=year, y=prevalence, color=Country))

ggplot(hiv,aes(x=year,y=prevalence,group=Country)) + geom_point() + 
  ggtitle("how are you")

ggplot(hiv,aes(x=year,y=prevalence)) + geom_line(aes(group=Country))  
ggplot(hiv,aes(x=year,y=prevalence)) + geom_smooth(aes(group=Country))  


ggplot(hiv,aes(group=Country)) + geom_line(aes(x=year,y=prevalence))

ggplot(data=hiv,aes(x=year,y=prevalence,group=Country)) + 
  stat_smooth(geom="line", alpha=0.3) + 
  geom_smooth(data=hihiv,alpha=0.5,color="red")

ggplot(hiv,aes(x=year,y=prevalence)) + geom_line(aes(group=Country))


ggplot(hiv, mapping = aes(x=year, y=prevalence, color=Country))+
  geom_line(hihiv, mapping = aes(x=year, y=prevalence, color="red"))



p + geom_line(alpha=0.4) + theme(legend.position="none")
p + geom_smooth(method = "loess",alpha=0.4) + theme(legend.position="none")
p + geom_point(alpha=0.4) + theme(legend.position="none")


cc <- c("Botswana","Central African Republic","Congo","Kenya","Lesotho","Malawi",
        "Namibia","South Africa","Swaziland","Uganda","Zambia","Zimbabwe")
hihiv <- filter(hiv,Country %in% cc)
p2 <- ggplot(hihiv, aes(x=year, y=prevalence, color=Country))
p2 + geom_line() 
p2 + geom_smooth() 
