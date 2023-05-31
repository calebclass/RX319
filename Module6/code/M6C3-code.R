library(tidyverse)

library(readr)
heart_example_2 <- read_csv("Butler_projects/Teaching/RX_Courses/RX319-IntroToAnalytics/modules/Module6-ML/data/heart_example_2.csv")

heart_example_2
dim(heart_example_2)

# Remove missing values
heart_example <- heart_example_2 %>% na.omit
dim(heart_example)

# Dendrograms prefer numbers
# (bonus)
is.numeric(heart_example$chest_pain)
heart_num <- heart_example %>% 
    select_if(is.numeric)
heart_num

# Remove "result" variable
heart_num <- heart_num %>%
    select(-disease)
heart_num

# Calculate "distance" between each patient
heart_dist <- dist(heart_num)
heart_dist

# Plot dendrogram
heart_clust <- hclust(heart_dist)
plot(heart_clust)

heart_num[122,]  # incorrect rest_bp
heart_num[39,]  # very high chol







