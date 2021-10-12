# Exercises

# 1. import data from chj-day2-p1/data/
# file name: All Maritime I-D reports 1.1 - 4.30 - REDACTED.xlsx

# Q1. What two packages do you need to load?
# Go ahead and load them
#--------------------------------
library(tidyverse)
library(xlsx)


# Q1: Load the xlsx spreadsheet into an object called "reports"
# do you remember what function to use?
#-------------------------------- 

reports <- read_excel("chj-day2-p1/data/All Maritime I-D reports 1.1 - 4.30 - REDACTED.xlsx")


# Q2: How many rows is it?
# A2: 1631 
#-------------------------------- 

glimpse(reports)


# Q3: Create a new dataframe called "LA" with people who were at QStation of Los Angeles
# How many rows is it? 
# A3: 67
#-------------------------------- 

LA <- reports %>% 
  filter(QStation=="Los Angeles")

# Q4: Can you narrow the LA dataframe from 100 colums to the columns:
# ReportDate, DeathIllness, NotificationTime, Agency, PersonType, and Gender?
# select()
#-------------------------------- 

LA <- LA %>% 
  select(ReportDate, DeathIllness, NotificationTime, Agency, PersonType, Gender)

# Q5: What's the earliest date someone from QStation Los Angeles became sick?
#filter, select, arrange
# A5: January 1, 11:27:00 UTC
#-------------------------------- 

LA %>% 
  arrange(ReportDate) %>% 
  slice(1)


# Q6: What's the latest date someone from QStation Los Angeles became sick in the data?
# A6: April 20, 12:18 UTC
#-------------------------------- 

LA %>% 
  arrange(desc(ReportDate)) %>% 
  slice(1)


# Q7: Create a new dataframe called "crew" with people who were a Crew Member (PersonType) 
# How many rows is it? 
# A7: 961
#-------------------------------- 

crew <- reports %>% 
  filter(PersonType=="Crew Member")

nrow(crew)

# Q8: What's the percent of crew to everyone else who got sick?
# A8: 59%
#-------------------------------- 

961/1631*100
