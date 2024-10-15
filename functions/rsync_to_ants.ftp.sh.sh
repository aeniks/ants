#!/bin/bash
## rsync for aa > ants.ftp.sh:~/ 
printf "
·····························
" >> /home/aa/log.log; 
printf "${HOSTNAME} ${include} >> ${usr}@$to:$path\n" >> /home/aa/log.log
printf "·····························
" >> /home/aa/log.log; 
rsync --info=name1 --max-size=999mb -a --exclude="*.thumbnails*" --exclude="*/.git*" --exclude="*cache*" /ants/functions   aa@ants.ftp.sh:~/  >> /home/aa/log.log
printf "·····························
" >> /home/aa/log.log; 
date >> /home/aa/log.log
printf "·····························
" >> /home/aa/log.log; 
printf "·····························

" >> /home/aa/log.log; 

##  -- logs to: /home/aa/log.log 
