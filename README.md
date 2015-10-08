# Icecast for use with Docker

[![](http://dockeri.co/image/xxaxxelxx/xx_icecast)](https://index.docker.io/u/xxaxxelxx/xx_icecast/)

## Synopsis
This repo is the base for an [automated docker build] (https://hub.docker.com/r/xxaxxelxx/xx_icecast/).

The running docker container provides a preconfigured icecast for very special streaming purposes usable for a distributed architecture.
It presumably will not fit for you, but it is possible to tune it. If you need some additional information, feel free to ask.

## Usage

It supports three modes.

***
### PROXY mode
Container operates as a proxy for player containers.

####Environment####
> ATTENTION: Always set your own passwords to prevent any unauthorized access!!!

- IC_ADMIN_PASS=*myadminpass*
- IC_SOURCE_PASS=*mysourcepass*
- IC_RELAY_PASS=*myrelaypass*
- SIMULCAST_MASTER_SERVER=*0.0.0.0*
- CHANNEL_MASTER_SERVER=*0.0.0.0*

####Run it####
```bash
$ docker run -d -p 80:8000 -e IC_ADMIN_PASS=myspecialadminpass -e IC_SOURCE_PASS=*myspecialsourcepass -e IC_RELAY_PASS=*myspecialrelaypass -e SIMULCAST_MASTER_SERVER=address -e CHANNEL_MASTER_SERVER=address --name mycontainername xxaxxelxx/xx_icecast proxy
```
***

### PLAYER mode
Container operates as a player and get his streams from a proxy.

####Environment####
> ATTENTION: Always set your own passwords to prevent any unauthorized access!!!
- IC_ADMIN_PASS=*myadminpass*
- IC_SOURCE_PASS=*mysourcepass*
- IC_RELAY_PASS=*myrelaypass*

####Run it####
```bash
$ docker run -d -p 80:8000 -e IC_ADMIN_PASS=myspecialadminpass -e IC_SOURCE_PASS=*myspecialsourcepass -e IC_RELAY_PASS=*myspecialrelaypass --name mycontainername xxaxxelxx/xx_icecast player
```
***

### BASH mode
**IS FOR TESTING PURPOSES**

Will not start any icecast process but prepares the environment.

####Environment####
**ATTENTION: ALWAYS SET YOUR OWN PASSWORDS TO PREVENT ANY UNAUTHORIZED ACCESS !!!**

- IC_ADMIN_PASS=*myadminpass*
- IC_SOURCE_PASS=*mysourcepass*
- IC_RELAY_PASS=*myrelaypass*

####Run it####
```bash
$ docker run -it -p 80:8000 -e IC_ADMIN_PASS=myspecialadminpass -e IC_SOURCE_PASS=*myspecialsourcepass -e IC_RELAY_PASS=*myspecialrelaypass -e SIMULCAST_MASTER_SERVER=address -e CHANNEL_MASTER_SERVER=address --name mycontainername xxaxxelxx/xx_icecast
```
***

## License

[MIT](https://github.com/xxaxxelxx/xx_icecast/blob/master/LICENSE)
