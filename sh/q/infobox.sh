#!/bin/bash
## info #################################
vader="$(curl -sm2 http://wttr.in/sthlm?format=%l:+%c+%t+/+%f++ & disown)";
if [ "${#vader}" -gt 2 ];then vader="${vader^^}"; vader="${vader:0:(-1)}"; else vader="nothing good on \e[1m):\e[0m "; fi; 
iploc="$(ip route |tail -n1|cut --fields=9 --delimiter=" ")"; ip4="$(curl -4 ip.me -s&)"; 
sleep 2; cl="$((COLUMNS/2-16))"; ln="\e[0;2m -------------------------------------------------"; 
printf "\e7\e[s"; timeout 1 printf "
\e[14;${cl}H$ln
\e[15;${cl}H$ln\e[15;${cl}H$c2 ${vader}
\e[16;${cl}H$ln\e[16;${cl}H$c2 Welcome back $cyan$bold$(id -un) 
\e[18;${cl}H$ln\e[18;${cl}H$c2 Public ip:\e[0;2m - $green$ip4 
\e[17;${cl}H$ln\e[17;${cl}H$c2 Local ip:\e[0;2m -- $blue$iploc 
\e[19;${cl}H$ln\e[19;${cl}H$c2 $bold$cyan$italic$(date +%T)$re$dim --- $pink$(date +%A" $green"%B" $yellow"%D) 
\e[20;${cl}H$ln$re\n"
