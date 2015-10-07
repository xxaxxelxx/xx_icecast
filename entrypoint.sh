#!/bin/bash

set -e
set -x


#function set_proxy() {
#}


#function set_player() {
#}

MODE="UNDEFINED"

case $1 in
    [dD][iI][sS][aA][bB][lL][eE][dD])
    MODE="DISABLED"
    exit
;;
    [pP][rR][oO][xX][yY])
    MODE="PROXY"
;;
    [pP][lL][aA][yY][eE][rR])
    MODE="PLAYER"
;;
    *)
    $1
#    exit 1
;;
esac

if [ $MODE = "PROXY" ]; then
    echo "PROXY"
    cp -f /etc/icecast2/icecast_proxy.xml /etc/icecast2/icecast.xml
elif [ $MODE = "PLAYER" ]; then
    echo "PLAYER"
    cp -f /etc/icecast2/icecast_player.xml /etc/icecast2/icecast.xml
else
    exit
fi

if [ -n "$IC_SOURCE_PASS" ]; then
    sed -i "s/<source-password>[^<]*<\/source-password>/<source-password>$IC_SOURCE_PASS<\/source-password>/g" /etc/icecast2/icecast.xml
fi
if [ -n "$IC_RELAY_PASS" ]; then
    sed -i "s/<relay-password>[^<]*<\/relay-password>/<relay-password>$IC_RELAY_PASS<\/relay-password>/g" /etc/icecast2/icecast.xml
fi
if [ -n "$IC_ADMIN_PASS" ]; then
    sed -i "s/<admin-password>[^<]*<\/admin-password>/<admin-password>$IC_ADMIN_PASS<\/admin-password>/g" /etc/icecast2/icecast.xml
fi

if [ -n "$SIMULCAST_MASTER_SERVER" ]; then
    sed -i "s/<server>SIMULCAST_MASTER_SERVER<\/server>/<server>$SIMULCAST_MASTER_SERVER<\/server>/g" /etc/icecast2/icecast.xml
fi
if [ -n "$CHANNEL_MASTER_SERVER" ]; then
    sed -i "s/<server>CHANNEL_MASTER_SERVER<\/server>/<server>$CHANNEL_MASTER_SERVER<\/server>/g" /etc/icecast2/icecast.xml
fi

icecast2 -c /etc/icecast2/icecast.xml

exit


