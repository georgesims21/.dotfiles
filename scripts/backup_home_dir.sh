#!/usr/bin/env sh

#TODO: Run anacron as regular user not root!

# Daily backup script

home_dir="/home/george"
backup_dir="$home_dir/Backups"
gdrive_backup_dir="$home_dir/GDrive/backups"
log_file='/var/log/backup-script.log'
file="home-george-$(date +%F).tar.gz"
mounted=0

# manage signals & output of all script https://serverfault.com/a/103569.
exec 3>&1 4>&2
trap 'exec 2>&4 1>&3' 0 1 2 3
exec 1>"$log_file" 2>&1

echo "----- BACKUP STARTED: $(date) -----"

if ! [[ -e "$backup_dir/$file" ]]; then
    tar --exclude="$home_dir/Backups" \
        --exclude="$home_dir/Downloads" \
        --exclude="$home_dir/.cache" \
        --exclude="$home_dir/.mozilla" \
        --exclude="$home_dir/GDrive" \
        -cvpzf "$backup_dir/$file" "$home_dir"

    if [[ $? -ne 0 ]]; then
        echo 'tar did not exit successfully! Exiting...'
        exit 1
    fi
else
    echo "$file already exists! Skipping archive creation..."
fi


# mount gdrive if not already
if ! [[ $(mount | grep google) ]]; then
    echo "Mounting GDrive..."
    su -c "google-drive-ocamlfuse $home_dir/GDrive" -m george

    if [[ $? -ne 0 ]]; then
        echo 'google-drive-ocamlfuse did not exit successfully! Exiting...'
        exit 1
    fi
else
    mounted=1
    echo "Already mounted"
fi

# TODO: check if file exists in GDrive (will overwrite by default)
# if ! [[ $(su -c "ls $gdrive_backup_dir | grep $file" -m george) -eq 0 ]]; then
#
# if [[ $(su -c "cp $backup_dir/$file $gdrive_backup_dir/$file" -m george) -eq 0 ]]; then
#     echo "Sucessfully copied $backup_dir/$file to $gdrive_backup_dir/$file!"
# else
#     echo "Could not copy $backup_dir/$file to $gdrive_backup_dir/$file! Exiting..."
#     exit 1
# fi
#
# else
#     echo "$gdrive_backup_dir/$file already exists! Exiting..."
#     exit 1
# fi

echo "----- BACKUP COMPLETE: $(date) -----"
