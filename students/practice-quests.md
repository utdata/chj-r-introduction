## Practice Quests

Here are some exercises to try on your own. There are **two** datasets with separate tasks, broken up by the session we cover the material.

### Create a practice project

1. Create a new project and call it `chj-practice`.
1. Create two folders inside the project: `data-raw` and `data-processed`.

> Important note for all days: You should use the **Restart R and Clear Output** option under the **Run** tool menu when you switch between the `leso.Rmd` and `maritime.Rmd` notebooks.

## LESO quests

This is cleaned [data](https://www.dla.mil/DispositionServices/Offers/Reutilization/LawEnforcement/PublicInformation/) that originally came from the Defense Logistics Agency, which handles military surplus equipment transfers to local law enforcement through the Law Enforcement Support Office (LESO) or [LESO Program](https://www.dla.mil/DispositionServices/Offers/Reutilization/LawEnforcement/).

The data has the date, quantity and original value of equipment sent to local and state law enforcement agencies throughout the country.

### Day 1

#### Import a csv file

1. Create a new R Notebook and call it `leso.Rmd`.
1. Add the libraries for tidyverse, janitor and lubridate.
1. Create a Markdown section that explains you are importing data.
1. Import the following CSV from this url:

`https://github.com/utdata/rwdir/blob/main/data-raw/leso.csv?raw=true`

1. Save the imported data into an R object and then print that to your screen using `head()`.
1. Use glimpse and summary to gander at the data.

### Day 2, Part 1

This covers select, filter and arrange.

1. Create an R object that has only records from "TX" (or your state).
2. Remove the following columns: sheet, state, nsn and both demil_ columns.
3. What is the most expensive item in the list and who go it?

### Day 2, Part 2

This covers mutate, group_by, summarize and arrange.

1. Create a `total_value` columns from `quantity` and `acquisition_value`.
1. Find agency in TX (or your state) with most `total_value`.
1. For "AUSTIN POLICE DEPT" (or agency close to you) get a list of items, totalling the `quantity` and `total_value`. The function to add together is `sum()`. Sort it by highest summed total value.
  - If you want to find an agency in the list, you can filter using `str_detect()` for part of the word. The filter for partial matches like this: `filter(str_detect(agency_name, "AGENCYNAMEPART"))`

## Maritime health reports

This data is [Cruise Ships: Reporting Maritime Death or Illness (non-gastrointestinal) to DGMQ](https://www.cdc.gov/quarantine/cruise/reporting-deaths-illness/index.html) from the CDC.

This was obtained through a FOIA request in May, 2020, so it is a little dated.

### Day 1

#### Import an xlsx file

Still working in your `practice` project but in a new R Notebook ...

1. Create a new R Notebook called `maritime.Rmd`.
1. Add the libraries tidyverse, readxl, janitor and lubridate.
1. Use `download.file()` to download the file at this url: `https://github.com/utdata/chj-r-introduction/blob/main/students/chj-practice/data-raw/maritime-redacted.xlsx?raw=true`. Save the file in your data-raw folder as `data-raw/maritime.xlsx`.
1. Import the downloaded file into your notebook, use `clean_names()` to fix the column names and save into a new R object called `reports`.
1. Use glimpse and summary to explore the data.
1. How many rows are in all the reports?
1. What is the date range of the data? `report_date` is the date field of interest.
1. Export the data to an `.rds` file into the `data-processed` folder.

### Day 2, Part 1

Picking up with the `reports_cut` object you created above.

1. Reduce the data from the 100 columns to the following variables and save into a new R object called `reports_cut`: report_date, death_illness, q_station, notification_time, agency, person_type, gender, vessel_name, presumptive_diagnosis. 
1. From the `reports_cut` data, create a new dataframe called "crew" with people who were a Crew Member (person_type). How many reports?
1. What's the percentage of crew to everyone else who got sick? (You'll have to do a little math, but you have the values.)

### Day 2, Part 2

1. Where were the most people held in quarantine? `q_station` is the field.
1. Which ship (`vessel_name`) had the most "2019 Novel Coronavirus" cases? 
  - You can filter using `str_detect()` for part of the word. You filter partial matches like this: `filter(str_detect(agency_name, "Coronavirus"))`.
1. How many people died within the data? `death_illness` is the field.

