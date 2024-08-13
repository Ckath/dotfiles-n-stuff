#!/bin/bash
# shoddy gphoto2 script to grab 10 last camera pictures

# get last pic number
echo "getting number of pics"
LAST=$(gphoto2 -n -f /store_00010001/DCIM/524CANON | sed 's/.*: //')

# set dir for saving
mkdir -p /tmp/cam
cd /tmp/cam

# get pictures
echo "downloading from camera"
gphoto2 -p $((LAST-10))-$LAST --skip-existing
