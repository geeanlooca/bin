#!/bin/sh

sleep 1

# Some environment variables that need to be set in order to run `setxkbmap`
DISPLAY=":0.0"
HOME=/home/gianluca
XAUTHORITY=$HOME/.Xauthority
export DISPLAY XAUTHORITY HOME

udev_action=$1
model_id=$2
vendor_id=$3
log_file="$HOME/.switch-kb-layout.log"
kb_file="$HOME/.config/keyboard-layouts"

echo $udev_action >> $log_file
source $HOME/bin/kb-layout-startup

exit 1

if [ "${udev_action}" != "add" ] && [ "${udev_action}" != "remove" ]; then
    echo "Other action $udev_action. Aborting." >> $log_file
    exit 1
fi

kb_id="$vendor_id:$model_id"
internal_kb_layout="it"
external_kb_layout="us"

kb_layout=""
kb_variant=""

if [ "${udev_action}" = "add" ]; then
    kb_layout=$external_kb_layout
    kb_variant=$external_kb_variant
    line=$(grep $kb_id $kb_file)

    echo "add action" >> $log_file
    if [ -z "$line" ]; then
        echo "keyboard not configured" >> $log_file
        kb_layout=$internal_kb_layout
    else
        echo "found configuration for keyboard: $line" >> $log_file 
        kb_layout=$(echo $line | cut -d" " -f2)
    fi

elif [ "${udev_action}" = "remove" ]; then
    echo "remove action" >> $log_file
    kb_layout=$internal_kb_layout
    kb_variant=$internal_kb_variant
fi

# setxkbmap -layout "${kb_layout}"
echo "set layout:" "$kb_layout" >> $log_file
source $HOME/bin/kb-layout "$kb_layout"

# if [ ! -z "${kb_variant}" ]; then
#     setxkbmap -variant "${kb_variant}"
#     echo "set variant:" "$kb_variant" >> $log_file
# fi

# if [ ! -z "$1" ]; then
#     setxkbmap "$1"
#     source $HOME/bin/caps_ctrlescape
# fi
