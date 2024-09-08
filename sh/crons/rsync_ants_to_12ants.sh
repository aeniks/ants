#!/bin/bash
## uu ##############
####################
####################
to='aa@ants.ftp.sh:' ##################
####################
include='/ants
' ##################
####################
exclude='
--exclude=".thumbnails" 
--exclude="*.git*" 
' ##################
####################
specs='
-a
--info=name1 
--max-size=999mb 
--prune-empty-dirs 
' ##################
####################
##
##
## test run ########
rsync --dry-run $specs $include $exclude $to|grep "" &>/dev/null &&
(
## go ##############

echo -e "-----------------------------"; date; 
echo -e "----------------------------- \n$to"; 
echo -e "-----------------------------";
rsync $specs $include $exclude $to; 
echo -e "----------------------------- \n$to"; 
echo -e "-----------------------------"; date;
echo -e "----------------------------- \n\n ";
)
####################
####################