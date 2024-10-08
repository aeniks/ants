#!/bin/bash
## scan lan & ports!!
#######
lanscan() {
size=($(stty size)); for i in $(seq $((size-8)) ); do echo; done
printf "\e[8H\n\n\t $c2 Scan Local Area Network"; read -n1 -rep "? " "yn"; 
sudo apt install nmap batcat -qy &>/dev/null;
printf "\n\t $c2\e[2m Scanning LAN\e[0m$c2\e[0m\n\n"; host="192.168.0.1"; we=(); for i in $(seq -w 00 12); do ping ${host}${i} -W 1 -qACc1 1>/dev/null&& we+=( "$host$i" )&& printf "\t  \e[48;5;2$((${i:(-1)}*2/7))m${we[@]: -1}\e[0m is \e[2;42mopen\e[0m\n"; done; 
########
########
printf "\n\t\e[0;2m  ----------------\e[0m\n\n\t $c2 Scan open ports on: \n"; for i in ${we[@]}; do 
printf "\n\t  \e[100;3$((${i:(-1)}+1))m$i\e[0m"; 
done; read -n1 -rep " ?" "yn"; echo;
printf "\n\t\e[0;2m  ----------------\e[0m\n\n";
########
for ips in ${we[@]}; do
printf "\n\e[0;2m-- \e[0mScanning\e[0;1m:\e[38;5;20${ips:(-1)}m $ips\e[0;2m --\n";
nmap -sV "$ips"|grep -e "report for" -e "VERSION" -e "open" -e "Info"|batcat -pPf --language "go"
printf "\e[0;2m-----------------------------\n\n\e[0m"; 
done; echo; echo; 
}
alias 12_lanscan='lanscan';
lanscan
