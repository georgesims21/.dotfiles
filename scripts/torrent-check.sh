#!/usr/bin/env bash
# find . -name "foo*"
#
# TODO:
# * Loop through all torrents in $torrents
# * Individually check if it exists in the $mountpt using the find command
# * If yes - remove (if seeded)
# * If no - copy across then remove
# * (if seeded) Is there any way to check if a torrent is complete? - .txt file containing completed ones - transmission writes to this 'on completion', check this file before deleting?

mountpt="/mnt/hdd/Video"
torrents="$HOME/torrents/finished"
stat=$(stat $mountpt >/dev/null 2>&1)

if [[ $? -eq 0 ]]; then
  stat=$(stat $torrents >/dev/null 2>&1)
  if [[ $? -eq 0 ]]; then
    for filename in $torrents/*; do
      tmp="${filename##*/}"
      if [[ $(find $mountpt $tmp) ]]; then
        echo "yes"
      else
        echo "no"
      fi
    done
  fi
else
   echo "stat is false"
fi
