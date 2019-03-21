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
echo  "session started: $(date)" > ~/.dwm.log
while true; do
    dwm &>> ~/.dwm.log
    printf  "\nrestart: $(date)\n" >> ~/.dwm.log
done

