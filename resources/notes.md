## Stuff to consider

Import NYTimes covid case numbers

```{r}
covid <- read_csv("https://raw.githubusercontent.com/nytimes/covid-19-data/master/us-counties.csv")
```

Get daily cases: Since cases and deaths are cumulative, this subtracts the previous day to get the daily count.

```{r}
covid_daily <- covid %>%
  group_by(county, state, fips) %>%
  mutate(
    daily_cases = case_when(
      is.na(lag(cases)) ~ cases,
      TRUE ~ cases - lag(cases)
    ),
    daily_deaths = case_when(
      is.na(lag(deaths))~ deaths,
      TRUE ~ deaths-lag(deaths)
    )
  )
```


```{r}
covid_daily %>% 
  filter(state == "Texas", county == "Travis")
```


Covidtracking.co api

[found here](https://covidtracking.com/data/api)

```{r}
ctapi <- read_csv("https://api.covidtracking.com/v1/states/current.csv")
```

