#!/bin/bash
# posting to my blog from the comfort of my terminal
# https://xn--z7x.xn--6frz82g/blog/

if [[ -z "$1" ]]; then
	echo "usage: blog.sh post.txt [media.ext]"
fi

if [[ -z "$2" ]]; then # text only post
	curl -F post="@$1" -F key="$(cat /home/cat/supersekretkey)" https://xn--z7x.xn--6frz82g/blog/api.php
	exit
fi

# regular post with media
curl -F post="@$1" -F media="@$2" -F key="$(cat /home/cat/supersekretkey)" https://xn--z7x.xn--6frz82g/blog/api.php
