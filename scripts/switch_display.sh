#!/bin/bash
intern=eDP1
extern=DP1
background=$HOME/Pictures/wallpapers/mountain-wallpaper.jpg

if xrandr | grep "current 3840"; then
    xrandr --output "$extern" --off --output "$intern" --auto
else
    xrandr --output "$intern" --off --output "$extern" --auto
fi
nitrogen --set-scaled "$background"
