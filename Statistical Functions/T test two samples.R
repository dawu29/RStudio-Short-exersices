########################## STAT 285 Tutorial 8 ##########################
################################ 2020 Fall ##############################
#### Exercise 1. (P380, Q23)

high <- c(1.2, 0.9, 0.7, 1.0, 1.7, 1.7, 1.1, 0.9, 1.7, 
          1.9, 1.3, 2.1, 1.6, 1.8, 1.4, 1.3, 1.9, 1.6,
          0.8, 2.0, 1.7, 1.6, 2.3, 2.0)
poor <- c(1.6, 1.5, 1.1, 2.1, 1.5, 1.3, 1.0, 2.6)


# (a) Construct normal probability plots to verify the plausibility of both samples 
# having been selected from normal population distributions. 

# A normal probability plot helps to determine whether a sample is drawn from a normal 
# distribution. If the sample was actually selected from the specified distribution, the
# sample percentiles (ordered sample observations) should be reasonably close to the 
# corresponding population distribution percentiles.
# A plot for which the points fall close to some straight line suggests 
# that the assumption of a normal population distribution is plausible.

qqnorm(high, main = "Normal Q-Q Plot for High-Quality Fabric")
qqline(high)

qqnorm(poor, main = "Normal Q-Q Plot for Poor-Quality Fabric")
qqline(poor)

# The linear pattern in each plot supports the assumption that the extensibility
# distributions under the two types of fabric are both normal.



# (b) Construct a comparative boxplot. Does it suggest that there is a difference
# between true average extensibility for high-quality fabric specimens and that for
# poor-quality specimens? 

boxplot(high, poor, main = "Comparative Boxplot", names = c("high", "poor"))

# It does not suggest a noticeable difference between true average extensibility 
# for two types of fabric because the two boxes overlap a lot. Need to carry
# out a test of hypotheses.



# (c) Use the two-sample t test to decide whether true average extensibility differs 
# for the two types of fabric. 

# H0: no difference on true average extensibility between two types of fabric
# Ha: true average extensibility differs for the two types of fabric (two-tailed)

# Sample statistics
m <- length(high)
x.bar <- mean(high)
s1 <- sqrt(var(high))

n <- length(poor)
y.bar <- mean(poor)
s2 <- sqrt(var(poor))

# Test statistic value
(t.stat <- (x.bar-y.bar)/sqrt(s1^2/m+s2^2/n))

# Degree of freedom (round it down to the nearest integer)
s1=2.3
m=48
s2=4.1
n=51

(df <- floor((s1^2/m+s2^2/n)^2/((s1^2/m)^2/(m-1) + (s2^2/n)^2/(n-1))))


# I. Critical value approach: reject H0 if t <= -t_{alpha/2,df}
(t.crit <- qt(0.025, df, lower.tail = TRUE))

# Since t.stat > t.crit, we do not reject H0.

# II. P-value approach
(p.value <- 2*pt(abs(t.stat), df, lower.tail = FALSE))

# Since P-value >> 0.05, we do not reject H0.

# There is no evidence to conclude that true average extensibility differs for
# the two types of fabric

# Note: t.test() is available for performing one and two sample t-tests. Degree of 
# freedom is not rounded down to the nearest integer in t.test().
t.test(high, poor, alternative = "two.sided", var.equal = FALSE)


