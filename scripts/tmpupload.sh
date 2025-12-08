#!/bin/bash
# basic upload script for /tmp/ host

if [[ -z "$1" ]]; then
	echo "usage: tmpupload.sh file(s)"
	exit 1
fi

# prepare command with all files
for f in "$@"; do # create flags
	CMD="$CMD -F 'files[]=@$f'"
done
CMD="curl $CMD https://xn--z7x.xn--6frz82g/tmp/api.php | xclip -selection clipboard"

# upload and copy result to clipboard
eval "$CMD"

# notify about this happening (optional)
xclip -o -selection clipboard | xargs -0 notify-send -i dialog-information
