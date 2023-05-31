library(readxl)
stroke_example <- read_excel("Butler_projects/Teaching/RX_Courses/RX319-IntroToAnalytics/modules/Module5-Analysis/data/stroke_example.xlsx")

library(tidyverse)
stroke_example <- stroke_example %>%
    select(gender:stroke) %>%
    mutate(bmi = as.numeric(bmi))

View(stroke_example)

# RPART - Recursive partitioning
# Makes a decision tree
# Install package (not if using the web version)
#install.packages("rpart")  # only need to do once

# Call the library (PC / web)
library(rpart)

# Code is similar to linear regression
# Result ~ Predictors
fit <- rpart(stroke ~ gender + age + avg_glucose_level + bmi,
             data = stroke_example)
fit

# Help!
?rpart

# Plot the decision tree
par(xpd = NA) # otherwise on some devices the text is clipped
plot(fit)
text(fit, use.n = TRUE)

# Interpret: If TRUE -> Move to the left
# Top Number: Chance of a stroke (fraction)
   #  0.17 -> Older than 67.5 has 17% risk
   # n = 856 -> 856 participants older than 67.5
# Younger than 67.5 -> another decision
# age < 53.5

# Predict stroke from everything else
fit <- rpart(stroke ~ .,
             data = stroke_example)

par(xpd = NA) # otherwise on some devices the text is clipped
plot(fit)
text(fit, use.n = TRUE)

ggplot(stroke_example, 
       aes(x = as.factor(stroke), y = age)) +
    geom_boxplot()

# Mess w/ parameters (pros only - not recommended)
fit <- rpart(stroke ~ .,
             data = stroke_example,
             control = rpart.control(cp = 0.006))

par(xpd = NA) # otherwise on some devices the text is clipped
plot(fit)
text(fit, use.n = TRUE, pretty = TRUE)

table(stroke_example$smoking_status)









