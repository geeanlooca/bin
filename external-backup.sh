#!/bin/bash

backup_location=/media/gianluca/ElementsGianluca/gianluca-backups
echo "Backing up personal documents in $backup_location"

echo "Backups..."
sudo rsync -a -v --info=progress2 --exclude=".cache" /media/green/backups $backup_location

echo "Docs..."
sudo rsync -a -v --info=progress2 --exclude=".cache" /media/green/Docs $backup_location

echo "Dropbox..."
sudo rsync -a -v --info=progress2 --exclude=".cache" /media/green/Dropbox $backup_location

echo "Drive..."
sudo rsync -a -v --info=progress2 --exclude=".cache" /media/green/Drive $backup_location

echo "Nextcloud..."
sudo rsync -a -v --info=progress2 --exclude=".cache" /media/green/nextcloud $backup_location

echo "Images..."
sudo rsync -a -v --info=progress2 --exclude=".cache" /media/green/Images $backup_location
