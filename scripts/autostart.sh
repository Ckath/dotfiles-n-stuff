#!/bin/bash
# this gets executed at system start

/home/cat/scripts/go2ram.sh
xrdb -merge ~/.Xresources
urxvtd&
sstat -d
snotif -d
synclient TapButton1=1 HorizTwoFingerScroll=1 PalmDetect=1
compton -b
wmname LG3D
xmodmap /home/cat/.xmodmap
~/.fehbg
xbanish -bt5000
