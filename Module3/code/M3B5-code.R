library(tidyverse)


# Online version -> Need to upload data set
# Used "upload" button and found data on our computer
# Then load into session (online or installed version)
heart <- read_csv("modules/Module3-Viz/data/heart.csv") 

heart
View(heart)

# Size of data set
dim(heart)  #303 rows (patients), 14 columns (characteristics)
nrow(heart)
ncol(heart)

# Quick check for number variables
summary(heart$age)  # $ lets you pick a certain column

# For character variables
table(heart$disease) # number of patients w/ each

# Relationship between age and max_hr
# data & aes can go inside ggplot or geom
ggplot(data = heart, aes(x = age, y = max_hr)) +
    geom_point()

# We want to look at the trend
ggplot(data = heart, aes(x = age, y = max_hr)) +
    geom_line()
# oops! geom_line connects the dots (good for sequential data, like data over time for one measurement)

# Smooth curve/line demonstrates relationship
ggplot(data = heart, aes(x = age, y = max_hr)) +
    geom_point() +
    geom_smooth()  # could add method="lm" for straight line


# Add color
ggplot(data = heart, aes(x = age, y = max_hr, color = disease)) +
    geom_point()

# If we want something not related to column of 'heart' data, 
# put outside aes()
ggplot(data = heart) +
    geom_point(aes(x = age, y = max_hr), color = "red")

# "Aesthetics" means we're using columns of the data set to change how the data is plotted, 
# but color is not using a column in this case.

# Let's try a bar graph (different chest_pain types)
# Two geoms : geom_col (x & y) & geom_bar (x only)
ggplot(data = heart, aes(x = chest_pain)) +
    geom_col()  

### geom_col uses the numbers we give it, we need geom_bar to count
ggplot(data = heart, aes(x = chest_pain)) +
    geom_bar()

