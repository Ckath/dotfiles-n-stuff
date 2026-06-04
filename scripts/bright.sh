#!/bin/bash
# simple script to set brightness with notifications

if [ "$1" = "+" ]; then
    ybacklight -d intel_backlight +"$2" 
    notifyck -t "Brightness up $2%" "Current is $(ybacklight -d intel_backlight -get)"
elif [ "$1" = "-"  ]; then
    ybacklight -d intel_backlight -"$2"
    notifyck -t "Brightness down $2%" "Current is $(ybacklight -d intel_backlight -get)"
fi
