#!/bin/bash
# update mirrors from latest sources and pick the best ones

echo "downloading mirrors..."
curl -s "https://archlinux.org/mirrorlist/?country=NL&country=DE&protocol=https&ip_version=4&use_mirror_status=on" | sed 's/#S/S/g' >> /tmp/mirrors
echo "ranking mirrors..."
rankmirrors -n 22 /tmp/mirrors | sed '/##.*/d' | sudo tee /etc/pacman.d/mirrorlist > /dev/null
echo "done"
rm /tmp/mirrors
