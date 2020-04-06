#!/bin/bash
# Program which mounts a user defined drive to a user defined mount point. Mount using ntfs-3g which allows for R/W operations on ntfs formatted drives.

read -p 'Path to disk: ' rootpt
echo "$rootpt"

if [ "$rootpt" ]; then
  # It's a directory!
  if [ -L "$rootpt" ]; then
    # It is a symlink!
    echo "It's a symlink!"
    exit
  else
    read -p 'Mount point (will create if it non-existent): ' mountpt
    if [ ! -d "$mountpt" ]; then
        # Create dir if doesn't exist already
        mkdir "$mountpt"
        echo "$mountpt created"
    fi
    # Mount for R/W on ntfs
    sudo mount -t ntfs-3g "$rootpt" "$mountpt"
    echo "Mounted $rootpt at $mountpt"
  fi
fi
