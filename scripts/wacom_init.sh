#!/bin/bash
FING_ID=9
PEN_ID=8
ERASE_ID=15

xinput disable $FING_ID
xinput map-to-output $PEN_ID DVI-D-0
xinput map-to-output $ERASE_ID DVI-D-0
xsetwacom set $PEN_ID area 0 0 14720 8280
xsetwacom set $ERASE_ID area 0 0 14720 8280
