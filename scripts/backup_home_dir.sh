#!/usr/bin/env sh

# Daily backup script

# input from anacrontab to avoid leaking info. See https://ask.fedoraproject.org/t/address-to-google-drive-via-terminal/24624/3 on how to get this info.
gdrive="$1"
home_dir="/home/george"
backup_dir="$home_dir/Backups"
log_file='/var/log/backup-script.log'
file="home-george-$(date +%F).tar.gz"

# manage signals & output of all script https://serverfault.com/a/103569.
exec 3>&1 4>&2
trap 'exec 2>&4 1>&3' 0 1 2 3
exec 1>"$log_file" 2>&1

echo "----- BACKUP STARTED: $(date) -----"

if [[ -e "$backup_dir/$file" ]]; then
    echo "$file already exists! Exiting..."
    exit 1
if ! [[ -e "$backup_dir/$file" ]]; then
    tar --exclude="$home_dir/Backups" \
        --exclude="$home_dir/Downloads" \
        --exclude="$home_dir/.cache" \
        --exclude="$home_dir/.mozilla" \
        -cvpzf "$backup_dir/$file" "$home_dir"
else
    echo "$file already exists! Skipping archive creation..."
fi

if [[ $? -ne 0 ]]; then
    echo 'tar did not exit successfully, not copying file to gdrive! Exiting...'
    exit 1
fi

# must use gio to interact with gdrive fs
if [[ $(gio info "$gdrive/$file" > /dev/null 2>&1) -eq 0 ]]; then
    echo "$gdrive/$file already exists in gdrive! Exiting..."
    exit 1
fi

# can only copy to grive (via cli) with user george, not root
su -c "gio copy --progress --preserve $backup_dir/$file $gdrive" -m george

echo "----- BACKUP COMPLETE: $(date) -----"
