########################## STAT 285 Tutorial 9 ##########################
################################ 2020 Fall ##############################
#### Exercise (P380, Q4), One-way ANOVA

# Create two data vectors
density <- c(30.4, 29.2, 27.7, 27.1, 27.1, 24.8, 25.5, 28.8)
manufacturer <- c(1, 1, 2, 2, 3, 3, 4, 4)

# Combine vectors into one data frame
foam.data <- data.frame(density, manufacturer = factor(manufacturer))
foam.data 

# Run the ANOVA test with the data frame
one.way <- aov(density ~ manufacturer, data = foam.data)

# Print the summary of the test
summary(one.way)

# The p-value is larger than the usual threshold of 0.05. 
# There is not a statistical difference between the group means.

