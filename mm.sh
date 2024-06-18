#!/bin/bash
## Menu which allows multiple items to be selected
unset opt choices i nm sel ACTIONS err
opt=($(ls -pfA1|grep -v /))
for i in $(seq $((LINES-4))); do echo; done; echo -ne "\e[2f\e[0J\e[4f"
## MENU FUNCTION ####
echo -ne " Select the desired option using their nmber 
 ("$dim"again to uncheck,$re ENTER$dim when done"$re"): \n\n\e[s";
MENU() {
for nm in ${!opt[@]}; do echo -e " [""${choices[nm]:- }""]" $dim$((nm+1))$re") \
${opt[nm]}  \t$dim$(sed -n 2p ${opt[nm]};)$re"; done; echo "$err";
}
## MENU LOOP ########
while MENU && read -ep "" -n1 sel && [[ -n "$sel" ]]; do echo -ne "\e[u";
if [[ "$sel" == *[[:digit:]]* && $sel -ge 1 && $sel -le ${#opt[@]} ]]; 
then (( sel-- )); if [[ "${choices[sel]}" == "+" ]]; then
choices[sel]=""; else choices[sel]="+"; fi; err=""; else 
err="$(echo -ne "$dim Invalid option: $re$sel";)"; fi; done; 
## CONFIRMATION #####
for i in ${!opt[@]}; do if [[ ${choices[$i]} ]]; 
then echo -e " Option $((i+1)) selected"; fi; done;
echo -ne "\n Are these choices correct?"; 
read -n1 -p "$re$dim ["$re$bold"Y$dim/"$re$bold"n$dim]$re " "yn"; 
if [ "$yn" == "${yn#[Nn]}" ]; then echo " Ok"; 
for kl in ${!choices[*]}; do echo ${opt[kl]}; done; fi; echo;
#####################

