#!/usr/bin/env bash

# Terminate already running bar instances
killall -q polybar
# If all your bars have ipc enabled, you can also use 
# polybar-msg cmd quit

# Launch bar1 and bar2
echo "---" | tee -a /tmp/top_bar.log 
polybar top_bar >>/tmp/top_bar.log 2>&1 &

echo "Bar launched..."
