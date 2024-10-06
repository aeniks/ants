#!/bin/bash
## selection menu 
q() { op=($2);[ "$2" ]||op=(*); pp="$1" q="0" c="${#op[@]}"; 
f='    '; printf "\e[?25l$f\e[2m-----\e[0m "$pp""; while true; 
do x="0"; for o in "${op[@]}"; do [ $x = $q ]&& printf "\n > \e[7m $o \e[0m"; 
[ $x = $q ]||printf "\n$f$o  "; ((x++)); done; printf "\n$f\e[2m-----\e[0m";
read -sn1 k; case $k in A) ((q--)); ((q<0))&& ((q=0));;
B) ((q++)); ((q>=c))&& ((q=c-1));; "") break;; 
q) printf "\e[0m\e[?25h < \n"; return;; esac; printf "\e[$((${c}+1))A"; done; 
printf -v s "${op[$q]}"; printf "\e[?25h\n   \e[7m $s \e[0m\n"; }; 
