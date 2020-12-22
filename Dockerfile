FROM rocker/shiny

RUN apt-get -y update \
    && apt-get install -y --no-install-recommends apt-utils \
    && apt-get -y install git \
    && sudo apt-get -y install libssl-dev libxml2-dev libudunits2-dev libgdal-dev libproj-dev libgeos-dev git default-jre default-jdk \
    && DEBIAN_FRONTEND=noninteractive \
    && apt-get -y install default-jre-headless\
    && apt-get clean \
    && rm -rf /var/lib/apt/lists/*

# Install OpenJDK-8
RUN apt-get update && \
    apt-get install -y openjdk-8-jdk && \
    apt-get install -y ant && \
    apt-get clean;

# Fix certificate issues
RUN apt-get update && \
    apt-get install ca-certificates-java && \
    apt-get clean && \
    update-ca-certificates -f;

# Setup JAVA_HOME -- useful for docker commandline
ENV JAVA_HOME /usr/lib/jvm/java-8-openjdk-amd64/
RUN export JAVA_HOME

# WORKDIR /srv/shiny-server    
# COPY depends.r /srv/shiny-server/
# RUN Rscript depends.r
# COPY start.sh /srv/shiny-server/

RUN R -e "install.packages(c('shiny', 'shinydashboard', 'tidyverse', 'learnr', 'rmarkdown', 'lubridate', 'janitor', 'DT', 'readxl', 'flair', 'sf'), repos='http://cran.rstudio.com/')"

# copy lessons
RUN mkdir -p /srv/shiny-server/chj-day1
COPY chj-day1/index.Rmd /srv/shiny-server/chj-day1
COPY chj-day1/index.html /srv/shiny-server/chj-day1
ADD chj-day1/images/ /srv/shiny-server/chj-day1/images/

RUN mkdir -p /srv/shiny-server/chj-day2
COPY chj-day2/index.Rmd /srv/shiny-server/chj-day2
COPY chj-day2/index.html /srv/shiny-server/chj-day2
ADD chj-day2/images/ /srv/shiny-server/chj-day2/images/
ADD chj-day2/data/ /srv/shiny-server/chj-day2/data/

RUN mkdir -p /srv/shiny-server/chj-day3-p1
COPY chj-day3-p1/index.Rmd /srv/shiny-server/chj-day3-p1
COPY chj-day3-p1/index.html /srv/shiny-server/chj-day3-p1
ADD chj-day3-p1/data/ /srv/shiny-server/chj-day3-p1/data/

RUN mkdir -p /srv/shiny-server/chj-day3-p2
COPY chj-day3-p2/index.Rmd /srv/shiny-server/chj-day3-p2
COPY chj-day3-p2/index.html /srv/shiny-server/chj-day3-p2
ADD chj-day3-p2/images/ /srv/shiny-server/chj-day3-p2/images/

RUN mkdir -p /srv/shiny-server/chj-day4
COPY chj-day4/index.Rmd /srv/shiny-server/chj-day4/
COPY chj-day4/index.html /srv/shiny-server/chj-day4/
ADD chj-day4/images/ /srv/shiny-server/chj-day4/images/
ADD chj-day4/data/ /srv/shiny-server/chj-day4/data/
ADD chj-day4/chj-day4_files/figure-html/ /srv/shiny-server/chj-day4/chj-day4_files/figure-html/

# COPY shiny-server.conf /etc/shiny-server/shiny-server.conf
#COPY first_toot /srv/shiny-server/


EXPOSE 3838

# COPY shiny-server.sh /usr/bin/shiny-server.sh
# CMD ["/usr/bin/shiny-server.sh"]
# see https://github.com/rocker-org/shiny/issues/32
# RUN ["chmod", "+x", "/usr/bin/shiny-server.sh"]

# docker-compose down && docker-compose rm && docker-compose up --force-recreate --build