#!/bin/bash

# perform a google scholar search on the content of the clipboard

SEARCH=$(xclip -o)
echo $SEARCH
URL="https://scholar.google.it/scholar?q=${SEARCH}"
echo $URL
firefox "$URL"

