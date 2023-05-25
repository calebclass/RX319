# Load stroke data
library(readxl)
stroke_example <- read_excel("data/stroke_example.xlsx")

stroke_example %>% select(heart_disease, stroke)

# Is heart_disease correlated with stroke?
# Fisher's exact test
fisher.test(stroke_example$heart_disease,
            stroke_example$stroke)
# p = 7x10^-15 << 0.05 (stat. signif.)
# OR = 4.7 -> positively correlated
# Patients with heart disease more likely to have stroke

# OR = 1 -> no difference
# OR > 1 -> positive correlation
# OR < 1 -> negative correlation

table(HD = stroke_example$heart_disease,
            stroke = stroke_example$stroke)
