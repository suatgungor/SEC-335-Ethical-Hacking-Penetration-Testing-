#!/bin/bash 


echo "DNS Resolver"
echo "====================="

read -p "enter the network you want to scan this will be a /24 scan: " network
read -p "enter the DNS server you want to scan: " DNS

if [ -z "$network" ] || [ -z "$DNS" ]; then
  echo "there was a mistake please input the correct network prefix and DNS Server"
  exit 1
fi

echo "scanning right now"

> dnsReverse.txt

for i in $(seq 1 254); do
  nslookup "$network.$i" "$DNS" | grep "name =" >> dnsReverse.txt
done

cat dnsReverse.txt
