#!/bin/sh
# p2p-file.sh - connectd P2P initiator example script
# shows the use of a provisioning file to hold the target and user account details

usage()
{
    echo "usage: $0 <provisioning file>"
}

if [ "$1" = "" ]; then
    usage
    exit 1
fi

if [ "$(which connectd)" = "" ]; then
    echo "connectd is not properly installed."
    exit 1
fi

address=$(grep ^remote_address "$1" | awk '{ print $2 }')
port=$(grep ^proxy_local_port "$1" | awk '{ print $2 }')

connectd -f "$1" &

# get the process ID if the command is still running
pid=$(ps ax | grep connectd | grep "$1" | awk '{ print $1 }')
if [ "$pid" != "" ]; then
    sleep 10
    echo
    echo "Your connection is now active on $address port $port."
    echo
    echo "To terminate this connection, type in:"
    echo "kill $pid"
fi