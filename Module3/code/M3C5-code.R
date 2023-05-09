# Load tidyverse
library(tidyverse)

# Import pharmacokinetic data (need to upload if online)
PK_example <- read_csv("modules/Module3-Viz/data/PK_example.csv")
PK_example

# Plot a concentration-time profile then line
ggplot(PK_example, aes(x = Time, y = C2)) +
  geom_line()

# Modify limits
ggplot(PK_example, aes(x = Time, y = C2)) +
  geom_line() + 
    xlim(0, 10)

# Log scale
ggplot(PK_example, aes(x = Time, y = C2)) +
  geom_line() +
  scale_y_log10() 


# Add units to our axis labels
ggplot(PK_example, aes(x = Time, y = C2)) +
  geom_line() +
  scale_y_log10() +
  xlab("Hours from Dosing") +
  ylab("Concentration (ng/mL)")


# And themes are nice, also easy (optional)
# Search ggplot themes to see your options
ggplot(PK_example, aes(x = Time, y = C2)) +
  geom_line() +
  scale_y_log10() +
  xlab("Hours from Dosing") +
  ylab("Concentration (ng/mL)") +
  theme_bw()
