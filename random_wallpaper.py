#!/usr/bin/python3

from os import listdir, symlink, unlink
from os.path import isfile, join, islink
from subprocess import call
from random import choice
from shlex import quote

wp_dir ="/media/green/Images/wallpapers"
wp_img ="/home/gianluca/Pictures/wallpaper"

img_files = [f for f in listdir(wp_dir) if isfile(join(wp_dir, f))]

selected_file = join(wp_dir, choice(img_files))
escaped_file = quote(selected_file)
if islink(wp_img):
    unlink(wp_img)
symlink(escaped_file, wp_img)

print(escaped_file)
call("feh --bg-scale %s" % escaped_file, shell=True)
