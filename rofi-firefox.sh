#!/bin/bash

bmarks=$(cat ~/bin/urls)
custom=$(awk -F ' - ' '{ print $1 }' $HOME/.config/rofi-surfraw/searchengines)
# elvi=$(echo -e "$bmarks\n${custom}" | rofi -kb-row-tab "" -kb-row-select "Tab" -dmenu -mesg "${HELP_MSG}" -p "Search > ")
elvi=$(echo -e "$bmarks\n${custom}" | rofi -dmenu -i -multi-select -mesg "${HELP_MSG}" -p "Search > ")

lastchar="${elvi: -1}"
opt=""

echo "$elvi"

if [[ $lastchar == "+" ]] ; then 
    opt="--private-window"
    elvi=${elvi: : -1}
fi

if [[ -z $elvi ]] ; then
    exit
fi

if [[ ${elvi:0:1} == "!" ]] ; then 

    entry=$(grep "$(echo "${elvi}" | awk '{ print $1 }')" "$HOME/.config/rofi-surfraw/searchengines")
    method=$(echo "${entry}" | awk -F ' - ' '{ print $2 }')
    bang=$(echo "${entry}" | awk -F ' - ' '{ print $3 }')
    search=$(echo "${elvi}" | awk '{$1=""; print $0}' | cut -c 2-)

    url="${bang//%searchterm/$search}"

else 
    name=$(echo $elvi | cut -f1 -d"|")
    urlandtags=$(echo $elvi | cut -f2 -d"|")
    string=$(echo $urlandtags | cut -f1 -d"|")

    case $string in
        "")
            exit 1
            ;;
        "/r/"*)
            url="old.reddit.com${string}"
            ;;
        "/"*"/")
            url="4chan.org${string}"
            ;;
        *"."*)
            url=$string
            ;;
        *)
            url="google.com/search?q=${string}"
            ;;
    esac
fi

firefox $opt "$url"
