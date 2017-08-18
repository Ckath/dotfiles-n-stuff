#!/bin/sh
# recompile and restart dwm

cd ~/dwm
if make clean install; then
    killall dwm
else
    notify-send -u critical "errror recompiling dwm" "check the logs"
fi
