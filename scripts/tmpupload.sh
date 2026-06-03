#!/bin/bash
# basic upload script for /tmp/ host

if [[ -z "$1" ]]; then
	echo "usage: tmpupload.sh file(s)"
	exit 1
fi

# prepare command with all files
for f in "$@"; do CMD="$CMD -F 'files[]=@$f'"; done
CMD="curl $CMD https://xn--z7x.xn--6frz82g/tmp/api.php | xclip -selection clipboard"

# upload and copy result to clipboard
eval "$CMD"

# notify about this happening (optional)
command -v notifyck > /dev/null 2>&1 && \
xclip -o -selection clipboard | notifyck -t "copied to clipboard"
