#!/bin/bash
nmcli device wifi rescan
CON=$(nmcli -t -f BARS,SSID device wifi | dmenu)
[[ -z $CON ]] && exit
nmcli device wifi connect "${CON##*:}"
