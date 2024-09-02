#!bin/bash 
## top row thing 
c50="$(for i in $(seq 44); do printf " "; done)"; 
while true; 
do printf "\e7\e[1;$((COLUMNS/2-20))H\e[40m${c50}\e[0m\e[26D\
\e[2;38;5;$((198+$(date +%H)))m$(date +%H)\e[0m:\
\e[2;38;5;$((198+$(date +%H)))m$(date +%M)\e[0m:\
\e[38;5;$(date +%S)m$(date +%S)\e8"; sleep 1; done 
