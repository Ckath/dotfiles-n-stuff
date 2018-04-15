#!/bin/bash
# config for i3lock
# with pixelated/distored background screenshot

scrot /tmp/screen.jpg
jpegoptim --size=1% /tmp/screen.jpg
convert +noise Impulse -scale 20% -scale 501% /tmp/screen.jpg /tmp/screen.jpg
convert /tmp/screen.jpg /tmp/screen.png

i3lock -e -f -i /tmp/screen.png
