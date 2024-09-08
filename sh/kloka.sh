#!bin/bash 
## top row thing 
kloka() { 
sleep 2;
c40="$(for i in $(seq 40); do printf ' '; done)"; 
while true; do 
printf "\e7\e[1;$((COLUMNS/2))H\e[18D\e[47m ${c40}\e[0m\e[26D \
\e[2;38;5;$((198+$(date +%H)))m$(date +%H)\e[0m:\
\e[2;38;5;$((198+$(date +%H)))m$(date +%M)\e[0m:\
\e[38;5;$(date +%S)m$(date +%S) \e8"; sleep 1; done 
##c00="$(for i in $(seq $COLUMNS); do printf " "; done)"; printf "\e[H\e[40m${c00}\e[0m";
}
