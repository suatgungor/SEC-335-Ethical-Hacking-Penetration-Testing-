#!/bin/bash

for ip in $(seq 2 50); do ping -c 1 -W 1 10.0.5.$ip | grep -q "1 received" && echo 10.0.5.$ip >> sweep.txt; done
