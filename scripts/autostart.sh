#!/bin/bash
# this gets executed at system start

/home/cat/scripts/go2ram.sh
xrdb -merge ~/.Xresources
urxvtd&
fcitx&
sstat -d
snotif -d
wmname LG3D
/home/cat/.fehbg
xbanish -bt5000
wacom_init.sh&
xmodmap /home/cat/.xmodmap
