#!/bin/bash

STAT="$(playerctl status)"

if [ "$STAT" = "Playing" ]; then
   ARTIST=$(playerctl metadata artist)
   SONG=$(playerctl metadata title)

   echo "$ARTIST - $SONG"
else
    if [ "$STAT" = "Paused" ]; then
        echo "Player paused"
    else
        echo "Player not running"
    fi
fi
