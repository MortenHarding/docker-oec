# proxy3270 Docker container

- [This Repo](#this-repo)
- [Quick start guide](#Quick-start-guide)
  - [Prerequisites](#Prerequisites)
  - [Start the proxy3270 docker container](#start-the-proxy3270-docker-container)
- [Docker Build command](#docker-build-command)

# This Repo

The docker container in this repo, contain the [proxy3270](https://github.com/racingmars/proxy3270) repo. 

# Quick start guide

## Prerequisites

Install docker to use the container in this repository.

* [Docker](https://www.docker.com/get-started)

## Start the proxy3270 docker container

The default config.json file lists Forum3270

```sh
docker run --rm --name proxy3270 -p 3270:3270 mhardingdk/proxy3270 -unnegotiate
```

If you build your own config.json file, for example conf.json, you can mount it in the docker container using

```sh
docker run --rm --name proxy3270 -p 3270:3270 -v ./conf.json:/usr/app/proxy3270/config.json mhardingdk/proxy3270 -unnegotiate
```
Note: You can start the docker run command detached with -d

```sh
docker run -d --rm --name proxy -p 3270:3270 mhardingdk/proxy3270 -unnegotiate
```

# Docker Build command

To build the docker container from the dockerfile in this repo.

```SH
docker build -t proxy3270 .
```