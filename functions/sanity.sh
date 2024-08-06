#!/bin/bash
sanity() { c2="$(echo -e "\e[36m --\e[0m")"; echo; [ $1 ]&& 
cd $1; read -n1 -rep "$c2 Sanitize $cyan$PWD$re
$c2 [${cyan}c${re}]heck changes? " -i "c" "check"; 
if [ $check = "c" ]; then read -rep "$c2 max-depth? " -i "1" "md";
echo -e "\e[31m"; find ./ -maxdepth $md -type f|grep "[ {}()'']"|cat|tee tmpfl| \
while read ff; do 
echo -e "$ff\e[32m >> "$(echo -e "\e[36m$ff"|sed "s/ /_/g"|sed "s/[{}()\'~,]//g")""; 
echo -ne "\e[31m"; done; 
read -n1 -rep "$c2 Are these changes ok? ${red}n ${re}/${green} y " "baba"; fi; 
if [ $baba = "y" ]; 
then cat tmpfl|while read fa; do mv -nv "$fa" "$(echo $fa |sed "s/ /_/g"| \
sed "s/[{}()\'~,]//g")"; done; fi; echo -e "ok"; ls; }
