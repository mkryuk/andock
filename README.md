# Dockerized Angular with nginx on front

## Build

Run `docker build -t andock .` to build the image and tag it with andock name.

## Run with docker

Run `docker run -p 8080:80 andock` to run container on 8080 port or `docker run -d -p 8080:80 andock` for detach mode

## Run with docker compose

Run `docker-compose up` it will build the image if needed and run the container on port `80`
