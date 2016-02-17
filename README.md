# ***ICECAST***
# Icecast module
# Part of Dockerized Distributed Streaming System

[xxaxxelxx/xx_icecast](https://index.docker.io/u/xxaxxelxx/xx_icecast/)

## Synopsis
This repo is the base for an [automated docker build](https://hub.docker.com/r/xxaxxelxx/xx_icecast/) and is part of a dockerized distributed streaming system consisting of following elements:
* [xxaxxelxx/xx_icecast](https://github.com/xxaxxelxx/xx_icecast)
* [xxaxxelxx/xx_bridgehead](https://github.com/xxaxxelxx/xx_bridgehead)
* [xxaxxelxx/xx_coverter](https://github.com/xxaxxelxx/xx_converter)
* [xxaxxelxx/xx_customerweb](https://github.com/xxaxxelxx/xx_customerweb)
* [xxaxxelxx/xx_geograph](https://github.com/xxaxxelxx/xx_geograph)
* [xxaxxelxx/xx_icecast](https://github.com/xxaxxelxx/xx_icecast)
* [xxaxxelxx/xx_liquidsoap](https://github.com/xxaxxelxx/xx_liquidsoap)
* [xxaxxelxx/xx_loadbalancer](https://github.com/xxaxxelxx/xx_loadbalancer)
* [xxaxxelxx/xx_logsplitter](https://github.com/xxaxxelxx/xx_logsplitter)
* [xxaxxelxx/xx_pulse](https://github.com/xxaxxelxx/xx_pulse)
* [xxaxxelxx/xx_reflector](https://github.com/xxaxxelxx/xx_reflector)
* [xxaxxelxx/xx_rrdcollect](https://github.com/xxaxxelxx/xx_rrdcollect)
* [xxaxxelxx/xx_rrdgraph](https://github.com/xxaxxelxx/xx_rrdgraph)
* [xxaxxelxx/xx_sshdepot](https://github.com/xxaxxelxx/xx_sshdepot)
* [xxaxxelxx/xx_sshsatellite](https://github.com/xxaxxelxx/xx_sshsatellite)

The running docker container provides a service for very special streaming purposes usable for a distributed architecture.
It presumably will not fit for you, but it is possible to tune it. If you need some additional information, please do not hesitate to ask.

This [xxaxxelxx/xx_icecast](https://hub.docker.com/r/xxaxxelxx/xx_icecast/) repo is an essential part of a complex compound used for streaming.

## Usage

It supports three modes.

***
### PROXY mode
Container operates as a proxy for player containers.

#### ENVIRONMENT
> ATTENTION: Always set your own passwords to prevent any unauthorized access!!!

- IC_ADMIN_PASS=*myadminpass*
- IC_SOURCE_PASS=*mysourcepass*
- IC_RELAY_PASS=*myrelaypass*
- IC_PORT=*8000*
- MASTER_SERVER_PORT=*80*
- SIMULCAST_MASTER_SERVER_BBR=*0.0.0.0*
- SIMULCAST_MASTER_SERVER_TDY=*0.0.0.0*
- SIMULCAST_MASTER_SERVER_OW=*0.0.0.0*
- CHANNELS_MASTER_SERVER_BBR=*0.0.0.0*
- CHANNELS_MASTER_SERVER_TDY=*0.0.0.0*
- CHANNELS_MASTER_SERVER_OW=*0.0.0.0*

#### EXPOSED
- 8000

#### USER
- icecast2:icecast

#### Run it
```bash
$ docker run -d --name icecast_proxy -p 8000:8000  -e CHANNELS_MASTER_SERVER_CUSTOMER=AAA.BBB.CCC.DDD SIMULCAST_MASTER_SERVER_CUSTOMER=AAA.BBB.CCC.DDD -e IC_PORT=8000 -e MASTER_SERVER_PORT=80 -e IC_ADMIN_PASS=ADMINPASS --restart=always xxaxxelxx/xx_icecast proxy
```
***

### PLAYER mode
Container operates as a player and get his streams from a proxy.

#### ENVIRONMENT
> ATTENTION: Always set your own passwords to prevent any unauthorized access!!!

- IC_ADMIN_PASS=*myadminpass*
- IC_SOURCE_PASS=*mysourcepass*
- IC_RELAY_PASS=*myrelaypass*
- IC_PORT=*80*
- SIMULCAST_PROXY_SERVER_BBR=*0.0.0.0*
- SIMULCAST_PROXY_SERVER_TDY=*0.0.0.0*
- SIMULCAST_PROXY_SERVER_OW=*0.0.0.0*
- CHANNELS_PROXY_SERVER_BBR=*0.0.0.0*
- CHANNELS_PROXY_SERVER_TDY=*0.0.0.0*
- CHANNELS_PROXY_SERVER_OW=*0.0.0.0*

#### EXPOSED
- 8000

#### USER
- icecast2:icecast

#### Run it
```bash
$ docker run -d --name icecast_player -p 8000:8000  -e CHANNELS_PROXY_SERVER_CUSTOMER=AAA.BBB.CCC.DDD -e IC_PORT=8000 -e PROXY_SERVER_PORT=8000 -e IC_ADMIN_PASS=ADMINPASS -e IC_SOURCE_PASS=SOURCEPASS -v /usr/share/icecast2/web -v /var/log/icecast2:/var/log/icecast2 --restart=always xxaxxelxx/xx_icecast player
```
***

## License

[MIT](https://github.com/xxaxxelxx/xx_Liquidsoap/blob/master/LICENSE.md)
