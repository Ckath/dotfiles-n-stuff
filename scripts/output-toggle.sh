#!/bin/sh
# toggle for hdmi/internal audio with notifications

if cat /tmp/HDMI_TOGGLE 2> /dev/null; then
    pacmd set-card-profile 0 output:hdmi-stereo
    notify-send.sh -r 5 "Output toggle" "HDMI" -t 5
    rm /tmp/HDMI_TOGGLE
else
    pacmd set-card-profile 0 output:analog-surround-40
    notify-send.sh -r 5 "Output toggle" "INTERMAL" -t 5
    touch /tmp/HDMI_TOGGLE
fi
