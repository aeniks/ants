#!/bin/bash
## rsync for aa > 192.168.0.100:~/ 
#  -----------------------------  #
#  -----------------------------  #
rsync --info=name1 --max-size=999mb --prune-empty-dirs -a --exclude="*.thumbnails*" --exclude="*/.git*" --exclude="*cache*" /ants   192.168.0.100:~/ 
#  -----------------------------  #
#  -----------------------------  # 
##  -- logs to: $log 

