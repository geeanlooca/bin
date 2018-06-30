#!/bin/bash

urls="gazzetta.it\n/g/\n/r/soccer\nGit"
string=$(echo -e $urls | rofi -dmenu -lines 4 -p "firefox> ")

# string='http://www.google.com/test/link.php'
case $string in
    "")
        exit 1
        ;;
    "Git")
        URL="github.com/geeanlooca"
        ;;
    "gazzetta.it") 
        URL="www.gazzetta.it"
        ;;
    "/g/")
        URL="4chan.org/g/"
        ;;
    "/r/soccer")
        URL="old.reddit.com/r/soccer/new"
        ;;
    "/r/"*)
        URL="old.reddit.com${string}"
        ;;
    "/"*"/")
        URL="4chan.org${string}"
        ;;
    *"."*)
        URL=$string
        ;;
    *)
        URL="google.com/search?q=${string}"
        ;;
esac

        
firefox $URL
i3-msg "[class=Firefox] focus"
