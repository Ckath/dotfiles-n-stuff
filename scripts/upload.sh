#!/bin/bash
# basic upload script, copy to clipboard or upload

if [[ "$1" = "-c" ]]; then
    (maim -s -u || (notify-send "upload canceled" -t 10 ; pkill "$(basename "$0")"))\
        | xclip -selection clipboard -t image/png
    notify-send "image copied to clipboard" -t 10
    exit 0
fi
if [[ -z "$1" || "$1" = "-t" && -z "$2" ]]; then
    if maim -s -u /tmp/pic.png; then
        upload.sh $1 /tmp/pic.png
        exit 0
    else
        notify-send "upload canceled" -t 10
        exit 1
    fi
fi
if [[ "$1" = "-t" ]]; then
	tmpupload.sh "$2"
	exit 0
fi

curl --form thefile="@$1" --form key="$(cat /home/cat/supersekretkey)" https://ckat.space/api.php | xclip
xclip -o | xargs -0 notify-send -i dialog-information
