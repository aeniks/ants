
rsync --dry-run $specs $include $exclude $to -e "$to:$path -p $zport"|grep "" &>/dev/null &&
(
echo -e "-----------------------------"; date; 
echo -e "----------------------------- \n$to"; 
echo -e "-----------------------------";
rsync $specs $include $exclude -e "$to: -p $zport"; 
echo -e "----------------------------- \n$to"; 
echo -e "-----------------------------"; date;
echo -e "----------------------------- \n\n ";
)|tee -a "$log"; printf "\n  --$green$rev OK $re \n\n"; 
