#!/bin/bash

selected="$(cat ~/bin/emojilist | rofi -dmenu -i | cut -f1 -d"|")"
echo -n "$selected" | xclip -selection c
xdotool key ctrl+v
