#!/bin/bash

set -e
set -x

MODE="BASH"

case $1 in
    [pP][rR][oO][xX][yY])
    MODE="PROXY"
;;
    [pP][lL][aA][yY][eE][rR])
    MODE="PLAYER"
;;
    [bB][aA][sS][hH])
    MODE="BASH"
;;
esac

# mode section
if [ $MODE = "PROXY" ]; then
    cp -f /etc/icecast2/icecast_proxy.xml /etc/icecast2/icecast.xml
elif [ $MODE = "PLAYER" ]; then
    cp -f /etc/icecast2/icecast_player.xml /etc/icecast2/icecast.xml
fi

# password section
if [ -n "$IC_SOURCE_PASS" ]; then
    sed -i "s/<source-password>[^<]*<\/source-password>/<source-password>$IC_SOURCE_PASS<\/source-password>/g" /etc/icecast2/icecast.xml
fi
if [ -n "$IC_RELAY_PASS" ]; then
    sed -i "s/<relay-password>[^<]*<\/relay-password>/<relay-password>$IC_RELAY_PASS<\/relay-password>/g" /etc/icecast2/icecast.xml
fi
if [ -n "$IC_ADMIN_PASS" ]; then
    sed -i "s/<admin-password>[^<]*<\/admin-password>/<admin-password>$IC_ADMIN_PASS<\/admin-password>/g" /etc/icecast2/icecast.xml
fi

# port section
if [ -n "$IC_PORT" ]; then
    sed -i "s/<port>IC_PORT<\/port>/<port>$IC_PORT<\/port>/g" /etc/icecast2/icecast.xml
fi
if [ -n "$PROXY_SERVER_PORT" ]; then
    sed -i "s/<port>PROXY_SERVER_PORT<\/port>/<port>$PROXY_SERVER_PORT<\/port>/g" /etc/icecast2/icecast.xml
fi
if [ -n "$MASTER_SERVER_PORT" ]; then
    sed -i "s/<port>MASTER_SERVER_PORT<\/port>/<port>$MASTER_SERVER_PORT<\/port>/g" /etc/icecast2/icecast.xml
fi

# address section
if [ -n "$SIMULCAST_MASTER_SERVER_BBR" ]; then
    sed -i "s/<server>SIMULCAST_MASTER_SERVER_BBR<\/server>/<server>$SIMULCAST_MASTER_SERVER_BBR<\/server>/g" /etc/icecast2/icecast.xml
fi
if [ -n "$CHANNEL_MASTER_SERVER_BBR" ]; then
    sed -i "s/<server>CHANNEL_MASTER_SERVER_BBR<\/server>/<server>$CHANNEL_MASTER_SERVER_BBR<\/server>/g" /etc/icecast2/icecast.xml
fi
if [ -n "$SIMULCAST_MASTER_SERVER_TDY" ]; then
    sed -i "s/<server>SIMULCAST_MASTER_SERVER_TDY<\/server>/<server>$SIMULCAST_MASTER_SERVER_TDY<\/server>/g" /etc/icecast2/icecast.xml
fi
if [ -n "$CHANNEL_MASTER_SERVER_TDY" ]; then
    sed -i "s/<server>CHANNEL_MASTER_SERVER_TDY<\/server>/<server>$CHANNEL_MASTER_SERVER_TDY<\/server>/g" /etc/icecast2/icecast.xml
fi
if [ -n "$SIMULCAST_MASTER_SERVER_OW" ]; then
    sed -i "s/<server>SIMULCAST_MASTER_SERVER_OW<\/server>/<server>$SIMULCAST_MASTER_SERVER_OW<\/server>/g" /etc/icecast2/icecast.xml
fi
if [ -n "$CHANNEL_MASTER_SERVER_OW" ]; then
    sed -i "s/<server>CHANNEL_MASTER_SERVER_OW<\/server>/<server>$CHANNEL_MASTER_SERVER_OW<\/server>/g" /etc/icecast2/icecast.xml
fi

# execution
if [ $MODE = "BASH" ]; then
    bash
else
    icecast2 -c /etc/icecast2/icecast.xml
fi

exit
