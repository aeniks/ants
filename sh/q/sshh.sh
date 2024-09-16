#!/bin/bash
## ssh scanner
sshh() {
hash nmap batcat 2>/dev/null||sudo apt install -y nmap batcat &>/dev/null nmap|| 
hash sudo||apt install -y nmap batcat &>/dev/null; 
## clear
size=($(stty size)); re='\e[0m'; cyan='\e[36m'; 
for i in $(seq $((size-1))); do echo; done; printf "\e[H\n\e[2J\e[0m"; 
## 
printf "\e[82A\n\n\e[2m -- scanning LAN --\e[0m\n\n"; 
host="192.168.0.1"; lan=( "ants.ftp.sh" $(cat $ants/sh/ssh/known 2>/dev/null) ); 
for i in $(seq -w 00 12); do 
ping ${host}${i} -W .2 -qACc1 1>/dev/null&& lan+=( "$host$i" )&& 
printf "\n\t  \e[100;3$((${i:(-1)}+1))m${lan[@]: -1}\e[0m"; 
done; 
qm " ${lan[*]} " haaaa

}
############ clear scree

qm() {
local ops=( $1 );
local prompt="${2}";
local index="0" cur="0" count="${#ops[@]}"; 
local esc=$(echo -ne "\e") prevl=$((count+5)); 
############## clear screen but keep scrollback#####
printf "\e[?25l\e[8m"; 
## clear
size=($(stty size)); re='\e[0m'; cyan='\e[36m'; 
for i in $(seq $((size-1))); do echo; done; printf "\e[H\n\e[2J\e[0m"; 
## 
dash=" $dim$(for i in $(seq $((${size[1]}-4))); do printf "-"; done)$re"; 
############  prompt ################################
printf "\e[2K$dash\n\e7$dash\e8$dim -- $re$prompt \t\t $re[${dim}enter${re}]$dim - confirm \t$re [${dim}qqq${re}]$dim - exit $re\n$dash\n"; 
#local IFS=" \n"; 
while true; do local index="0"; for o in "${ops[@]}"; do 
## mark & highlight the current option
if [ "$index" == "$cur" ]; then 
printf "$re > \e[7m $o "; printf "\e7\e[s"; ## save cursor
printf "\e[${prevl}H\e[0m$dash\e[0m \n\e[0J"; ## draw bottom line after menu
nmap $o -p 22,8022 --open |grep --colour -B1 "open"; 
#(pr --omit-header $o --page-width=$COLUMNS|batcat -SpPf  --line-range :$((size - prevl-2)); 
printf "\e[$((size-1))H$dash"; ## draw bottom line 
#[ -r $o ]|| printf "\e[0J"; 
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
elif [[ $key == "qqq" ]]; then printf "\e[?25h\n\n\n\n\n\n\n\e[0J\nbye!\n\n"; return; break 2>/dev/null; 
elif [[ $key == "" ]]; then printf "\e[?25l"; break; 
fi; printf "\e[${count}A"; # go up to the beginning to re-render
done; 
printf -v selected "${ops[$cur]}"; ## export the selection to the requested output variable
printf  "$re$dash\n$dash
\e[0K$cyan$dim --$re selected:\e[1m$cyan $selected$re
$dash\n$dash\n\e[0J\n\e[?25h";
port="$(nmap  $selected -p 22,8022 --open -q|grep "open"|cut -f1 -d"/")"
read -rep "  -- user: " -i "$USER" "user"; 
read -rep "  -- port: " -i "$port" "port"; 
printf  "\n\e[H\e[2J\n"; 
ssh -p $port $selected -l $user;
printf "${re}ssh-copy-key ${cyan}${user}${re}@${cyan}${selected}${re}:${cyan}${port}${re}? [y/N]";  
read -n1 -rep " " "yn";
if [[ $yn = "y" ]]; then 
ssh-copy-id -p $port $user@$selected; fi; 
printf "\n\nOK\n\n"; 
}


sshh
