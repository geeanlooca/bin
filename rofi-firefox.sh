#!/bin/bash

bmarkfile=$HOME/.config/surfraw/bookmarks
bmarks=$(sed 's/^/+/' $bmarkfile)
searchengines=$(sr -elvi | tail -n+2 | sed 's/^/?/' | sed 's/\t.*/ /')

elvi=$(echo -e "$bmarks\n${searchengines}" | rofi -dmenu -i -multi-select -mesg "${HELP_MSG}" -p "Search > ")

lastchar="${elvi: -1}"
firstchar="${elvi:0:1}"
opt=""

echo "$elvi"

if [[ $lastchar == "+" ]] ; then 
    opt="--private-window"
    elvi=${elvi: : -1}
fi

if [[ -z $elvi ]] ; then
    exit
fi

if [[ $firstchar == "?" ]] ; then 
    # search engines
    se=$(echo $elvi | cut -f1 -d" ")
    term=$(echo $elvi | cut -f2- -d" ")
    engine="${se:1}"
    echo $engine
    echo $term
    
    sr $engine $term

    # ntry=$(grep "$(echo "${elvi}" | awk '{ print $1 }')" "$HOME/.config/rofi-surfraw/searchengines")
    # method=$(echo "${entry}" | awk -F ' - ' '{ print $2 }')
    # bang=$(echo "${entry}" | awk -F ' - ' '{ print $3 }')


else 
    # compare search term with content of bookmars file
    name=$(echo $elvi | cut -f1 -d" ")
    string=$(echo $elvi | cut -f2 -d" ")

    if grep -Fxq "${elvi:1}" "$bmarkfile" 
    then
        echo 'known bookmark'
        bm="${name:1}"
        sr $bm
    else
        echo 'unknown'
        string=$elvi
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

        firefox $opt "$url"
    fi
fi

