#!/bin/sh

device=/sys/devices/platform/i8042/serio1/serio2
sensitivity=$1
speed=$2

echo $sensitivity | sudo tee $device/sensitivity
echo $speed | sudo tee $device/speed
