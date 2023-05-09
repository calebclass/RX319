## In console, then in script
# One thing we might do is unit calculations
# Normally we'd just use a calculator, but maybe...

# pounds to grams
3*454  #CTRL-ENTER to run in script

# Scripts are good for saving your work.
# This is a "comment" (computer does not try to run it)

# Simple calculations using +-*/^
# Remember order of operations
6 * 3 + 2  # CTRL-ENTER
2 + 6 * 3
2+6*3  # Spaces are not required, but can make it a bit easier to read

# Use "objects" to save the result of one line of code
x <- 5
x
x*2

# Objects can be numbers or "characters"
y <- "moo"
y
y*2  # characters can't do math things

# Mention "Environment" window

# Example- 
# Alternative opioid (example from Dr. Ramsey, therapeutics & pain management)
# Patient has been taking morphine IV 10mg every 8 hours @ hospital. 
# Want to switch to oral on discharge
daily_IV <- 10 * 3  # How many mg of morphine per day
# We can't see the result in this case. We can see it by just typing the object name:
daily-IV
# Error: daily-IV # Can't use math operators in variable name: it's trying to do daily minus IV 
daily_IV

daily_PO <- daily_IV * 3  # Equianalgesic dose of oral morphine
daily_PO
