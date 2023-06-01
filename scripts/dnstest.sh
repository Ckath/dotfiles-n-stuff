#!/bin/bash
# check if any of the dns servers is currently ded

if [[ -z "$1" ]]; then
    echo "usage: dnstest.sh address"
    exit 1
fi

SERVERS=( "84.200.69.80"
		"195.10.195.195"
		"217.160.166.161"
		"51.254.162.59"
		"9.9.9.9"
		"185.236.104.104"
		"216.146.35.35" )

for s in "${SERVERS[@]}"; do
	echo "dns server $s:"
	timeout 1s drill -Q @$s $1 && echo -e "\e[1;32mPASSED\e[0m" || echo -e "\e[1;31mFAILED\e[0m"
	printf "%.s─" $(seq 1 $(tput cols))
done
