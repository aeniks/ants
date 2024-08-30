#!/bin/bash
## uu
echo; 
echo "-----------------------------"; 
date;
rsync --mkpath --info=name1 -hvaz --exclude=".thumbnails" --exclude=".git" --max-size=999mb \
"/home/aa/Pictures" "/home/aa/Public" "/home/aa/Documents" "/home/aa/Music" \
aaaa@ants.ftp.sh:/media/sata1/backups/leonel/;
echo "aaaa@ants.ftp.sh:/media/sata1/backups/leonel/"
echo "-----------------------------";
