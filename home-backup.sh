#!/bin/bash

location=/media/green/backups/home/

echo "Backing up home directory in $location"

sudo rsync -a --info=progress2 --exclude=".local/share/Steam" --exclude=".local/share/Trash" --exclude=".cache" /home/gianluca/ $location
