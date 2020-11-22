#!/bin/bash
# basic upload script for /tmp/ host

if [[ -z "$1" ]]; then
	echo "usage: tmpupload.sh file(s)"
	exit 1
fi

for f in "$@"; do # create flags
	FILE_FLAGS="$FILE_FLAGS-F files[]=@\"$f\" "
done
# upload and copy result to clipboard
curl $FILE_FLAGS https://xn--z7x.xn--6frz82g/tmp/api.php | xclip -selection clipboard

# notify about this happening (optional)
xclip -o -selection clipboard | xargs -0 notify-send -i dialog-information
