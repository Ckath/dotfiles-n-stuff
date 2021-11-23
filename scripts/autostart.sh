#!/bin/bash
# this gets executed at system start

/home/cat/scripts/go2ram.sh
xrdb -merge ~/.Xresources
urxvtd&
fcitx&
sstat -d
snotif -d
/home/cat/.fehbg
xbanish -t5&
wacom_init.sh&
