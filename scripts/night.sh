#!/bin/bash
# toggle for dim night setup with notifications

if cat /tmp/BRIGHTNESS 2> /dev/null; then
    sct 0
    ybacklight -d intel_backlight -set "$(cat /tmp/BRIGHTNESS)"
    notifyck -t "Nightmode" "OFF"
    rm /tmp/BRIGHTNESS
else
    ybacklight -d intel_backlight -get > /tmp/BRIGHTNESS
    sct 2000
    ybacklight -d intel_backlight -set 0.1
    notifyck -t "Nightmode" "ON"
fi
