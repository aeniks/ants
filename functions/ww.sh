#!/bin/bash
## selection menu 
ww() { ops=($2);[ "$2" ]||ops=($(ls -p $ants/sh/q/)); 
local prompt="$1" index="0" cur="0" count="${#ops[@]}" esc=$(echo -ne "\e");
printf "\e[?25l    --$prompt--\n"; ## print prompt
while true; do local index="0"; for o in "${ops[@]//.*/}"; ## print options
do if [ "$index" = "$cur" ]; then echo -e " > \e[7m $o \e[0m"; ## mark & highlight the current option
else echo -e "    $o  "; fi; (( index++ )); done; ## list all options (option list is zero-based)
read -srn1 key; ## wait for user to key in arrows or ENTER
if [ "$key" = A ]; then (( cur-- )); (( cur < 0 ))&& (( cur = 0 )); 
elif [ "$key" = B ]; then (( cur++ )); (( cur >= count ))&& (( cur = count - 1 )); 
elif [ "$key" = C ]; then sed -n 2p "${ops[$cur]}"; 
elif [ "$key" = "" ]; then break; 
elif [ "$key" = "q" ]; then printf "\e[?25h\n"; return; fi; # en
echo -en "\e[${count}A"; done; # go up to the beginning to re-render
if [ "$(printf "${ops[$cur]}"|grep "/")" ]; then q "${ops[$cur]}" "$(ls -p $ants/sh/q/${ops[$cur]})"; fi; 
printf -v sel "${ops[$cur]}"; printf  "\e[?25h\n \e[7m $sel \e[0m\n"; 
##########################################################
printf "\n"; . $ants/sh/q/$sel; printf "\n"; return; #####
##########################################################
}; #######################################################
return; break; 
######## after line 24 are all options
whatis 
