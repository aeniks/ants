#!/bin/bash
## selection menu 
q() {
hash batcat||hash bat||sudu apt install batcat -qy &>/dev/null||apt install bat -y 2>/dev/null; 
local prompt="${2}"; [ "$2" ]||local prompt="hello"; 
local ops=($1); [ "$1" ]||local ops=(*); 
local index="0" cur="0" count="${#ops[@]}"; 
local esc=$(echo -ne "\e") prevl=$((count+5)) size=($(stty size));
## print prompt
printf "\e[?25l\e[8m"; seq $((size-2)); printf "\e[0J\n\e[H\e[28m\n"; 
dash=" \e[2m$(for i in $(seq $((${size[1]}-4))); do printf "-"; done)\e[0m"; 
printf "\e[2K$dash\n\e7$dash\e8\e[2m -- \e[0m$prompt \n$dash\n"; 
#local IFS=" \n"; 
while true; do local index="0"; for o in "${ops[@]}"; do 
## mark & highlight the current option
if [ "$index" == "$cur" ]; then 
printf "\e[0m > \e[7m $o "; printf "\e7\e[s"; 
printf "\e[${prevl}H\e[0m$dash\e[0m \n\n\e[0J"; 
[ -e ${ops[cur]} ]&& batcat -pPf ${ops[cur]} --line-range :$((size - prevl-6)); 
[ -e ${ops[cur]} ]|| printf "\e[0J"; 
printf "\e8\e[u\n";
## list all options (option list is zero-based)
else 
printf "\e[0m   \e[2m $o \n\e[0m"
#\e7\e[$((${size}-22))H\e[2m $(head -n4 ${ops[cur]}) \e8\n";
#printf "    $o  "; head -n1 ${ops[cur]}||printf "\n"; 
fi; (( index++ )); done; 
############
read -srn3 key; ## wait for user to key in arrows or ENTER
if [[ $key == $esc[A ]]; then (( cur-- )); (( cur < 0 ))&& (( cur = 0 )); ## up-arrow
elif [[ $key == $esc[B ]]; then (( cur++ )); (( cur >= count ))&& (( cur = count - 1 )); # down arrow
elif [[ $key == "qqq" ]]; then break; 
elif [[ $key == "" ]]; then break; 
fi; printf "\e[${count}A"; # go up to the beginning to re-render
done; printf -v sel "${ops[$cur]}"; ## export the selection to the requested output variable
printf  "\e[0m$dash
\e[2m --\e[0m selected: \e[2m$sel
\e[2m --\e[0m variable: \e[2m\$sel
$dash\n\e[0J\n\e[?25h";
}



