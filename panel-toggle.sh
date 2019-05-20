#!/bin/bash

if [ -z $(pgrep -x xfce4-panel) ]; then
    pkill i3blocks
    pkill i3bar
    xfce4-panel &

    i3-msg '[tiling] floating enable, border normal'

else
    pkill xfce4-panel
    i3-msg '[floating] floating disable, border none'
    i3-msg restart

fi
