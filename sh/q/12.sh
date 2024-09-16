#!/bin/bash
## selection menu 
12() {
#### just make sure of dependencies ####
hash sudo && su='sudo'; hash batcat||hash bat||$su apt install batcat file -qy &>/dev/null||apt install bat file -y &>/dev/null; hash jp2a||$su apt install jp2a file -y &>/dev/null;
#########################################
## check if options are chosen. // else choose current folder contents; 
# local ops=($1); [ "$1" ]||local ops=($(ls -p)); 
# local prompt="${2}"; [ "$2" ]||local prompt="hello"; 
# local index="0" cur="0" count="${#ops[@]}"; 
# local esc=$(echo -ne "\e") 
##
printf "\n\e[2A\e[2K\n\e[?25l"
qmen() {
unset selected; aa="0";
prompt="${2}"; [ "$2" ]||\
prompt="hello"; 
index="0"; cur="0"; 
esc=$(echo -ne "\e");
####
############## clear screen but keep scrollback#####
## for i in $(seq $((size-1))); do echo; done; printf "\e[H\n\e[2J\e[0m"; 


## printf "\e[0J\n\e[H\e[28m\n"; 
#dash=" $dim$(for i in $(seq $((${size[1]}-12))); do printf "-"; done)$re"; 
############  prompt ################################
## printf "\e[2K$dash\n\e7$dash\e8$dim -- $re$prompt \t\t $re[${dim}enter${re}]$dim - confirm \t$re [${dim}qqq${re}]$dim - exit $re\n$dash\n"; 
#local IFS=" \n"; 
## dic
#dic() { 
#pr --omit-header --page-width=$COLUMNS|batcat -SpPf  --line-range :$((size - prevl-2)) 2>/dev/null; 
#}  
####
#for op in ${ops[@]}; do op="$(file $op -b --mime-type|tr "/" "-")"; done; 
#### get file info to variable
ops=($1); [ "$1" ]||ops=( $(command ls -p) ); 
size=($(stty size)); re='\e[0m'; cyan='\e[36m'; 
count="${#ops[@]}"; counr=(${!ops[@]}); counr+=(1 1 1 1);
prevl=$((count+2)); 
c44="$(for col in $(seq 44); do printf "."; done;)"
d60="$(for col in $(seq 61); do printf "-"; done;)"
c14="$(for col in $(seq 14); do printf "."; done;)"
d14="$(for col in $(seq 14); do printf "."; done;)"
##  set desc
######## 
for oo in ${!ops[@]}; do 
if [ "$(printf ${ops[oo]}|grep "/";)" ]; then 
opsa[oo]="$(ls -mp ${ops[oo]}|tr "\n" " "|head -n1|pr --omit-header --page-width=40 2>/dev/null)"; 
elif [ "$(file -bi ${ops[oo]}|grep "text";)" ]; then 
opsa[oo]="$(sed -n 2p ${ops[oo]}|pr --omit-header --page-width=40 2>/dev/null)"; 
fi; done; 
########

printf "    ${d60}\n";
for io in "${!counr[@]}"; do printf "\n"; done; 
printf "\e[4A    ${d60}\n\n";
	printf "\e[${prevl}A\e7";

####

for o in "${!ops[@]}"; do 
printf "   ${ops[o]} \e[22G\e[0;2m \e[0K${opsa[o]} \e[0m\n"; 
done
printf "\e8"
####
while true; do local index="0"; 
for o in "${!ops[@]}"; do 
if [ "$index" == "$cur" ]; then 
printf "\e7\e[0;1;36m > \e[0;7m ${ops[o]%.*} $c14\e[22G$c44\e[22G\e[2m ${opsa[o]#\## *} \e[0m\n"; else 
printf "\e7   \e[0m ${ops[o]%.*} $c14\e[22G$c44\e[22G\e[2m ${opsa[o]#\## *} \e[0m\n";
printf "\e8\n"; 
fi; (( index++ )); done; 
##return cursor
# printf "$re > \e[7m ${o%.*} \t"; 
# printf "\e7\e[s"; ## save cursor
# if [ "$(file -ib $o|grep directory)" ]; then ls $o -mp|batcat -Ppfl c; 
# elif [ "$(file -ib $o|grep text)" ]; then sed -n 2p $o; 
# fi; 

#printf "\e[$((size-1))H$dash"; ## draw bottom line 
#[ -r $o ]|| printf "\e[0J"; 
## list all options (option list is zero-based)
#printf "$re   $dim ${o%.*} \t ${ob}";
#\e7\e[$((${size}-22))H\e[2m $(head -n4 ${ops[cur]}) \e8\n";
#printf "    $o  "; head -n1 ${ops[cur]}||printf "\n"; 
############
read -srn3 key; ## wait for user to key in arrows or ENTER
if [[ $key == $esc[A ]]; then (( cur-- )); (( cur < 0 ))&& (( cur = 0 )); ## up-arrow
elif [[ $key == $esc[B ]]; then (( cur++ )); (( cur >= count ))&& (( cur = count - 1 )); # down arrow
#elif [[ $key == $esc[C ]]; then return;
elif [[ $key == "qqq" ]]; then printf "\e[?25h"; aa="1";
printf "\e[8A\n\n\t\t\e[2;46m        \e[0m\n\e[0m\t\t\e[2;46m  \e[0;1;40mbye!\e[2;46m  \e[0m\n\t\t\e[2;46m        \e[0m\n\n\n\n\\e[?25h\n\n"; 

return; 
elif [[ $key == "" ]]; then printf "\e[?25h"; break; 
fi; 
printf "\e[${count}A"; # go up to the beginning to re-render
done; ((++aq))
printf -v selected "${ops[$cur]}"; ## export the selection to the requested output variable
#file -ib $selected|grep "directory"&& cd $selected; 

}
qend() {
printf "\e[?25h\n$cyan$dim --$re choice:\e[0;32m ${selected}\n\n"; 
#read -rp " " -i "echo" "cmd"; 
#printf "\e[0K$cyan$dim --$re execute: $cmd ${selected}${re}? \e[2m[${re}Y/n\e[2m]"; 
#read -n1 -rep " " "ny"; [ -z $ny ]&& (printf "\n\n"; $cmd $selected;); 
#printf "\n\n"; return; 
} 


while true; do
qmen;
if [ "$aa" -eq 1 ]; then return; fi;
if [ "$(file -ib ${opsa[o]}|grep directory)" ]; 
then 
qend; return; 
echo $selected; else qend; return;  fi; 
done

break;

#qmen;





#printf "\e[2B\e[G$dash\n$dash\n\e[0J\n\e[?25h";
}
12
