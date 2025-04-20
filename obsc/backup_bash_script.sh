#! /bin/bash

read -p "Which file types do you want to backup " file_suffix
#read -p "Which directoty do you want to backup to" dir_name

test -d $HOME/backup_bash_script || mkdir -m 700 $HOME/backup_bash_script

cp /home/arsen/Desktop/bash/*$file_suffix $HOME/backup_bash_script/