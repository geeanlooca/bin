#!/bin/bash

SPOTIFY=$(pgrep -xU $UID spotify)
if [[ -z $SPOTIFY ]]; then
    echo "Spotify not running"
    case $1 in
        "toggle")
            mpc toggle
            ;;

        "pause")
            mpc pause
            ;;

        "next")
            mpc next
            ;;

        "prev")
            mpc prev
            ;;
    esac
else
    echo "Spotify running"
    case $1 in
        "toggle")
            playerctl play-pause
            ;;

        "pause")
            playerctl pause
            ;;

        "next")
            playerctl next
            ;;

        "prev")
            playerctl previous
            ;;

        "fwd")
            playerctl position 10-
    esac
fi


