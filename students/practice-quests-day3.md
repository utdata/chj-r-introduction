## Practice quests - Day 3
  
### Go to your chj-practice project
  
1. Open up chj-practice.proj
2. Load the tidyverse package




### Find the csv link on this page https://data.cdc.gov/Vaccinations/COVID-19-Vaccinations-in-the-United-States-County/8xkx-amqh
### import it with read_csv() and assign it to the object "vax"


# this will take maybe 10 minutes to download
# save it as an RDS file ("vax.RDS") to your data-raw folder for later

saveRDS(vax, "data-raw/vax.RDS")


## Load the library that works with dates
library(______)

## Let's filter it to the latest week of data

```{r }
vax_recent <- vax %>% 
  mutate(Date=mdy(Date)) %>% 
  group_by(FIPS) %>% 
  arrange(desc(Date)) %>% 
  slice(1)
```

## 1. Which states have the highest the county average vaccination rate? (Series_Complete_Pop_Pct)
### (Call the new column whatever you like)


## 2. Which states have the lowest?



## Import in this presidential election results data by county
## https://docs.google.com/spreadsheets/d/e/2PACX-1vTRNr9AxpysIFXKHymcCynzdWAJUePkCi3M6E0z5shAPVv1MCQQA2DnLkgUjaQzrq6m0I2mWw80SYvC/pub?gid=456911902&single=true&output=csv
### save it to the object "election"


## 3. take a summarized look at vax_recent and election



# #4. What column(s) could you join on?



## 5. Take a closer look at those columns, what problems could you foresee with the joins?

### Let's focus on the fips/FIPS columns

## 6. What is the data type in election$fips?


## 7. What is the data type in vax_recent$FIPS?


### Let's fix these so join well

election <- election %>% 
  mutate(
    fips=as.character(fips),
    FIPS=case_when(
      nchar(fips)==4 ~ paste0("0", fips),
      TRUE ~ fips
    ))

## 8. join election to vax_recent
### call the dataframe vax_election


## 9. What's the average vaxination rate based on who was voted on in the county?
### Start with the vax_election dataframe


# 10. What was the rate two months ago (let's say 8/20/21)
### Start with the vax data frame
vax %>% 
  mutate(Date=mdy(Date)) %>% 
  filter(Date==mdy("08/20/21")) %>% 
# THREE MORE LINES OF CODE GO HERE
  
## 11. What's the percent point difference between then and now for Trump-leaning counties?


## 12. What's the percent point difference between then and now for Biden-leaning counties?




## 13. Which county saw the biggest jump in vaccination rates between June 1 and October 1?

### a. Start with the vax dataframe
### b. Change the Date column into a date
### c. Filter to June 1, 2021 and October 1,2021
### d. Isolate the county, state, date, and Series_Complete_Pop_Pct columns
### e. pivot_wider!
### f. do math to calculate change
### g. sort the dataframe so biggest change is first

