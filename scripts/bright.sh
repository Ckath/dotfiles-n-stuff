#!/bin/bash
# simple script to set brightness with notifications

if [ "$1" = "+" ]; then
    ybacklight -d intel_backlight +"$2" 
    notify-send.sh -r 20 "Brightness up $2\nCurrent is $(ybacklight -d intel_backlight -get)"
elif [ "$1" = "-"  ]; then
    ybacklight -d intel_backlight -"$2"
    notify-send.sh -r 20 "Brightness down $2\nCurrent is $(ybacklight -d intel_backlight -get)"
fi
