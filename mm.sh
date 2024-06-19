#!/bin/bash
## Menu which allows multiple items to be selected
menu() {
dim='\e[2m'; green='\e[32m'; re='\e[0m'; hide='\e[8m';
line="$dim---------------------------"; dots="$dim.............."
unset opt choices i nm sel ACTIONS err cole; opt=($(ls -pfA1|grep -v /|head -n9))
for i in $(seq $((LINES-2))); do echo; done; echo -ne "\e[2f\e[0J\e[2f"
## MENU FUNCTION ####
echo -ne " $line\n ------$re BASH$dim-"$re"SELECTOR$dim ------\n $line$re
 ["$dim"1"$re"-"$dim"9"$re"] select/unselect ["$dim"a"$re"] select/unselect all\
 ["$dim"ENTER"$re"] confirm ["$dim"q"$re"] exit \n $line$re\n\e[s";
MENU() {
cole=$(stty size|tr " " "\n"|tail -n1)
for nm in ${!opt[@]}; do echo -e " ["$green"${choices[nm]:- }"$re"]" '('$dim$((nm+1))$re") \
$(echo ${opt[nm]}|head -c28) $dots\e[29G\e[1D $dim$(sed -n 2p ${opt[nm]}\
|tr -d '\\'|pr -t -c1 -w$((cole-42)))$re"; done; echo "$err";
}
## MENU LOOP ########
echo -ne "\e[?25l"; while MENU && read -en1 -p "$(echo -e "$hide")" sel && [[ -n "$sel" ]]; do echo -ne "$hide\e[u";
if [[ "$sel" == *[[:digit:]]* && $sel -ge 1 && $sel -le ${#opt[@]} ]]; 
then (( sel-- )); if [[ "${choices[sel]}" == "+" ]]; then
choices[sel]=""; else choices[sel]="+"; fi; err=""; 
#else err="$(echo -ne "\n$dim Invalid option: $re$sel\e[0m";)"; 
fi; 
if [ $sel == a ]; then if [ -z $choices ]; then unset choices; for i in ${!opt[@]}; do choices+=(+); done; 
else unset choices; fi; fi; 
if [ $sel == q ]; then echo -e "\n\e[?25h\e[0m"; echo -e "\n\n\n\n\n\n gg\n\n"; return 0; fi; 
done;
## CONFIRMATION #####
for i in ${!opt[@]}; do if [[ ${choices[$i]} ]]; 
then echo -e "$re Option $((i+1)) ($dim${opt[i]}$re) selected"; fi; done;
echo -ne "\n$re Are these choices correct?$re$dim ["$re"Y$dim/"$re"n"$dim"]$re"; 
read -en1 "yn"; if [ "$yn" == "${yn#[Nn]}" ]; then echo -e "\n\n Ok\e[?25h\e[0m"; 
for i in ${!opt[@]}; do if [[ ${choices[$i]} ]]; 
then echo -e "\n Installing: $dim${opt[i]}$re"; source ${opt[i]}; 
echo -e "$green DONE$re"; fi; done; fi; echo -e "\n\e[?25h\e[0m";
#####################
}
