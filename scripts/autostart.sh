#!/bin/sh
# this gets executed at system start

/home/cat/scripts/go2ram.sh
xrdb -merge ~/.Xresources
urxvtd&
slstatus -d
snotif -d
synclient TapButton1=1 HorizTwoFingerScroll=1 PalmDetect=1
compton -b
wmname LG3D
xmodmap /home/cat/.xmodmap
~/.fehbg
