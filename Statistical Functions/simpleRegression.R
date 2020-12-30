#-------------------------------------------------------------------
#  SIMPLE REGRESSION 
#-------------------------------------------------------------------
x<-c(6,6.3,6.5,6.8,7,7.1,7.5,7.5,7.6)
y<-c(39,58,49,53,80,86,115,124,104)
plot(x,y,main="Simple Linear Regression")

Sxy = sum((x-mean(x))*(y-mean(y))) # mean(x) is \bar{x}
Sxx = sum((x-mean(x))^2)

beta1hat = Sxy/Sxx
beta0hat = mean(y) - beta1hat*mean(x)

beta0hat
beta1hat

yhat = beta0hat+beta1hat*x
SSE = sum((y-yhat)^2)
n = length(y)

SST = sum((y-mean(y))^2)
SSR = SST - SSE

R2 = SSR/SST
R2

  
stdError = sqrt((SSE/(n-2))/Sxx)
stdError
tstat = beta1hat/stdError
tstat
2*pt(tstat, df=n-2, lower.tail = FALSE)


# use the R package 
lm.out<-lm(y~x)
lm.out
summary(lm.out)
lines(x,fitted(lm.out))
anova(lm.out)



