#!/bin/bash

if [[ -z $(pgrep -xU $UID ncmpcpp) ]]; then
    xfce4-terminal -e ncmpcpp --role=ncmpcpp
    # i3-msg "[window_role=ncmpcpp] floating enable"
else
    RESULT=$(i3-msg "[window_role=ncmpcpp] scratchpad show")
    if [[ "$RESULT" = *"false"* ]]; then
        # send to scratchpad
        i3-msg "[window_role=ncmpcpp] move scratchpad"
    fi
fi
