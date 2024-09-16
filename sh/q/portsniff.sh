#!/bin/bash
#portsniff
portsniff() {
ipl=($(ip -c n|cut -f1 -d " ")); 
ip=$(timeout 4 curl ip.me -4 2>/dev/null;);
ipr=$(host $ip)
if [ $1 ]; then 
ia=${1}; 
ib=${2}; 
else 
ia='1'; 
ib='65555'; 
fi; 
#echo -e "\n\n$c2 portscanner\npublic ip: \n$green$ip$re \n--\nlocal ips: \n\n"; 
printf '%s\n' "

$c2 portscanner
--
public ip:
$green$ip$re
--
local: 
${ipl[@]}$re

";
read -rep "$c2 ip: " -i "$ip" "ip"; 
echo -e "${c2}\e[5m scanning ports\e[0m $red$ia$re - $green$ib$re on $cyan $ip $re
($dim$ipr$re)\n\n";
for port in $(seq $ia $ib); 
do timeout 0.01 bash -c "</dev/tcp/$ip/$port" &&\
echo -ne "\n${re}[$ip${dim}:$re$green$port$re] is open\e[0K"||\
echo -e "\e[42G\e[2;35;46m ${port} \e[1A\e[42G\e[40m       \r\r"; done
}
portsniff
