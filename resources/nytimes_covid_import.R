
library(tidyverse)
library(RCurl) #we'll use this to grab a URL
library(stats)


# We're going to use COVID case and death data compiled by the New York Times
# we'll pull it directly from their live github page
# Documentation: https://github.com/nytimes/covid-19-data


#turn the URL into a variable that we can reference in following code
url <- getURL("https://raw.githubusercontent.com/nytimes/covid-19-data/master/us-counties.csv")


#use the read_csv() function to import the data from the URL and turn it into a dataframe
covid <- read_csv(url)


#Important to note that the data is cumulative. There is a record for each date in each county when cases were reported, but each new date is an accumulation from all the previous dates
# in order to look at new cases per day or per week, we need to do some conversions


#add columns that provide daily counts of cases and deaths
#this uses the lag() function from the stats package

covid_daily <- covid %>%
  group_by(county, state, fips) %>%
  mutate(daily_cases = case_when(is.na(lag(cases))~ cases,  TRUE ~ cases - lag(cases)),
         daily_deaths = case_when(is.na(lag(deaths))~ deaths, TRUE ~ deaths-lag(deaths)))