library(tidyverse)

sleep_data <- read_csv("modules/Module4-Wrangling/data/sleep_tracker_data.csv")

sleep_data
# Can see column type below column name
# blanks are automatically marked as NA

# Select picks the column
select(sleep_data, sleep_quality, wake_up) # choose columns
select(sleep_data, sleep_quality:sleep_notes)  # range of columns
select(sleep_data, -Start, -End) # removes columns

# <- to save the result
new_data <- select(sleep_data, -Start, -End) 

# Overwrite the old data
sleep_data <- select(sleep_data, -Start, -End) 


# Comparisons
60 > 50
60 = 50
60 == 50
60 > 50 & 60 < 70

# Slept at least 8 hours
filter(sleep_data, time_in_bed >= 8)

sleep_filtered <- filter(sleep_data, drank_coffee == TRUE | drank_tea == TRUE)
View(sleep_filtered)

# Sort by time_in_bed
arrange(sleep_data, time_in_bed)
arrange(sleep_data, desc(time_in_bed))

# Mutate 
# Unit conversion 
sleep_mutate <- mutate(sleep_data, 
                       activity_miles = activity_steps / 2000,
                       coffee_and_tea = drank_coffee & 
                         drank_tea)
View(sleep_mutate)


# Check column types
sleep_data
str(sleep_data)

mean(sleep_data$heart_rate)

View(sleep_data)


# The pipe: %>%

select(sleep_data, -Start, -End)
sleep_data %>% select(-Start, -End)  # Exactly the same

# Combine multiple commands
sleep_data <- sleep_data %>% select(-Start, -End) %>%
  mutate(heart_rate = as.numeric(heart_rate),
         wake_up = as.factor(wake_up))

# "Problem: NAs introduced by coercion" - not really a problem
sleep_data

summary(sleep_data)
summary(sleep_data$heart_rate)

sleep_data %>% select(heart_rate) %>%
  arrange(heart_rate)

sleep_data %>% select(heart_rate) %>%
  arrange(desc(heart_rate))

sleep_data <- sleep_data %>%
  filter(heart_rate > 1)
# Filtered out the 0 heart_rate

sleep_data %>% arrange(heart_rate)
  
  