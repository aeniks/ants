#!/bin/bash
## kloooocalk
klockan() {
dat="$(date +%^A"\e[90;30m|\e[0;2m"%d"\e[90;30m|\e[0;2m"%^B)"; 
da="$((COLUMNS/2-${#dat}/2))"
cm="$((COLUMNS/2-12))"; 
printf "\e7";

break="";
printf "\e7\e[?25l"
while break=""; do
ho="$(date +%H)"; mi="$(date +%M)"; se="$(date +%S)"; ln14="----------------------"; 
############
printf "
\e[$((LINES/2-12));${cm}H\e[38;5;$((${se:1}+22))m${ln14}
\e[$((LINES/2-11));$(($da+14))H\e[2;0;2m $dat
\e[$((LINES/2-10));${cm}H\e[38;5;$((${se:1}/4))m${ln14}
\e[${cm}G\e[38;5;$((2*${se:1}/4))m${ln14}\e[$((cm+6))G\
\e[40;3${ho:1}m ${ho}\e[37m:\e[3${mi:1}m${mi}\e[37m:\e[3${se:1}m${se} \e[0m
\e[${cm}G\e[38;5;$((${se:1}*2-8))m${ln14}\e[0m"; 
read -n1 -t1 -s "break"&& printf "\e8\n\e[?25h"&& break; done; 
}






















colrtable() {
printf "\n\n\t\t \e[36mansii\e[0m: \e[2m"; echo '\e[48;5;0-255m'; printf "\n\e[0m"; o=1; for i in {0..255}; do if sp= ; [ ${#i} -eq 2 ]; then sp=" "; elif [ ${#i} -eq 1 ]; then sp="  "; fi; printf "\e[0;9;48;5;${i}m  $i$sp\e[1;4;30m$o\e[12;3${o}m$o   \e[0m "; o="$((i%8+1))"; [ $o -eq 1 ]&& (((o++)); printf "\e[0m \n";) done; printf "\n\n"
}
