#!/bin/bash
sanity() { c2="$(echo -e "\e[36m --\e[0m")"; [ $1 ]&& 
cd $1; read -n1 -rep "$c2 Sanitize $cyan$PWD$re
$c2 fast[f]orward? or [${cyan}c${re}]heck first?" "kjda"; 
if [ $kjda = "c" ]; then echo -e "\e[31m"; find ./ -type f | grep "[ {}()'']"|cat -n | \
while read n f; do echo -e "$f\e[32m ==>> "$(echo -e "\e[36m$f" |sed "s/ /_/g"| \
sed "s/[{}()\'~,]//g")""; echo -ne "\e[31m"; done; 
read -n1 -rep "$c2 Are these changes ok? n / ${green}y " "baba"; 
fi; if [ $baba = "y" ]; then find ./ -type f | cat -n | \
while read n f; do mv -nv "$f" "$(echo $f |sed "s/ /_/g"| \
sed "s/[{}()\'~,]//g")"; done; fi; echo -e "ok";}
