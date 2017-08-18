#!/bin/sh
# config for i3lock colors, 
# with pixelated/distored background screenshot

scrot /tmp/screen.jpg
jpegoptim --size=1% /tmp/screen.jpg
convert +noise Impulse -scale 20% -scale 501% /tmp/screen.jpg /tmp/screen.jpg
convert /tmp/screen.jpg /tmp/screen.png

i3lock -i /tmp/screen.png \
--textcolor=000000ff \
--insidecolor=ffffff1c \
--ringcolor=ffffff3e \
--linecolor=ffffff00 \
--keyhlcolor=00000080 \
--ringvercolor=0000ffff \
--separatorcolor=22222260 \
--insidevercolor=ffffff1c \
--ringwrongcolor=ff0000ff \
--insidewrongcolor=ffffff1c
