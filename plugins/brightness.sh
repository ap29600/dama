#!/bin/sh

MAX_BRIGHTNESS=100
CURRENT_BRIGHTNESS=`xbacklight -get`

yad --scale \
    --plug=$1 \
    --tabnum=$2 \
    --text="Brightness control" \
    --step=5 \
    --max-value=$MAX_BRIGHTNESS \
    --value=$CURRENT_BRIGHTNESS \
    --print-partial | \
        while IFS= read -r brightness # interactively change the brightness
        do  
            # TODO: it might be useful to lock the backlight 
            # device to reduce flickering, xbacklight doesn't do this itself.
            xbacklight -set $brightness -time 0 -steps 0
        done &> /dev/null #discard the output of this tab
