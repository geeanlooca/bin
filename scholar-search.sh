#!/bin/bash

# perform a google scholar search on the content of the clipboard

SEARCH=$(xclip -o)
xclip -o
echo $SEARCH
URL="https://scholar.google.it/scholar?q=${SEARCH}"
xdg-open "$URL"

