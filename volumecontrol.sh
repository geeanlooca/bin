#!/bin/bash

notif_id=8888

if [[ -z $1 ]]; then
    exit;
fi

echo "$CURRENT_STATE"

case $1 in
    "toggle" )
        CURRENT_STATE=$(amixer get Master | egrep 'Playback.*?\[o' | egrep -o '\[o.+\]' | head -n 1)

        if [[ $CURRENT_STATE = "[on]" ]]; then
            MSG="Volume: muted"
        else
            MSG="Volume: unmuted"
        fi
        amixer -q set Master toggle
        ;;

    "increase")
        amixer -q set Master 5%+ unmute
        vol_level=$(amixer sget Master | grep 'Left:' | awk -F'[][]' '{ print $2 }')
        MSG="Volume: $vol_level"
        ;;

    "decrease")
        amixer -q set Master 5%- unmute
        vol_level=$(amixer sget Master | grep 'Left:' | awk -F'[][]' '{ print $2 }')
        MSG="Volume: $vol_level"
        ;;
esac

dunstify -r $notif_id $MSG

# send signal to i3blocks to update volume widget
pkill -RTMIN+11 i3blocks
