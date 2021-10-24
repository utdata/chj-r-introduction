## Import/Export Practice

Here are some exercises to try on your own.

## Create a practice project

1. Create a new project and call it `chj-practice`.
1. Create two folders inside the project: `data-raw` and `data-processed`.

## Import a csv file

1. Create a new R Notebook and call it `leso.Rmd`.
1. Add the libraries for tidyverse, janitor and lubridate.
1. Create a Markdown section that explains you are importing data.
1. Import the following CSV from this url:

`https://github.com/utdata/rwdir/blob/main/data-raw/leso.csv?raw=true`

1. Save the imported data into an R object and then print that to your screen using `head()`.
1. Use glimpse and summary to gander at the data.

### About the leso file

This is cleaned [data](https://www.dla.mil/DispositionServices/Offers/Reutilization/LawEnforcement/PublicInformation/) that originally came from the Defense Logistics Agency, which handles military surplus equipment transfers to local law enforcement through the Law Enforcement Support Office (LESO) or [LESO Program](https://www.dla.mil/DispositionServices/Offers/Reutilization/LawEnforcement/).

The data has the date, quantity and original value of equipment sent to local and state law enforcement agencies throughout the country.

We'll use this data in future practice assignments.

## Import an xlsx file

Still working in your `practice` project but in a new R Notebook ...

1. Create a new R Notebook called `maritime.Rmd`.
1. Add the libraries tidyverse, readxl, janitor and lubridate.
1. Use `download.file()` to download the file at this url: `https://github.com/utdata/chj-r-introduction/blob/main/students/chj-practice/data-raw/maritime-redacted.xlsx?raw=true`. Save the file in your data-raw folder as `data-raw/maritime.xlsx`.
1. Import the downloaded file into your notebook, use `clean_names()` to fix the column names and save into a new R object.
1. Use glimpse and summary to explore the data.
1. Export the data to an `.rds` file into the `data-processed` folder.



