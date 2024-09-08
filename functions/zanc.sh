#!/bin/bash
## zanc ##############
zanc() {
###################### > colors
re="$(printf "\e[0m")"; rev="$(printf "\e[7m")"; p1=; p2=;
cyan="$(printf "\e[36m")"; green="$(printf "\e[32m")"; 
###################### > other variables
to='192.168.0.100'; path='~/'; port='22'; include="$PWD"; usr="$USER"; 
exclude='--exclude="*.thumbnails*" --exclude="*/.git*" --exclude="*cache*" '; 
specs='--info=name1 --max-size=999mb --prune-empty-dirs -a'; log="$HOME/log.log"
###################### > read 
printf "\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\e[18A
$green  --$re RSYNC$green ----------$re \n"; 
read -rep " $green --$re include: " -i "$include" "include";
read -rep " $green --$re exclude: " -i "$exclude" "exclude";
read -rep " $green --$re specs: " -i "$specs" "specs";
read -rep " $green --$re to: " -i "$to" "to";
read -rep " $green --$re user: " -i "$usr" "usr";
read -rep " $green --$re remote-path: " -i "$path" "path";
read -rep " $green --$re port: " -i "$port" "port";
read -rep " $green --$re log: " -i "$log" "log";
read -rep " $green --$re save sync-file: " -i "$PWD/rsync_to_$to.sh" "rsf";
printf  "$green  ----------------$re\n"; 
read -n1 -rep " $green --$re OK ["$green"Y"$re"/n] " "kk"; 
[ "$kk" ]&& return; if [ $port -gt 800 ]; then p1="-e"; p2=""'"'"ssh -p $port"'"'""; fi; 
printf " $green --$re schmoozing $green"; 
for i in {1..12}; do printf "\n  --"; sleep .5; done; printf "\n  $re-- $rev  done  $re\n\e[12A\n"; sleep 1; ## cool
printf '#!/bin/bash\n## rsync for '$USER' > '$to:$path' 
#  -----------------------------  #
#  -----------------------------  #
rsync '"$specs $exclude $include $p1 $p2 $to:$path "'
#  -----------------------------  #
#  -----------------------------  # 
##  -- logs to: '$log' 
\n'|tee "$rsf"; chmod 775 "$rsf"; printf "$green  --$re zync-file is at:$green $rsf $re\n\n"; 

## test run ########
} 
