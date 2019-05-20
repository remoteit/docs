#!/bin/sh

uid="80:00:00:05:3A:00:14:FB"
address=127.0.0.1
port=33100

usage()
{
    echo "usage: $0 username password"
}

if [ "$1" = "" ]; then
    usage
    exit 1
elif [ "$2" = "" ]; then
    usage
    exit 1
fi
username=$1
password=$2

if [ "$(which connectd)" = "" ]; then
    echo "connectd is not properly installed."
    exit 1
fi

echo "Setting up a P2P connection to $uid on 127.0.0.1 port $port."
b64username="$(echo "$username" | tr -d '\n' | base64)"

b64password="$(echo "$password" | tr -d '\n' | base64)"

connectd -c $b64username $b64password "$uid" T"$port" 1 "$address" 12 &

# get the process ID if the command is still running
pid=$(ps ax | grep $b64username | grep $uid | awk '{ print $1 }')
if [ "$pid" != "" ]; then
    sleep 6
    echo
    echo "Your connection is now active on $address port $port."
    echo
    echo "To terminate this connection, type in:"
    echo "kill $pid"
fi
