#!/bin/bash
PEN_ID=$(xinput list --id-only 'Wacom Bamboo Pen cursor')
ERASE_ID=$(xinput list --id-only 'Wacom Bamboo Pen eraser')
STYLUS_ID=$(xinput list --id-only 'Wacom Bamboo Pen stylus')
xinput disable 'Wacom Bamboo Pad pad'

for PEN in $PEN_ID $ERASE_ID $STYLUS_ID
do
	xinput map-to-output $PEN DVI-D-0
	xsetwacom set $PEN area 0 0 14720 8302
done
