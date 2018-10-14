#!/bin/bash
# config for i3lock
# with glitched screenshot as background
# for gltch see https://github.com/ckath/gltch

import -window root /tmp/screen.jpg 
gltch -s 6 -n 22 /tmp/screen.jpg
convert /tmp/screen.jpg /tmp/screen.png
i3lock -e -f -i /tmp/screen.png
