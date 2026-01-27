#! /bin/bash

hostfile=$1
portfile=$2

if [ -z "$hostfile" ] || [ -z "$portfile" ]; then
    echo "you need to give host file and port file for this script to work"
    exit 1
fi

echo "host,port"

for host in $(cat $hostfile); do
    for port in $(cat $portfile); do
        bash -c "echo > /dev/tcp/$host/$port" 2>/dev/null && echo "$host,$port"
    done
done
