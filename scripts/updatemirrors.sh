#!/bin/bash
# update mirrors from latest sources and pick the best ones

get_mirrors() {
	curl "https://archlinux.org/mirrorlist/?country=$1&protocol=https&ip_version=4&use_mirror_status=on" | sed 's/#S/S/g' >> /tmp/mirrors
}

get_mirrors "NL"
get_mirrors "DE"
echo "ranking mirrors..."
rankmirrors -n 8 /tmp/mirrors | sed '/##.*/d' | sudo tee /etc/pacman.d/mirrorlist
rm /tmp/mirrors
