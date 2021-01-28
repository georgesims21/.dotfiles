#!/bin/bash

DOTS="$HOME"/github/.dotfiles
TIME=$(date +"%D %T")

git pull
cd "$DOTS"
git add *
git commit -m "Daily commit: $TIME"
git push
