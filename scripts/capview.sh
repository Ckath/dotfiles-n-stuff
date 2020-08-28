#!/bin/bash
# small wrapper to have video+audio from capturecard
LOADEDMOD=$(pactl load-module module-loopback source=alsa_input.usb-MACROSILICON_USB_Video-02.analog-stereo)
mpv \
		--profile=low-latency \
		--untimed \
		--demuxer-lavf-format=video4linux2 \
		--demuxer-lavf-o-set=video_size=hd720 \
		--demuxer-lavf-o-set=pixel_format=mjpeg \
		/dev/video0
pactl unload-module $LOADEDMOD
