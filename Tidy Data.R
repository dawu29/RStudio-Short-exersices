library(tidyverse)
hiv <- read_csv("HIVprevRaw.csv")
spec(hiv)

hiv.1 <- rename(hiv, Country = "Estimated HIV Prevalence% - (Ages 15-49)")
view(hiv.1)

hiv %>% select(-("1979":"1989"))
hiv %>% select(-("1979":"1989"))
hiv.2 <- select(hiv.1,-(`1979`:`1989`))
hiv.2 <- select(hiv.1,-(2:12))
view(hiv.2)


# Gather the yearly prevalence estimates into key, value pairs with year as the key and prevalence as
# the value. When you gather, remove explicity missing values. After gathering, sort on "Country".

hiv.2 %>% gather(2:23, key=year,value=prevalence,na.rm=TRUE) %>% arrange(Country)
hiv.2 %>% gather(`1990`:`2011`, key=year,value=prevalence,na.rm=TRUE) %>% arrange(Country)
hiv.3 <- hiv.2 %>% gather(`1990`:`2011`, key=year,value=prevalence,na.rm=TRUE) %>% arrange(Country)
view(hiv.3)

hiv.2 %>% gather("1990":"2011",key=year,value=prevalence,na.rm=TRUE)
hiv.2 %>% gather("1990":"2011",prevalence,year,na.rm=TRUE)







