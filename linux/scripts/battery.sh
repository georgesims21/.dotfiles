#!/bin/bash
# Get current battery status for status bar

perc=$(cat /sys/class/power_supply/BAT0/capacity)

echo "$perc%"
