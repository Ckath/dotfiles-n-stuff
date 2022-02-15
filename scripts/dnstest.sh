#!/bin/bash
# check if any of the dns servers is currently ded

if [[ -z "$1" ]]; then
    echo "usage: dnstest.sh address"
    exit 1
fi

SERVERS=( "84.200.69.80"
		"195.10.195.195"
		"91.217.137.37"
		"51.83.172.84" )

for s in "${SERVERS[@]}"; do
	echo "dns server $s:"
	timeout 1s drill -Q @$s $1 && echo -e "\e[1;32mPASSED\e[0m" || echo -e "\e[1;31mFAILED\e[0m"
	printf "%.s─" $(seq 1 $(tput cols))
done
