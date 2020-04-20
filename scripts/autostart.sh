#!/bin/bash
# this gets executed at system start

/home/cat/scripts/go2ram.sh
fcitx&
xrdb -merge ~/.Xresources
urxvtd&
sstat -d
snotif -d
synclient TapButton1=1 HorizTwoFingerScroll=1 PalmDetect=1
compton -b
wmname LG3D
~/.fehbg
xbanish -bt5000
xmodmap /home/cat/.xmodmap
