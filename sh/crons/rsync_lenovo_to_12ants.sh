#!/bin/bash
## uu ##############
####################
####################
end='aaaa@ants.ftp.sh:/media/sata1/backups/leonel/' ##################
####################
include='
/home/aa/Pictures 
/home/aa/Public 
/home/aa/Documents 
/home/aa/Music
' ##################
####################
exclude='
--exclude=".thumbnails" 
--exclude=".git" 
' ##################
####################
specs='
-a
--info=name1 
--max-size=999mb 
' ##################
####################
##
##
## test run ########
rsync --dry-run $specs $include $exclude $end|grep "" &>/dev/null &&
(
## go ##############

echo -e "-----------------------------"; date; 
echo -e "----------------------------- \n$end"; 
echo -e "-----------------------------";
rsync $specs $include $exclude $end; 
echo -e "----------------------------- \n$end"; 
echo -e "-----------------------------"; date;
echo -e "----------------------------- \n\n ";
)
####################
####################
