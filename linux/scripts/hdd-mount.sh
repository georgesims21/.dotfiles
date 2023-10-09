#!/bin/bash

echo "Enter path to drive: "
read rootpt
echo "Enter mount path: "
read mountpt

stat=$(stat $mountpt >/dev/null 2>&1)
if [[ $? -eq 0 ]] && [[ ! -L "$rootpt" ]]; then
  # It's a directory!
  if [[ ! -d "$mountpt" ]]; then
      # Create dir if doesn't exist already
      echo "Creating mount point at: $mountpt"
      sudo mkdir "$mountpt"
      echo "$mountpt created"
  fi
  # Mount for R/W on ntfs
  sudo mount -t ntfs-3g "$rootpt" "$mountpt"
  echo "Mounted $rootpt at $mountpt"
fi
