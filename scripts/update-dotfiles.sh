#!/bin/bash

DOTS="$HOME"/.dotfiles
TIME=$(date +"%D %T")
LOG=/var/log/scripts/update_dotfiles.log

cd "$DOTS"
echo $(git add -A) >> "$LOG"
echo $(git commit -m "Daily commit: $TIME") >> "$LOG"
echo $(git push) >> "$LOG"
