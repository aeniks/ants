#!/bin/bash
## selection menu 
12() {
#### just make sure of dependencies ####
hash sudo && su='sudo'; hash batcat||hash bat||$su apt install batcat file -qy &>/dev/null||\
apt install bat file -y &>/dev/null; hash jp2a||$su apt install jp2a file -y &>/dev/null;
printf "\n\e[2A\e[2K\n\e[?25l"
qmen() { unset selected; aa="0"; index="0"; cur="0"; esc=$(echo -ne "\e");
#### get file info to variable
ops=($1); [ "$1" ]||ops=( $(command ls -p) ); size=($(stty size)); re='\e[0m'; cyan='\e[36m'; 
count="${#ops[@]}"; counr=(${!ops[@]}); counr+=(1 1 1 1); prevl=$((count+2)); 
c44="$(for col in $(seq 44); do printf "."; done;)"; d60="$(for col in $(seq 61); do printf "-"; done;)"
c14="$(for col in $(seq 14); do printf "."; done;)"; d14="$(for col in $(seq 14); do printf "."; done;)"
####  set description
for oo in ${!ops[@]}; do if [ "$(printf ${ops[oo]}|grep "/";)" ]; then 
opsa[oo]="$(ls -mp ${ops[oo]}|tr "\n" " "|head -n1|pr --omit-header --page-width=40 2>/dev/null)"; 
elif [ "$(file -bi ${ops[oo]}|grep "text";)" ]; then 
opsa[oo]="$(sed -n 2p ${ops[oo]}|pr --omit-header --page-width=40 2>/dev/null)"; 
fi; done; printf "    ${d60}\n"; for io in "${!counr[@]}"; do printf "\n"; 
done; printf "\e[4A    ${d60}\n\n"; printf "\e[${prevl}A\e7";
for o in "${!ops[@]}"; do 
printf "   ${ops[o]} \e[22G\e[0;2m \e[0K${opsa[o]} \e[0m\n"; 
done; printf "\e8"; while true; do local index="0"; 
for o in "${!ops[@]}"; do if [ "$index" == "$cur" ]; then 
printf "\e7\e[0;1;36m > \e[0;7m ${ops[o]%.*} $c14\e[22G$c44\e[22G\e[2m ${opsa[o]#\## *} \e[0m\n"; else 
printf "\e7   \e[0m ${ops[o]%.*} $c14\e[22G$c44\e[22G\e[2m ${opsa[o]#\## *} \e[0m\n";
printf "\e8\n"; fi; (( index++ )); done; read -srn3 key; ## wait for user to key in arrows or ENTER
if [[ $key == $esc[A ]]; then (( cur-- )); (( cur < 0 ))&& (( cur = 0 )); ## up-arrow
elif [[ $key == $esc[B ]]; then (( cur++ )); (( cur >= count ))&& (( cur = count - 1 )); # down arrow
elif [[ $key == "qqq" ]]; then printf "\e[?25h"; aa="1";
printf "\e[8A\n\n\t\t\e[2;46m        \e[0m\n\e[0m\t\t\e[2;46m  \
\e[0;1;40mbye!\e[2;46m  \e[0m\n\t\t\e[2;46m        \e[0m\n\n\n\n\\e[?25h\n\n"; 
return; elif [[ $key == "" ]]; then printf "\e[?25h"; break; 
fi; printf "\e[${count}A"; # go up to the beginning to re-render
done; ((++aq)); printf -v selected "${ops[$cur]}"; } 
qend() { printf "\e[?25h\n$cyan$dim --$re choice:\e[0;32m ${selected}\n\n"; } 
#######################################################
while true; do qmen; if [ "$aa" -eq 1 ]; then return; fi; 
if [ "$(file -ib ${opsa[o]}|grep directory)" ]; then qend; 
return; echo $selected; else qend; return;  fi; done; break;
}
