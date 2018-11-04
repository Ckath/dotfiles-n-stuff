#!/bin/bash
# this gets executed at system start

/home/cat/scripts/go2ram.sh
xrdb -merge ~/.Xresources
urxvtd&
sstat -d
snotif -d
synclient TapButton1=1 HorizTwoFingerScroll=1 PalmDetect=1
compton -Cb --vsync-aggressive
wmname LG3D
xmodmap /home/cat/.xmodmap
~/.fehbg
xbanish -bt5000
xinput disable 9&
xinput map-to-output 18 DVI-D-0&
uim-xim&
