#!/bin/bash
 
lo() {
while true; do 
ff2=$(figlist|shuf -n1); 
for i in $(seq $((LINES))); do echo; sleep .02; done; printf "\e[$((LINES/2+12))A";
tput civis; 
figlet -c -w ${COLUMNS} -f "$ff2" "$(date +%a' '%d%m%n%T)"|batcat -ppfl zig|\
pv --rate-limit 666 --quiet;
printf "\e7\e[2H\e[0m\e[2m  $(date -R)\e[0m   ||  \e[2m  $ff2\e[0m\e8"; 
printf "\e[2m\n\n\n\n\e[0m  ······\n\e[2m"; fortune; printf "\e[0m  ······\n";
sleep 22; tput cnorm; 
done; 
} 



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






