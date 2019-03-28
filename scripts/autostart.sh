#!/bin/bash
# this gets executed at system start

/home/cat/scripts/go2ram.sh
xrdb -merge ~/.Xresources
urxvtd&
sstat -d
snotif -d
compton -Cb --vsync-aggressive
wmname LG3D
xmodmap /home/cat/.xmodmap
/home/cat/.fehbg
xbanish -bt5000
uim-xim&
wacom_init.sh&
