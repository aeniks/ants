#!/bin/bash
####################################################
## SHOW TIME AWESOMELY #############################
wd="$(date +%^A)"; dt="$(date +%-d)"; mn="$(date +%^B)"
time="$(date +%X)"; date="$(printf " $wd the $dt  $mn  ")"; 
(printf "\e[0m\e[$((LINES/2-6));$((COLUMNS/2-2))H\e[$((${#date}/2))D"; 
for i in $(seq ${#date}); do printf "\e7\e[${i}C\e[48;5;1$((i+RANDOM%44*2))m    \e8"; 
sleep .1; done; echo; printf "\e7\e[0m\e[$((LINES/2-6));$((COLUMNS/2-2))H\e[$((${#date}/2))D"; 
printf "\e[107;40m  $wd \e[2;37m the \e[1;38;5;6${dt};4;7m $dt \e[0m\e[9;40m \e[92m$mn\e[94m  \e[0m"; 
printf "\e[$((LINES/2-5));$((COLUMNS/2-2))H\e[$((${#time}/2))D\e[3;45m  $time  \e[0m\n\n\n\n\e8\n\n\n\n";) & disown; 
#####################################################
#####################################################
