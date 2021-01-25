#!/bin/bash
intern=eDP1
extern=DP1
lidstate=false

# Check if the lid is open, if yes lidstate is set to true
if [[ $(cat /proc/acpi/button/lid/LID0/state | awk '{print ($2)}') == "open" ]]; then
    lidstate=true
fi

# If lid is open, put to right of external, closed turn it off
if "$lidstate"; then
    xrandr --output "$extern" --auto --output "$intern" --auto --right-of "$extern"
else
    xrandr --output "$intern" --off --output "$extern" --auto
fi
