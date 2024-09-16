#!/bin/bash
## feeeeeed
urls=($(cat $ants/sh/q/rss/urls.sh)); 
printf " _______________\n ----[urls:]----\n"; 

for i in ${urls[@]}; do 
printf "\n --------------\n ---- \n";
printf "${i}"|cut -c12-44|tr "/." " "|batcat -fppl c++; 
rsstail -u "$i" -1n 4 -NpHZ" ______-- ______-"|tr "-" "\n"|batcat -fppl md; 
done

