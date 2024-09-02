#!bin/bash 
while true; 
do printf "\e7\e[1;$(($COLUMNS/2-4))H\
\e[2;38;5;$((26-$(date +%H)))m$(date +%H)\e[0m:\
\e[2;38;5;$((26-$(date +%H)))m$(date +%M)\e[0m:\
\e[38;5;$(date +%S)m$(date +%S)\e8"; sleep 1; done 
