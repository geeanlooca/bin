#!/bin/bash

selected=$(locate home media | grep -v "$HOME/.cache" | grep -v "$HOME/.local/share/" | rofi -dmenu -i -p "Search for files" -fullscreen -filter "$1")


if [[ -z $selected ]]; then
    exit
fi
lastchar="${selected: -1}"

if [[ $lastchar == "+" ]] ; then 

    selected=${selected: : -1}

    # if [[ -d $selected ]]; then
    #     selected="$(dirname "$selected")"
    # fi
    # show in file manager

    nautilus "$selected"

elif [[ $lastchar == "<" ]]; then
    selected=${selected: : -1}
    if [[ -d $selected ]]; then
        parent=$selected
    else
        parent="$(dirname "$selected")"
        echo $parent
    fi
    thunar "$parent"
elif [[ $lastchar == ">" ]]; then
    # copy path to clipboard
    selected=${selected: : -1}
    echo $selected | xsel -i
elif [[ $lastchar == "@" ]]; then
    # copy to clipboard
    xsel -b < "$selected"
else
    xdg-open "$selected"
fi
