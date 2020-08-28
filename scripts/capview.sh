#!/bin/bash
# small wrapper to have video+audio from capturecard

LOADEDMOD=$(pactl load-module module-loopback source=alsa_input.usb-MACROSILICON_USB_Video-02.analog-stereo)
ffplay -f video4linux2 -video_size hd720 -input_format mjpeg /dev/video0
pactl unload-module $LOADEDMOD
