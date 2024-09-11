####
## alias 12_menu='menu';
menu() {
size=($(stty size)); for i in $(seq $size); do echo; done; echo -ne '\e[s\e[H\e[J'; 
green='\e[92m'; cyan='\e[36m'; re='\e[0m'; dim='\e[2m'; bold='\e[1m'; c2='\e[36m--\e[0m';
dots="$(for i in $(seq $(($(stty size|tail -c4) - 11))); do echo -ne .; done;)"; 
echo -e "
  ----------------------  ${green}hello${re}  -----------------------
  ------------------------------------------------------
  -- [ ^ v ] ${cyan}Choose${re} ---- [a] ${cyan}Select all${re} ---- [h] ${cyan}Help${re} --
  -- [Enter] ${cyan}Select${re} ---- [k] ${cyan}Confirm${re} ------- [q] ${cyan}Exit${re} --"
unset OPTIONS_VALUES OPTIONS_STRING SELECTED CHECKED OPTIONS_LABELS ov1 cd; 
####
checkbox () {
# little helpers for terminal print control and key input
ESC=$( printf "\033")
cursor_blink_on()   { printf "$ESC[?25h"; }
cursor_blink_off()  { printf "$ESC[?25l"; }
cursor_to()         { printf "$ESC[$1;${2:-1}H"; }
print_inactive()    { printf "$2   $1 "; }
print_active()      { printf "$2  $ESC[7m $1 $ESC[27m"; }
get_cursor_row()    { IFS=';' read -sdR -p $'\E[6n' ROW COL; echo ${ROW#*[}; }
key_input()         {
local key
IFS= read -rsn1 key 2>/dev/null >&2
if [[ $key = "" ]]; then echo enter; fi;  if [[ $key = "q" ]]; then echo -e "q"; fi;
if [[ $key = "h" ]]; then echo -e "h"; fi;
if [[ $key = "k" ]]; then echo -e "k"; fi; if [[ $key = "a" ]]; then echo -e "a"; fi; 
if [[ $key = $'\x20' ]]; then echo space; fi; if [[ $key = $'\x1b' ]]; then read -rsn2 key 
if [[ $key = [A ]]; then echo up; fi; if [[ $key = [B ]]; then echo down; fi; fi; 
}

halp() {
break; 
echo -e "[Q]uit  \t [A]ll  \t [ ]Space "|less -JR --use-color --tilde

}
sel_all() { arr_name=$1; eval " arr=(\"\${${arr_name}[@]}\")"; option=$2; 
if [[ ${arr[option]} == true ]]; then 
for oi in ${!arr[@]}; do arr[oi]=; done; arr[-1]=""; else 
for oi in ${!arr[@]}; do arr[oi]=true;  arr[-1]=""; done; 
fi; eval $arr_name='("${arr[@]}")'; } 
########
toggle_option() { arr_name=$1; eval " arr=(\"\${${arr_name}[@]}\")"; option=$2; 
if [[ ${arr[option]} == true ]]; then arr[option]=
else arr[option]=true; fi; 
#eval $arr_name='("${arr[@]}")'; 
#if [ ${arr[option]}=confirm ]; then halp; fi; 
if [[ ${arr[-1]} == true ]]; then halp; fi;
eval $arr_name='("${arr[@]}")'; 
} 
######################
retval=$1; IFS=';' read -r -a options <<< "$2"; if [[ -z $3 ]]; then unset defaults; 
else IFS=' ' read -r -a defaults <<< "$3"; fi; selected=()
for ((i=0; i<${#options[@]}; i++)); do
selected+=("${defaults[i]:-false}"); printf "\n"; done
# determine current screen position for overwriting the options
lastrow=`get_cursor_row`; startrow=$(($lastrow - ${#options[@]})); 
# ensure cursor and input echoing back on upon a ctrl+c during read -s
trap "cursor_blink_on; stty echo; printf '\n'; exit" 2
cursor_blink_off; active=0; while true; do idx=0;
# print options by overwriting the last lines
for option in "${options[@]}"; do prefix="\e[0m  [ ]";

if [[ ${selected[idx]} == true ]]; then prefix="\e[0m  [$green*$re]"; fi

cursor_to $(($startrow + $idx)); if [ $idx -eq $active ]; 

then print_active "$option" "$prefix"; else print_inactive "$option" "$prefix"; fi; ((idx++)); done

#### user key control
case `key_input` in
enter) toggle_option selected $active;;
space) toggle_option selected $active;;
a) sel_all selected $active;;
k) break;;
h) halp;;
q) echo -e "\e[?25h"; return 0;;
up) ((active--)); if [ $active -lt 0 ]; then active=$((${#options[@]} - 1)); fi;;
down) ((active++)); if [ $active -ge ${#options[@]} ]; then active=0; fi;;
esac; 
done; 
cursor_to $lastrow; echo; cursor_blink_on; 
eval $retval='("${selected[@]}")'; } 
#### BEFORE ###################################################
if [[ $1 ]]; then OPTIONS_VALUES=($1); else OPTIONS_VALUES=($(ls $PWD/$1)); fi; 
if [[ $3 ]]; then for i in ${OPTIONS_VALUES[@]}; do
OPTIONS_LABELS+=("\e[2m $(echo -e "$3";) "); done; 
else for i in ${OPTIONS_VALUES[@]}; 
do ft=$(file $i --mime-type -b|head -c4); if [[ $ft == "text" ]]; then
OPTIONS_LABELS+=("\e[2m $(sed -n 2p $i|tr -s ';()\\' ' '|cut -c-${size[1]}) "); else 
OPTIONS_LABELS+=("\e[2m $(file -b $i|cut -c-${size[1]}) "); fi; done; echo -e "\e[0J"; fi; 
############
for i in "${!OPTIONS_VALUES[@]}"; do 
OPTIONS_STRING+="$dots\e[9G${OPTIONS_VALUES[$i]} \e[29G ${OPTIONS_LABELS[$i]};"; done;
OPTIONS_STRING+="\e[1K\n\e[8G${cyan} Confirm"; 
#### after ####################################################
checkbox SELECTED "$OPTIONS_STRING"; ######## << call functions
for i in "${!SELECTED[@]}"; do if [ "${SELECTED[$i]}" == "true" ]; 
then CHECKED+=("${OPTIONS_VALUES[$i]}"); fi; done; 
echo -e "\n  \e[4;32mYou chose:\e[0m ${CHECKED[@]/#/\\n"  "}";
echo -ne "\n  $c2 Do you wish to proceed? \e[2m[\e[0mY\e[2m/\e[0mn\e[2m] \e[0m "; 
read -n1 -ep "" "yn"; if [ "$yn" != "${yn#[Nn]}" ]; then echo -e "\e[?25h \n  Nope\n"; 
return 0 2>/dev/null; break 2>/dev/null; else echo -e "\n  $c2 OK"; 
#### EXECUTE ###############
for i in "${CHECKED[@]}"; do echo -e "\e[0m  $c2 Installing $i \e[2m"; sleep 1; 
if [ -z "$2" ]; then bash $i; else $2 $i; fi; cd $OLDPWD; 
echo -e "\e[0m  $c2 $i Installed \e[2m"; done; echo -e "\n  Done"; fi; echo -e "\e[0m";
}
#####################

