#!/bin/bash
#
# pa-ctl
#
# originally pulseaudio-ctl,
# minimized to near nothing by Ckath

# config
STEP=5

command -v pactl >/dev/null 2>&1 || {
	echo "pactl not installed, aborting" >&2
	exit 1;
}

case "$1" in
	U|u|[U,u]p)
		pactl set-sink-volume @DEFAULT_SINK@ +$STEP%
		notifyck -t "vol up $STEP%" "$(pactl get-sink-volume @DEFAULT_SINK@)"
		;;
	D|d|[D,d]own|[D,d]o)
		pactl set-sink-volume @DEFAULT_SINK@ -$STEP%
		notifyck -t "vol down $STEP%" "$(pactl get-sink-volume @DEFAULT_SINK@)"
		;;
	M|m|[M,m]u|[M,m]ute)
		pactl set-sink-mute @DEFAULT_SINK@ toggle
		notifyck -t "sink mute toggled" "$(pactl get-sink-mute @DEFAULT_SINK@)"
		;;
	[M,m]i|[M,m]ute-[I,i]nput)
		pactl set-source-mute @DEFAULT_SOURCE@ toggle
		notifyck -t "source mute toggled" "$(pactl get-source-mute @DEFAULT_SOURCE@)"
		;;
esac

		exit 0
