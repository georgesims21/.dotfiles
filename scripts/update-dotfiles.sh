#!/bin/bash

DOTS="$HOME"/github/.dotfiles
TIME=$(date +"%D %T")

cd "$DOTS"
git add *
git commit -m "Daily commit: $TIME"
