#! /bin/bash

function pingSweep() {
    echo "Running ping sweep"
    for ip in $(seq 2 50); do
        ping -c 1 -W 1 10.0.5.$ip | grep -q "1 received" && echo 10.0.5.$ip >> sweep.txt
    done
    echo "sweep done and is in sweep.txt"
}

function fpingSweep() {
    echo "Running fping sweep"
    fping -a -q -g 10.0.5.2 10.0.5.50 > sweep2.txt
    echo "fping sweep done and its in sweep2.txt"
}

function nmapSweep() {
    echo "NMap Scaning"
    sudo nmap -n -vv -sn 10.0.5.2-50 > sweep3.txt
    echo "contents can be found in sweep3.txt"
}

while :
do
    echo ""
    echo "[1] Ping sweep  -> sweep.txt"
    echo "[2] Fping sweep -> sweep2.txt"
    echo "[3] Nmap sweep  -> sweep3.txt"
    echo "[4] Quit"
    echo "======================================"
    echo -n "Select an option [1-4]: "
    read userInput
    echo ""

    case "$userInput" in
        1) pingSweep ;;
        2) fpingSweep ;;
        3) nmapSweep ;;
        4) echo ; break ;;
        *) echo "Choose 1 through 4" ;;
    esac
done
