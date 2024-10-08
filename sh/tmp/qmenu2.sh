#!/bin/bash
## selection menu 
q2() {
#### just make sure of dependencies ####
dim='\e[2m'; re='\e[0m'; hash sudo && su='sudo'; hash batcat||hash bat||$su apt install batcat file -qy &>/dev/null||apt install bat file -y &>/dev/null; hash jp2a||$su apt install jp2a file -y &>/dev/null;
#########################################
## check if options are chosen. // else choose current folder contents; 
local ops=($1); [ "$1" ]||local ops=(*); 
local prompt="${2}"; [ "$2" ]||local prompt="hello"; 
local index="0" cur="0" count="${#ops[@]}"; 
local esc=$(echo -ne "\e") prevl=$((count+5)) size=($(stty size));
############## clear screen but keep scrollback#####
printf "\e[?25l\e[8m"; seq $((size-1)); printf "\e[0J\n\e[H\e[28m\n"; dash=" $dim$(for i in $(seq $((${size[1]}-4))); do printf "-"; done)$re"; 
############  prompt ################################
printf "\e[2K$dash\n\e7$dash\e8$dim -- $re$prompt \t\t $re[${dim}enter${re}]$dim - confirm \t$re [${dim}qqq${re}]$dim - exit $re\n$dash\n"; 
#local IFS=" \n"; 
while true; do local index="0"; for o in "${ops[@]}"; do 
## mark & highlight the current option
if [ "$index" == "$cur" ]; then 
printf "$re > \e[7m $o "; printf "\e7\e[s"; ## save cursor
printf "\e[${prevl}H\e[0m$dash\e[0m \n\e[0J"; ## draw bottom line after menu
(pr --omit-header $o --page-width=$COLUMNS|batcat -SpPf  --line-range :$((size - prevl-2)); 
printf "\e[$((size-1))H$dash";) ## draw bottom line 
[ -r $o ]|| printf "\e[0J"; 
printf "\e8\e[u\n"; ##return cursor
## list all options (option list is zero-based)
else 
printf "$re   $dim $o \n$re"
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
done; printf -v selected "${ops[$cur]}"; ## export the selection to the requested output variable
printf  "$re$dash\n$dash
\e[0K$cyan$dim --$re selected:\e[1m$cyan $sel$re
\e[0K$cyan$dim --$re variable: $cyan$dim\$selected$re
$dash\n$dash\n\e[0J\n\e[?25h";
}



