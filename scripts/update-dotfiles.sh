#!/bin/bash

LOG=/home/george/log.txt
echo "Starting script" >> "$LOG"

DOTS="$HOME"/github/.dotfiles
TIME=$(date +"%D %T")

cd "$DOTS"
git add *
echo "Added everything" >> "$LOG"
git commit -m "Daily commit: $TIME"
echo "Committed everything" >> "$LOG"
git push
echo "Pushed everything" >> "$LOG"
