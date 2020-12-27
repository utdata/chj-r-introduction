# Docker commands

Pushes to `main` branch get autobuilt to Dockerhub.

### Docker build

`docker build -t chj-r-introduction .`

### Docker run

`docker run --rm -dp 3838:3838 chj-r-introduction`

or

`docker run --rm -dp 3838:3838 critmcdonald/chj-r-introduction`

### Check server logs

`/var/log/shiny-server/`

