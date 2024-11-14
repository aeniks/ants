#!/bin/bash
 
lo() { 
printf "\e[H\e[J"; 
printf "\e[?47l"; 
while true; do 
ff2=$(cat $HOME/ff.sh|shuf -n1); 
for i in $(seq $((LINES))); do echo; sleep .02; done; printf "\e[$((LINES/2+12))A\e[8m";
figlet -c -w ${COLUMNS} -f "$ff2" "$(date +%A)"|batcat -ppfl zig|\
pv --rate-limit 4666 --quiet; echo;
figlet -c -w ${COLUMNS} "$(date +%T)"|batcat -ppfl zig|\
pv --rate-limit 4666 --quiet;
printf "\e7\e[2H\e[0m\e[2m  $(date -R)\e[0m   ||  \e[2m  $ff2\e[0m\e8"; 
printf "\e[2m\n\n\n\n\e[0m  ······\n\e[2m"; fortune; printf "\e[0m  ······\n";
read -t22 -n2 -sre "ee"; no; [ "$ee" = "q" ]&& (printf "\n\n\n\n" ; no; return; printf "\e[?47h");   
done; no; printf "\e[?47h"; 

} 
printf "\e[?47h"; 

alias klo='lo'; 
# lolo() { 
# while true; do ff=$(figlist|shuf -n1); 
# printf "\n\n$ff\n\n"; 
# figlet -c -w ${COLUMNS} -f "$ff" "_Hello"|batcat -ppfl zig; 
# printf "\n\n"; sleep 6; 
# ff=$(figlist|shuf -n1); 
# printf "\n\n$ff\n\n"; figlet -c -w ${COLUMNS} -f "$ff" "$(date +%X)"|batcat -ppfl zig; 
# printf "\n\n"; 
# fortune; done; 
# }; 
# 






