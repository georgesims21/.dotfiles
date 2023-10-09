#!/bin/bash
intern=eDP-1
extern=DP-1
lidstate=false

# Check if the lid is open, if yes lidstate is set to true
if [[ $(cat /proc/acpi/button/lid/LID0/state | awk '{print ($2)}') == "open" ]]; then
    lidstate=true
fi

# If lid is open, put to right of external, closed turn it off
if [ "$lidstate" ]; then
    xrandr --output "$extern" --auto --output "$intern" --auto --left-of "$extern"
else
    xrandr --output "$intern" --off --output "$extern" --auto
fi
