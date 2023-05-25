library(tidyverse)
library(readxl)
stroke_example<-read_excel("data/stroke_example.xlsx")

stroke_example 

# Relationship between glucose level and bmi?
ggplot(stroke_example, aes(x = avg_glucose_level, 
                           y = bmi)) +
    geom_point()

stroke_example
stroke_example %>% select(bmi)

# Need to convert bmi to numeric!
stroke_example <- stroke_example %>% 
    mutate(bmi = as.numeric(bmi)) %>% 
    select(-MRN, -name)
stroke_example

ggplot(stroke_example, aes(x = avg_glucose_level, 
                           y = bmi)) +
    geom_point()
ggplot(stroke_example, aes(x = avg_glucose_level, 
                           y = bmi)) +
    geom_point() +
    geom_smooth()
ggplot(stroke_example, aes(x = avg_glucose_level, y = bmi)) +
    geom_point() +
    geom_smooth(method = "lm") # straight line

# Calculate a correlation
cor(stroke_example$bmi, stroke_example$avg_glucose_level)
cor(stroke_example$bmi, 
    stroke_example$avg_glucose_level, 
    use = "complete.obs")
# Weak correlation

# Easier -- just use cor.test (also provides p-val)
cor.test(stroke_example$bmi, 
         stroke_example$avg_glucose_level)
# "statistically significant", still weak correlation


### Linear Regression - predict bmi from glucose level

# predicting ~ predictors
bmi_model <- lm(bmi ~ avg_glucose_level, 
                data = stroke_example)
summary(bmi_model)  
# bmi = 25.6 + 0.03 * avg_glucose_level
# Extremely small p-vals suggest that these "estimates" are non-zero

# Multiple predictors

bmi_model2 <- lm(bmi ~ avg_glucose_level + age, 
                 data = stroke_example)
summary(bmi_model2) 
# bmi = 22.4 + 0.02 * avg_glucose_level + 0.11 * age
# Notice that the effect predicted from avg_glucose_level is lower now
# Age is more important

# We don't rely exclusively on p-values ("statistical significance") here -- 
# "clinical significance" - is this practically meaningful


# Logistic regression -- predict the risk of stroke
# Should be a 0/1 variable on the left

stroke_model <- glm(stroke ~ avg_glucose_level, 
                    data = stroke_example, family = "binomial")
summary(stroke_model)

# Odds ratio:
exp(stroke_model$coefficients)
# For every 1 mg/dL increase, stroke risk is multiplied by 1.01 
# (increases by about 1%)


# We can also do multivariate, or use factor variables
stroke_model2 <- glm(stroke ~
                         avg_glucose_level + age + 
                         heart_disease + Residence_type, 
                     data = stroke_example, family = "binomial")
summary(stroke_model2)

exp(stroke_model2$coefficients)
# Interpretation


# Use everything with the .
stroke_model3 <- glm(stroke ~ ., 
                     data = stroke_example, family = "binomial")
summary(stroke_model3)
