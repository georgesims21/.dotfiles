#!/bin/bash

choices=(e i b)
intern=eDP-1
extern=DP-1
choice=$1

if [[ ! " ${choices[@]} " =~ " ${choice} " ]]; then
	echo "Please choose either e, i or b"
	exit
fi



case "$choice" in
"e")
    xrandr --output "$extern" --auto --output "$intern" --off
    ;;
"i")
    xrandr --output "$intern" --auto --output "$extern" --off
    ;;
"b")
    xrandr --output "$extern" --auto --output "$intern" --left-of "$extern"
    ;;
*)
    echo "An error occurred, exiting.."
    exit
    ;;
esac
