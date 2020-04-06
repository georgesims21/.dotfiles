#!/usr/bin/env bash
#

hdd="/dev/sda1"
#test="/dev/nvme0n1p4/"
test="hello"
mountpt="/mnt/hdd/Video"
torrents="$HOME/torrents/finished/"

stat=$(stat $torrents >/dev/null 2>&1)
#status=$?

if [[ $? -eq 0 ]]; then
  echo "stat is true"
else
   echo "stat is false"
fi

#if [ $stat != 0 ] && [ -d "$torrents" ]; then
  # It's a directory!
  #echo "Both dirs"
#else
  #echo "Not both dirs"
#fi
