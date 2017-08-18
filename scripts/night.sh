#!/bin/sh
# toggle for dim night setup with notifications

if cat /tmp/BRIGHTNESS 2> /dev/null; then
    redshift -x
    xbacklight -set "$(cat /tmp/BRIGHTNESS)"
    notify-send.sh -r 5 "Nightmode" "OFF" -t 5
    rm /tmp/BRIGHTNESS
else
    xbacklight -get > /tmp/BRIGHTNESS
    redshift -O 2200
    xbacklight -set 1
    notify-send.sh -r 5 "Nightmode" "ON" -t 5
fi
