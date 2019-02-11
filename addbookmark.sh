#!/bin/bash

bookmark_file=~/bin/urls

URL=$(xsel -o)

NAME=$(rofi -dmenu -lines 1 -p "Bookmark")

if [[ -z $NAME ]]; then
    exit;
fi

echo $NAME

TAGS=$(rofi -dmenu -lines 1 -p "Tags (separate with space)")
if [[ -z $TAGS ]]; then
    exit;
fi

tags2=$(cat $bookmark_file | cut -f3 -d"|")

printf "%s | %s | %s\n" "$NAME" "$URL" "$TAGS" >> $bookmark_file

