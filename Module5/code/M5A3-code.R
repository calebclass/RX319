?sleep
head(sleep)
# Data set automatically loaded

library(tidyverse)

# 2 objects for 2 groups
group1 <- sleep %>% 
    filter(group == 1) %>% 
    select(extra) # only 1 column
group1

group2 <- sleep %>% 
    filter(group == 2) %>% 
    select(extra)
group2

# Run the t test
t.test(group1, group2)  

# Does one group get better sleep than the other?
# p = 0.08 -> Would not reject the "null hypothesis" (not stat. signif.)
# (i.e. not strong enough evidence that difference not due to random chance)

# Run t.test directly from data table
# result ~ group
t.test(extra ~ group, data = sleep)


# Paired t test
# For "paired" observations -- patients must be in same order 
# (i.e. 1-10 in group1, 1-10 in group2)
sleep
t.test(extra ~ group, data = sleep, paired = TRUE)
# p < 0.05 -> statistically significant


# ANOVA
# Just change function name
# Can be more than 2 groups

result <- aov(extra ~ group, data = sleep)
summary(result)
