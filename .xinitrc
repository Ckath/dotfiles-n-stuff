#!/bin/sh

if [ -d /etc/X11/xinit/xinitrc.d ]; then
  for f in /etc/X11/xinit/xinitrc.d/*; do
    [ -x "$f" ] && . "$f"
  done
  unset f
fi

# autostart applications
~/scripts/autostart.sh&

# exec i3
# wm loop
printf  "session started: %s\n" "$(date)" > ~/.dwm.log
while true; do
    dwm 2>> ~/.dwm.log
    printf  "\nrestart: %s\n" "$(date)" >> ~/.dwm.log
done

