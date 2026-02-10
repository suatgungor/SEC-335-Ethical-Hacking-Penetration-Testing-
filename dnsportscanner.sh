#!/bin/bash

echo "DNS /24 Port Scaner"
echo "--========================--"

read -p "Enter network prefix such as 10.0.5: " networkPrefix
read -p "Enter port to scan such as 53: " scanPort

# tthis will check to see if the user put in the correct information
if [ -z "$networkPrefix" ] || [ -z "$scanPort" ]; then
  echo "there was a mistake please input the correct network prefix and port number"
  exit 1
fi

echo "Scanning $networkPrefix.0/24 on TCP port $scanPort"
echo "Open host after the scan:"

# this will make sure to get rid of the informatiooon gatherd from previous scans
outputFile="DnsPortScannerResults.txt" > "$outputFile"

for ip in $(seq 1 254); do
  bash -c "echo > /dev/tcp/$networkPrefix.$ip/$scanPort" 2>/dev/null
  if [ $? -eq 0 ]; then
    echo "$networkPrefix.$ip" | tee -a "$outputFile" #tee = show the output on the screen and also save it to the file which in this case is outputfile
  fi
done

echo "everything is saved to $outputFile"

