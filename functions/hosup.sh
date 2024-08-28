hosup() {
host="192.168.0.1"; for i in $(seq -w 00 12); do ping ${host}${i} -W 1 -qACc1 &>/dev/null&&
printf "host ${dim}${host}\e[1;4m$i\e[0m is$green up! $re\n"; done; 
aapp=( $(arp -n|grep -v "incomplete"|tail -n+2|cut -f1-2 -d " ") ); 
printf "\n\n$c2 Scan: "; for i in ${aapp[@]}; do printf "\n \e[3$((${i:(-1)}+1))m$i \e[0m"; done; read -rep "? " "yn"; 
####
for ips in ${aapp[@]}; do
printf "\e[1;4;9$((${ips:(-1)}+1));100m    $ips    \e[0m\n";
nmap -sV "$ips"|grep -e "report for" -e "VERSION" -e "open" -e "Info"|batcat -pPf --language "c#"
printf "\e[0;2m\t----\n"; 
done; 
}
