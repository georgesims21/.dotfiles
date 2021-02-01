#!/bin/bash

DOTS="$HOME"/github/.dotfiles
TIME=$(date +"%D %T")
LOG="$HOME"/log.txt

cd "$DOTS"
echo $(git pull) >> "$LOG"
echo $(git add *) >> "$LOG"
echo $(git commit -m "Daily commit: $TIME") >> "$LOG"
echo $(git push) >> "$LOG"
