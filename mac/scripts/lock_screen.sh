#!/bin/bash
# https://www.reddit.com/r/i3wm/comments/5w95fp/how_to_get_lockscreen_like_this/

tmpbg='/tmp/screen.png'

scrot "$tmpbg"
convert "$tmpbg" -scale 10% -scale 1000% "$tmpbg"
i3lock -u -i "$tmpbg"
