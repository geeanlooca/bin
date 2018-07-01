#!/bin/bash

if [[ -z $(pgrep -xU $UID ncmpcpp) ]]; then
    echo "Starting ncmpcpp"
    gnome-terminal --role=ncmpcpp -- ncmpcpp 
    i3-msg "[window_role=ncmpcpp] move scratchpad"
    i3-msg "[window_role=ncmpcpp] scratchpad show"
else
    RESULT=$(i3-msg "[window_role="ncmpcpp"] scratchpad show")
    echo $RESULT
    if [[ "$RESULT" = *"false"* ]]; then
        # send to scratchpad
        i3-msg "[window_role="ncmpcpp"] move scratchpad"
    fi
fi
