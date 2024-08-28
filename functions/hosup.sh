#!/bin/bash
## scan lan & ports!!
lanscan() {
size=($(stty size)); for i in $(seq $((size-8)) ); do echo; done
printf "\e[12H\t$c2 Scan Local Area Network"; read -n1 -rep "? " "yn"; 
printf "\e[2m\n\t$c2 Scanning LAN \e[0m\n"; host="192.168.0.1"; we=(); for i in $(seq -w 00 22); do ping ${host}${i} -W .1 -qACc1 1>/dev/null&& we+=( "$host$i" )&& printf "\t\e[48;5;2$((${i:(-1)}*2/7))m${we[@]: -1}\e[0m is \e[2;42mopen\e[0m\n"; done; echo;
printf "\n\t $c2 Scan open ports on: "; for i in ${we[@]}; do 
printf "\n\t\e[100;3$((${i:(-1)}+1))m$i\e[0m"; 
done; 
read -n1 -rep " ?" "yn"; 
nmap -sV "$ips"|grep -e "report for" -e "VERSION" -e "open" -e "Info"|batcat -pPf --language "c#"
printf "\e[0;2m\t----\n"; 
done; 
}
alias 12_lanscan='lanscan';
