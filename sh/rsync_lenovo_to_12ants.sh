rsync -azP -e 'ssh -p 44444' --exclude=".thumbnails" --exclude=".git" --max-size=999mb "/home/aa/Pictures" "/home/aa/Documents" "/home/aa/Music" aaaa@ants.ftp.sh:/media/sata1/back/leonel/ --mkpath 
