#!/bin/bash
# toggle for dim night setup with notifications

if cat /tmp/BRIGHTNESS 2> /dev/null; then
    sct 0
    ybacklight -d intel_backlight -set "$(cat /tmp/BRIGHTNESS)"
    notify-send.sh -r 5 "Nightmode" "OFF" -t 5
    rm /tmp/BRIGHTNESS
else
    ybacklight -d intel_backlight -get > /tmp/BRIGHTNESS
    sct 2200
    ybacklight -d intel_backlight -set 0.7
    notify-send.sh -r 5 "Nightmode" "ON" -t 5
fi
