#!/bin/bash

if [[ -z $(pgrep -xU $UID ncmpcpp) ]]; then
    xfce4-terminal -e ncmpcpp --role=ncmpcpp
    i3-msg "[window_role=ncmpcpp] floating enable"
else
    i3-msg "[window_role=ncmpcpp] scratchpad show"
fi
