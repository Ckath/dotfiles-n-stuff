#!/bin/sh
# simple script to set brightness with notifications

if [ "$1" = "+" ]; then
    xbacklight + "$2" 
    notify-send.sh -r 20 "Brightness up $2\nCurrent is $(xbacklight -get)"
elif [ "$1" = "-"  ]; then
    xbacklight - "$2"
    notify-send.sh -r 20 "Brightness down $2\nCurrent is $(xbacklight -get)"
fi
