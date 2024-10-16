#!/bin/bash
## zanc ##############
zanc() {
###################### > colors
touch 'ants.ftp.sh'; touch '192.168.0.10'; 
re='\e[0m'; rev='\e[7m'; p1=; p2=;
cyan='\e[36m'; green='\e[32m'; 
###################### > other variables
to='ants.ftp.sh'; path='~/'; port='22'; include="$PWD"; usr="$LOGNAME"; 
exclude='--exclude="*.thumbnails*" --exclude="*.git*" --exclude="*cache*" '; 
specs='--info=name1 --max-size=999mb -a'; log="$HOME/log.log"
ling="$green -------------------$re \n"; 
info=" ---- mark choice with [TAB] -- confirm with [ENTER] ---- "
###################### > read 

selact() { 
printf "$green --$re search folder:"; read -rep " " -i "$PWD" "ss"; 
files=($(ls $ss|fzf -m --height ~62% --header "$info --$ss--";));  
printf "\n$ling"; 
filist=($(for i in ${files[@]}; do realpath "$i"; done; )); 
printf "$green --$re ${filist[*]/%/$green - $re}\n$green -- $re"; read -resn1 -p "ok? [Y/n]" "yno"; [ -z "$yno" ]||selact 
}; 
inc="${filist[*]}";
for i in $(seq "${LINES}"); do printf "\n"; sleep .02; done; 
printf "\e[2J\e[4H";
selact
printf "\e[4H"; sleep .1; 
printf "\n$green --$re RSYNC$green ----------$re \n"; sleep .1; 
printf "$ling\n$green --$re include: \n"; sleep .1;  
printf "$ling\n$green --$re exclude: \n"; sleep .1;  
printf "$ling\n$green --$re specs: \n"; sleep .1;  
printf "$ling\n$green --$re to: \n"; sleep .1;  
printf "$ling\n$green --$re user: \n"; sleep .1;  
printf "$ling\n$green --$re remote-path: \n"; sleep .1;  
printf "$ling\n$green --$re port: \n"; sleep .1;  
printf "$ling\n$green --$re log: \n"; sleep .1;  
printf "$ling\n$green --$re save sync-file: \n"; sleep .1;  
printf "$ling\n\e[10H"; 
####################
printf "\e\e[4H"; sleep .1; 
printf "\n$green --$re RSYNC$green ----------$re \n"; 
printf "$ling\n$green --$re "; read -rep "include: " -i "$inc" "include"; 
printf "$ling\n$green --$re "; read -rep "exclude: " -i "$exclude" "exclude"; 
printf "$ling\n$green --$re "; read -rep "specs: " -i "$specs" "specs"; 
printf "$ling\n$green --$re "; read -rep "to: " -i "$to" "to"; 
printf "$ling\n$green --$re "; read -rep "user: " -i "$usr" "usr"; 
printf "$ling\n$green --$re "; read -rep "remote-path: " -i "$path" "path"; 
printf "$ling\n$green --$re "; read -rep "port: " -i "$port" "port"; 
printf "$ling\n$green --$re "; read -rep "log: " -i "$log" "log"; 
printf "$ling\n$green --$re "; read -rep "save sync-file: " -i "$PWD/rsync_to_$to.sh" "rsf"; 
printf "$green ----------------$re\n"; 
read -n1 -rep " $green --$re OK ["$green"Y"$re"/n] " "kk"; 
[ "$kk" ]&& return; if [ $port -gt 800 ]; then p1="-e"; p2=""'"'"ssh -p $port"'"'""; fi; 
printf " $green --$re schmoozing $green"; 
for i in {1..12}; do printf "\n  --"; sleep .01; done; printf "\n  $re-- $rev  done  $re\n\e[12A\n"; ## cool
printf '#!/bin/bash\n## rsync for '$usr' - '$HOSTNAME' > '$to:$path' 
printf "'"\n·····························\n"'" >> "'"$log"'"; 
printf "'"${me}@${HOSTNAME}:${include} >> ${usr}@$to:$path"'" >> "'"$log"'"
printf "'"·····························\n"'" >> "'"$log"'"; 
rsync '"$specs $exclude $include $p1 $p2 ${usr}@$to:$path "' >> "'"$log"'"
printf "'"·····························\n"'" >> "'"$log"'"; 
date >> "'"$log"'"
printf "'"·····························\n\n"'" >> "'"$log"'"; 
##  -- logs to: "'"$log"'" \n'|tee "$rsf"; ## <-- print config to rsfile ####
chmod 775 "$rsf"; printf "$green  --$re zync-file is at:$green $rsf $re\n\n"; 
rm 'ants.ftp.sh'; rm '192.168.0.10'; 
## test run ########
} 
