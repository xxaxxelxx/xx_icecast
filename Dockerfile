FROM debian:jessie
MAINTAINER xxaxxelxx <x@axxel.net>
RUN apt-get -qq -y update
#RUN apt-get -qq -y dist-upgrade

ENV DEBIAN_FRONTEND=noninteractive

RUN apt-get -qq -y install icecast2
RUN apt-get clean

COPY icecast_player.xml /etc/icecast2/icecast_player.xml
COPY icecast_proxy.xml /etc/icecast2/icecast_proxy.xml
RUN chown icecast2:icecast /etc/icecast2/icecast*.xml
RUN chmod 400 /etc/icecast2/icecast*.xml

COPY ./entrypoint.sh /entrypoint.sh
RUN chown icecast2:icecast /entrypoint.sh
RUN chmod 700 /entrypoint.sh

ENV IC_SOURCE_PASS=myicsourcepass
ENV IC_RELAY_PASS=myicrelaypass
ENV IC_ADMIN_PASS=myicadminpass
ENV SIMULCAST_MASTER_SERVER=0.0.0.0
ENV CHANNEL_MASTER_SERVER=0.0.0.0

USER icecast2:icecast

EXPOSE 8001

ENTRYPOINT [ "/entrypoint.sh" ]
CMD [ "bash" ]
