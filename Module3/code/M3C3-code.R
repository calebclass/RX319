# Might need to reload tidyverse, data set (can just scroll back up)
heart

# Histogram
ggplot(data = heart, aes(x = max_hr)) +
  geom_histogram()

ggplot(data = heart, aes(x = max_hr)) +
  geom_histogram(bins = 15)

# Boxplots make comparisons
# Do people with heart disease achieve 
# different heart rates w/ exercise

ggplot(data = heart, aes(x = disease, y = max_hr)) +
  geom_boxplot()

# Number group variables can cause trouble
ggplot(data = heart, aes(x = factor(disease), y = max_hr)) +
  geom_boxplot()


# Add color to the boxplot
# Example: Is the effect the same for M/F 
ggplot(data = heart, 
       aes(x = disease, y = max_hr, color = sex)) +
  geom_boxplot()

ggplot(data = heart, 
       aes(x = sex, y = max_hr, fill = disease)) +
  geom_boxplot()

# It might make more sense to switch it -
ggplot(data = heart, aes(x = sex, y = max_hr, fill = disease)) +
  geom_boxplot()
# No we're comparing heart disease vs. healthy within each reported sex (interp)

# So these are just a few things you can do with histograms and box plots

