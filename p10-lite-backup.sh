#!/bin/bash

device="Huawei"
location="/media/green/backups/p10lite-backups"
mountdir=$(pwd)

echo $mountdir
cd $mountdir


for dir in */; do
    echo "Backing up $dir in $location"
    rsync -a --info=progress2 --exclude=".thumbnails" "$dir/DCIM" $location
    rsync -a --info=progress2 --exclude="Databases" --exclude=".Shared" "$dir/WhatsApp" $location
    rsync -a --info=progress2 "$dir/Telegram" $location
    rsync -a --info=progress2 "$dir/Download" $location
    rsync -a --info=progress2 "$dir/bluetooth" $location
    rsync -a --info=progress2 "$dir/Clover" $location
    rsync -a --info=progress2 "$dir/Pictures" $location
done

# echo "Looking for $device in the list of MTP-ready devices"
# id=`simple-mtpfs -l | grep -i $device | awk '{printf "%d\n",$1}'`

# if [ -z "$id" ]; then
#     echo "No device found. Aborting."
# else
#     echo "Device found with ID $id"
    
#     echo "Checking if it's already mounted in $mountdir"
#     if [ -n "mount | grep $mountdir" ]; then

#         # unmount
#         echo "Device already mounted: unmounting and re-mounting"
#         fusermount -u $mountdir
#     fi

#     echo "Mounting device in $mountdir"
#     simple-mtpfs --device $id $mountdir

#     for dir in $mountdir*; do
#         echo "Backing up $dir in $location"
#         rsync -a --info=progress2 --exclude=".thumbnails" "$dir/DCIM" $location
#         rsync -a --info=progress2 --exclude="Databases" --exclude=".Shared" "$dir/WhatsApp" $location
#         rsync -a --info=progress2 "$dir/Telegram" $location
#         rsync -a --info=progress2 "$dir/Download" $location
#         rsync -a --info=progress2 "$dir/bluetooth" $location
#         rsync -a --info=progress2 "$dir/Clover" $location
#         rsync -a --info=progress2 "$dir/Pictures" $location
#     done

#     # unmount the device    
#     fusermount -u $mountdir
# fi
