#!/bin/sh
# screen blanking toggle with notifications

if [ "$1" = "-off" ]; then
    xset s off -dpms
    notify-send.sh -r 55 "Screen blanking disabled"
elif [ "$1" = "-on" ]; then
    xset s on -dpms
    notify-send.sh -r 55 "Screen blanking enabled"
fi
