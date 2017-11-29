#!/bin/bash
# toggle for hdmi/internal audio with notifications

if cat /tmp/PULSE_OLD_PROFILE 2> /dev/null; then
    pacmd set-card-profile 0 output:"$(cat /tmp/PULSE_OLD_PROFILE)"
    notify-send.sh -r 5 "Output toggle" "DEFAULT" -t 5
    rm /tmp/PULSE_OLD_PROFILE
else
    pactl list sinks | grep Name | cut -c37- > /tmp/PULSE_OLD_PROFILE
    pacmd set-card-profile 0 output:hdmi-stereo
    notify-send.sh -r 5 "Output toggle" "HDMI" -t 5
fi
