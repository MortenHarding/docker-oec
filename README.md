# oec Docker container

- [This Repo](#this-repo)
- [Quick start guide](#Quick-start-guide)
  - [Prerequisites](#Prerequisites)
  - [Attach your oec HW interface](#attach-your-oec-hw-interface)
  - [Identify the device name](#identify-the-device-name)
  - [Start the oec docker container](#start-the-oec-docker-container)
- [Docker Build command](#docker-build-command)

# This Repo

The docker container in this repo, contain the [oec](https://github.com/lowobservable/oec) python app, used as a replacement for the IBM 3174 Establishment Controller. 

# Quick start guide

## Prerequisites

Install docker to use the container in this repository.

* [Docker](https://www.docker.com/get-started)

## Attach your oec HW interface

You find build instructions at [interface2](https://github.com/lowobservable/coax/tree/master/interface2), or you can buy a prebuild interface from [tindie 3270 USB Interface IBM](https://www.tindie.com/products/approachware/3270-usb-interface-ibm/) 

## Identify the device name

On Linux you would look in /dev/ for the attached usb device name.

## Start the oec docker container

By default, the docker run cmd will output a help message from oec.

```sh
docker run --rm oec
```

Help mesage from oec

```sh
usage: python -m oec [-h] serial_port {tn3270,vt100} ...

IBM 3270 terminal controller

positional arguments:
  serial_port     serial port

options:
  -h, --help      show this help message and exit

subcommands:
  emulator

  {tn3270,vt100}
    tn3270        TN3270 emulator
    vt100         VT100 emulator
```

To use oec, start it with the device name, the emulator tn3270, and hostname:port of the 3270 host you wish to connect to.

In the below example:
* Device name : /dev/ttyxxx
* Emulator    : tn3270
* Hostname    : www.moshix.tech:2300

```sh
docker run --rm --device=/dev/ttyxxx --name ibm3174 oec /dev/ttyxxx tn3270 www.moshix.tech:2300
```

Note: You can start the docker run command detached with -d

```sh
docker run -d --rm --device=/dev/ttyxxx --name ibm3174 oec /dev/ttyxxx tn3270 www.moshix.tech:2300
```

# Docker Build command

To build the docker container from the dockerfile in this repo.

```SH
docker build -t oec .
```