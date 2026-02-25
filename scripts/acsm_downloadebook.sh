#!/bin/bash
# script to download and strip drm from adobe ebook cursery

EBOOK=$(acsmdownloader "$1" | tail -n1 | sed 's/Created //')
echo "Downloaded '$EBOOK'"
adept_remove -v "$EBOOK"
