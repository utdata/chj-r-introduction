# Center for Health Journalism: R Introduction

> Trying to change to digitalocean with docker

A course by Andrew Ba Tran & Christian McDonald for the [Center for Health Journalism Data Fellowship](https://centerforhealthjournalism.org/event/2020-data-fellowship-1).

## Tutorials for each day

- [Day 1: Getting started](https://utdata.shinyapps.io/chj-day1/)
- [Day 2: Data wrangling](https://utdata.shinyapps.io/chj-day2/)
- [Day 3, Pt. 1: Combining data](https://utdata.shinyapps.io/chj-day3/)
- [Day 3, Pt. 2: Tidying data](https://utdata.shinyapps.io/chj-day3-2/)
- [Day 4: Visualizations](https://utdata.shinyapps.io/chj-day4/)
- [Day 5: Geospatial analysis](https://github.com/utdata/chj-r-introduction/blob/main/chj-day5/chj-day5-1-geospatial.Rmd)

## Download these files

Hopefully, you've created folder on your computer, maybe in your Documents folder called "CHJ" or something like that.

Once you've set your working directory (with maybe `setwd()`) then you can run these commands in your console to download the correct folders and data:

`install.packages("usethis")`

and then

`usethis::use_course("https://github.com/utdata/chj-r-introduction/archive/main.zip")`

## For Christian

Docker build:

`docker build -t chj-r-introduction .`

Docker run:

`docker run --rm -d -p 3838:3838 chj-r-introduction`

Check server logs:

`/var/log/shiny-server/`
