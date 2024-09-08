#!/bin/bash
## transfer over lan via rsync
zynka() { printf "\n\n\n\n\n\e[4A  rsync \e[36m/ants\e[0m to \e[35m192.168.0.100:~/ \e[0m--exclude "'".git"'" -av \n\n"; 
read -n1 -srp '  [Y/n]' 'kk'; [ "$kk" != "" ] && printf "\e[32m   ok\n\n" && return;
echo;
read -rep '  ip:' -i 'aa@192.168.0.100' 'zynkaip'; 
read -rep '  port:' -i '22' 'zport'; 
printf "\e[32m ok"; 
rsync /ants -e "ssh -p $zport" ${zynkaip}:~/ --exclude ".git" -av; 
printf "\e[0m\n  ok\n"; }; 
