#!/bin/bash

# check if there is a window with role=dropdown 
RESULT=$(i3-msg -t get_tree | grep dropdown)

if [ -z "$RESULT" ]; then
    echo "No dropdown"
    gnome-terminal --role=dropdown
    i3-msg "[window_role=dropdown] move scratchpad"
    i3-msg "[window_role=dropdown] scratchpad show"
else
    echo "Dropdown"
    RESULT=$(i3-msg "[window_role="dropdown"] scratchpad show")
    echo $RESULT
    if [[ "$RESULT" = *"false"* ]]; then
        # send to scratchpad
        i3-msg "[window_role="dropdown"] move scratchpad"
    fi
fi
