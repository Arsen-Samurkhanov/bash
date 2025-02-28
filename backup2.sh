#! /bin/bash

read -p "Choose  H, M or L compression " file_compression
read -p "wich directory do you want to backup to " dir_name

test -d $HOME/$dir_name || mkdir -m 700 $HOME/$dir_name
backup_dir=$HOME/$dir_name

tar_l="-cvf $backup_dir/b.tar --exclude $backup_dir $HOME"
tar_m="-cvfz $backup_dir/b.tar.gz --exclude $backup_dir $HOME"
tar_h="-cvfj $backup_dir/b.tar.bzip2 --exclude $backup_dir $HOME"

if [ $file_compression = "L" ]; then
tar_opt=$tar_1
elif [ $file_compression = "M" ]; then
tar_opt=$tar_m
else
tar_opt=$tar_h
fi

tar $tar_opt
exit 0
