#!/bin/sh
# move temp folders to ram

rm -rf /home/cat/.thumbnails /home/cat/.cache
mkdir /dev/shm/.cache
ln -s /dev/shm/.cache /home/cat/.cache
mkdir /dev/shm/.thumbnails
ln -s /dev/shm/.thumbnails /home/cat/.thumbnails 
