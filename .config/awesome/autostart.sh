#!/bin/bash

# Random background.
#feh --bg-scale "$(find ~/Bilder/wallpapers.1920 -name '*.jpg' -o -name '*.png' | shuf -n 1)"
/home/linduxed/bin/dual_bg_random_switch.sh

# Console applications
#gnome-terminal --role=ncmpcpp -x ncmpcpp &
#gnome-terminal --role=htop -x htop &
#gnome-terminal

# gnome-power-manager &
gnome-do &
