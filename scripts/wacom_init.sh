#!/bin/bash
FING_ID=10
PEN_ID=9
ERASE_ID=18
PAD_ID=11

xinput disable $FING_ID
xinput disable $PAD_ID
xinput map-to-output $PEN_ID DVI-D-0
xinput map-to-output $ERASE_ID DVI-D-0
xsetwacom set $PEN_ID area 0 0 14720 8280
xsetwacom set $ERASE_ID area 0 0 14720 8280
