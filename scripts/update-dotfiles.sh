#!/bin/bash

DOTS="$HOME"/.dotfiles
TIME=$(date +"%D %T")
LOG=/var/log/scripts/update_dotfiles.log

cd "$DOTS"
echo "$TIME\n" >> "$LOG"
echo "$(git add -A)\n" >> "$LOG"
echo "$(git commit -m "Daily commit: $TIME")\n" >> "$LOG"
echo "$(git push)\n" >> "$LOG"
