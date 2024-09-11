#!/bin/bash
## zanc ##############
re="$(printf "\e[0m")"; 
rev="$(printf "\e[7m")"; 
cyan="$(printf "\e[36m")"; 
green="$(printf "\e[32m")";
zanc() {
to='aa@ants.ftp.sh'
path='~/'; 
port='22'; 
include='/ants'; 
exclude='--exclude="*.thumbnails*" --exclude="*/.git*"'; 
specs='-a --info=name1 --max-size=999mb --prune-empty-dirs'; 
log='/home/aa/log.log'
######################
printf "\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\e[18A
  --$green RSYNC $re---------- \n"; 
read -rep " $green --$re include$green:$re " -i "$include" "include";
read -rep " $green --$re exclude$green:$re " -i "$exclude" "exclude";
read -rep " $green --$re specs$green:$re " -i "$specs" "specs";
read -rep " $green --$re to$green:$re " -i "$to" "to";
read -rep " $green --$re path$green:$re " -i "$path" "path";
read -rep " $green --$re port$green:$re " -i "$zport" "zport";
read -rep " $green --$re log$green:$re " -i "$log" "log";
read -rep " $green --$re save sync-file$green:$re " -i "$PWD/rsync_to_$to.sh" "rsf";
printf  "\n  ----------------\n"; 
read -n1 -rep "  --$green OK$re [Y/n]" "kk"; 
[ "$kk" ]&& return;
[ "$rsf" ]&& printf "#!/bin/bash\n####\nrsync $specs $include $exclude $to; \n####" >> "$rsf";
## test run ########
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
} 
