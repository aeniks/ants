#!/bin/bash
## selection menu 
chooser() {
local IFS=" \n";local ops=($2);[ "$2" ]||local ops=(*);
local prompt="$1" index="0" cur="0" count="${#ops[@]}" esc=$(echo -ne "\e");
printf "\e[?25l    --$prompt--\n"; ## print prompt
while true; do local index="0"; for o in "${ops[@]}"; ## print options
do if [ "$index" == "$cur" ]; then echo -e " > \e[7m $o \e[0m"; ## mark & highlight the current option
else echo -e "    $o  "; fi; (( index++ )); done; ## list all options (option list is zero-based)
## printf "    ----"; ## print prompt
read -srn3 key; ## wait for user to key in arrows or ENTER
if [[ $key == $esc[A ]]; then (( cur-- )); (( cur < 0 ))&& (( cur = 0 )); ## up-arrow
elif [[ $key == $esc[B ]]; then (( cur++ )); (( cur >= count ))&& (( cur = count - 1 )); # down arrow
elif [[ $key == "" ]]; then break; 
elif [[ $key == "qqq" ]]; then break; 
fi; # enter
echo -en "\e[${count}A"; done; # go up to the beginning to re-render
#####################################################
printf -v sel "${ops[$cur]}"; printf  "\e[?25h\n \e[7m $sel \e[0m\n\n";
}
## https://aeniks.github.io
## https://aeniks.github.io
## https://aeniks.github.io
## https://aeniks.github.io