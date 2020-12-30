########################  Tutorial 11 ######################## 

#### Exercise 1.
#### X: wheat in tons
#### Y: price of the kilo of flour

x<-c(30, 28, 32, 25, 25, 25, 22, 24, 35, 40)
y<-c(25, 30, 27, 40, 42, 40, 50, 45, 30, 25)

# Look at scatterplot first
plot(x, y, main="Scatterplot", xlab = "wheat in tons", ylab="price per kilo flour")



### (a) Fit the regression line using the method of least squares.

## Method I: Manual calculation
(Sxy = sum((x-mean(x))*(y-mean(y))))
(Sxx = sum((x-mean(x))^2))

(beta1hat = Sxy/Sxx)
(beta0hat = mean(y) - beta1hat*mean(x))


## Method II: Use lm() to fit linear models and extract coefficients
lm.fit <- lm(y ~ x)
lm.fit$coefficients

# So the linear regression line is yhat=74.11512-1.353675x.


### (b) Compute a 95% confidence interval for the slope of the regression line.

# Compute for SSE
yhat = beta0hat+beta1hat*x
SSE = sum((y-yhat)^2)
n = length(y)
sigmahat = sqrt(SSE/(n-2))
t.crit = qt(1-0.025, df = n-2)

# Build  a 95% CI for beta 1
(Lower <- beta1hat - t.crit*sqrt(sigmahat^2/Sxx))
(Upper <- beta1hat + t.crit*sqrt(sigmahat^2/Sxx))

# Thus, the 95% CI for the slope beta 1 is [-2.045938, -0.661413]



### (c) Test the hypothesis that the price of flour depends linearly on the production 
# of wheat, using a 0.05 significance level.

# H0: beta1 = 0
# H1: beta1 != 0

## Method I: t test
(test.stat <- (beta1hat-0)/sqrt(sigmahat^2/Sxx)) # ~ t distribution with df = n-2
(p.value <- 2*pt(abs(test.stat), df=n-2, lower.tail = F))  # 2*(Area under the t curve to the right of |t|)

## Method II: F test
anova <- aov(y ~ x)
summary(anova)

# Since p value < 0.05, we reject H0. The price of flour depends linearly on the 
# production of wheat at the given significance level, which confirms the utility of 
# the model.


### (d): Find CI and PI for a new data point x*=30
x.star <- data.frame(x=30)

## The confidence interval around the mean response for a fixed value x*
predict(lm.fit, newdata = x.star, interval = 'confidence', level = 0.95) # CI = p[29.66295, 37.34676] 

# This means that, according to our model, with 30 tons of wheat produced, on average, it will have 
# a price between 29.66 and 37.35 per kilo flour.


## The prediction interval for a future Y observation given a fixed value x*
predict(lm.fit, newdata = x.star, interval = 'predict', level = 0.95)  # PI = [21.13677, 45.87294]

# This means that, according to our model, 95% of 30 tons of wheat have a price between 21.14 
# and 45.87 per kilo flour.
