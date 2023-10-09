#!/bin/bash

THESIS="$HOME"/github/wiki/University/Bachelor_Project
TIME=$(date +"%D %T")

cd "$THESIS"
git add thesis/*
git commit -m "Daily commit: $TIME"
git push
