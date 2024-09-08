rsync /ants -e "ssh aa@192.168.0.105:~/ -p 8022" -av --exclude="*.git*" --exclude="*cache*" 
