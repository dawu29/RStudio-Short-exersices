x1=c(20.5,28.1,27.8,27,28,25.2,25.3,27.1,20.5,31.3)
x2=c(26.3,24,26.2,20.2,23.7,34,17.1,26.8,23.7,24.9)
x3=c(29.5,34,27.5,29.4,27.9,26.2,29.9,29.5,30,35.6)
x4=c(36.5,44.2,34.1,30.3,31.4,33.1,34.1,32.9,36.3,25.5)




x1=c(0.5,0.9,1.1)
x2=c(0.7,0.6,0.8)
x3=c(0.6,1,1)

xx <- data.frame(cbind(x1,x2,x3))
xx
summary(xx)
xxx <- stack(xx)
re <- aov(values ~ ind, data=xxx)
summary(re)

sum(x1);sum(x2);sum(x3)

sum(x1+x2+x3)

sum(xxx$values^2)


qf(0.95,2,6)
qf(0.05,2,6,lower.tail=FALSE)
pf(0.44681,2,6,lower.tail=FALSE)

