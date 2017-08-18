#!/bin/sh
# recompile and restart dwm

cd ~/dwm
if make clean install; then
    killall dwm
else
    notify-send -u critical "error recompiling dwm" "check the logs"
fi
