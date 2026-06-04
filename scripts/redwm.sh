#!/bin/sh
# recompile and restart dwm

cd ~/dwm
if make clean install; then
    killall dwm
else
    noptifyck -u -t "error recompiling dwm" "check the logs"
fi
