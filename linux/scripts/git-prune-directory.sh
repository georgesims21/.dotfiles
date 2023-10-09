#!/usr/bin/env bash

function prune_dir() {
        cd $1
        if [[ -d '.git' ]]; then
           git fetch --prune
        fi
}

for dir in */; do
    (
        prune_dir $dir
    )
done
