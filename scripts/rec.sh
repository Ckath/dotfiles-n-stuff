#!/bin/bash
# minimal region recording script with ffmpeg and slop

# stop recording and convert to webm on second run
pgrep ffmpeg && pkill -9 ffmpeg && ffmpeg -y -i /tmp/rec.mkv /tmp/rec.webm

# record selected region of screen
rect=$(slop -f "%x %y %w %h %g %i") || exit 1
read -r X Y W H G ID < <(echo $rect)
# with audio
# ffmpeg -y -f x11grab -s "$W"x"$H" -i :0.0+$X,$Y -f alsa -i pulse /tmp/rec.mkv
ffmpeg -y -f x11grab -s "$W"x"$H" -i :0.0+$X,$Y /tmp/rec.mkv
