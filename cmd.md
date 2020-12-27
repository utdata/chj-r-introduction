# Using Docker

## Rebuild the container locally

- Update and "Run Document" for anything that changes.
- Use Docker to kill the current process
- Rebuild the image: `docker build -t chj-r-introduction .`
- Start the container: `docker run --rm -dp 3838:3838 chj-r-introduction`

## Update the Docker server

- Update and "Run Document" for anything that changes.
- Push the repo to Github and merge with `main`, which builds a new Docker image. This takes some time.
- Log into the digitalocean server
- Find the current Docker process: `docker ps`
- Stop the current Docker: `docker stop container_name`
- Remove the current container: `docker rm container_name`
- Pull the updated image: `docker pull critmcdonald/chj-r-introduction`
- Start the container: `docker run --rm -dp 3838:3838 critmcdonald/chj-r-introduction`

## Container server logs

Logs are stored in:

`/var/log/shiny-server/`

### Check server log locally

Use the >_ tool in Docker. Use `ls` in the above directory to get the name, then `cat` to view the file.

### Check server log remotely

Use `docker exec container_name ls /var/log/shiny-server/` to see the name of the log file.

Use `docker exec container_name cat /var/log/shiny-server/log-name.log` to see the log.
