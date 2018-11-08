#!/bin/sh

if [ -d /etc/X11/xinit/xinitrc.d ]; then
  for f in /etc/X11/xinit/xinitrc.d/*; do
    [ -x "$f" ] && . "$f"
  done
  unset f
fi

# autostart applications
~/scripts/autostart.sh&

# wm loop
printf  "session started: %s\n" "$(date)" > ~/.dwm.log
while true; do
    dwm &>> ~/.dwm.log
    printf  "\nrestart: %s\n" "$(date)" >> ~/.dwm.log
done

