#!/bin/bash
## A better bash. Written by 12ants.github.io
##
## keep on line 5 for sed replacement
#export "ants"='/ants'; 
#ants='/ants';
## _do nothing if not interactive
case $- in
*i*) ;;
*) return;;
esac
if ! shopt -oq posix; then if [ -f /usr/share/bash-completion/bash_completion ]; 
then . /usr/share/bash-completion/bash_completion; elif [ -f /etc/bash_completion ]; 
then . /etc/bash_completion; fi; fi; 
shopt -s histappend; ## append to history, don't overwrite it
export EDITOR='micro'; 
export GCC_COLORS='error=01;31:warning=01;35:note=01;36:caret=01;32:locus=01:quote=01'  
export PROMPT_COMMAND="history -a; history -c; history -r; $PROMPT_COMMAND"
##[ -e /bin/neofetch ]&& neofetch; 
## load alias and functions 
[ -e $ants/functions ]&&
for i in $ants/functions/*; do . $i; done; 
. $ants/alias.sh; 
vader="hello";
vader="$(curl -sm2 http://wttr.in/sthlm?format=%l:+%c+%t+/+%f++ & disown)";
vader="${vader^^}"; vader="${vader:0:(-1)}" 2>/dev/null; 
## quotes;
## PS1='\e7\e[0;36m\e[H$?\e8\e[2;38m\t\e[0;32m\w\e[0m/'
## PS1='\e7\e[0;36m\e[H$?\e8\e[32m\w\e[0m'
## PS1='\e7\e[H\e[2K\e[42;30m\r\w\e[44G\t\e8\e[0m'
##
## (sleep 2; printf "\e7\e[s"; timeout 1 printf "
## \e[4;$((COLUMNS/2-6))H$c2 ${vader^^}
## \e[5;$((COLUMNS/2-6))H$c2 Welcome back $cyan$bold$(id -un)
## \e[6;$((COLUMNS/2-6))H$c2 Public ip: $green$line$ip4$re 
## \e[7;$((COLUMNS/2-6))H$c2 $pink$(date +%A" $green"%B" $yellow"%D)$re -- $bold$cyan$blink$italic$(date +%T)$re\n\e8"
## if [ "$SSH_CONNECTION" ]; then shsh=($SSH_CONNECTION);
## printf "
## \e[8;$((COLUMNS/2-6))H$c2 $bold"$red"ssh$re from$re: $cyan${shsh[0]}$re to$re $cyan${shsh[2]}$re:$cyan${shsh[3]}$re\n"; 
## fi; printf "\e[u\e8"; 
## ) & disown;
##
. $ants/alias.sh; 
alias zync='~/sync/sanc.sh; ~/sync/sync-cron.sh &'
[ -e $ants/functions/ ]&& for i in $ants/functions/*; do . $i; done; 
[ -e ~/functions.d/ ]&& for i in ~/functions.d/*; do . $i; done; 
###################################
iploc="$(ip route |tail -n1|cut --fields=9 --delimiter=" ")"; ip4="$(curl -4 ip.me -s&)"; 
(sleep 2; cl="$((COLUMNS/2-16))"; ln="\e[0;2m -------------------------------------------------"; 
printf "\e7\e[s"; timeout 1 printf "
\e[14;${cl}H$ln
\e[15;${cl}H$ln\e[15;${cl}H$c2 ${vader}
\e[16;${cl}H$ln\e[16;${cl}H$c2 Welcome back $cyan$bold$(id -un) 
\e[18;${cl}H$ln\e[18;${cl}H$c2 Public ip:\e[0;2m - $green$ip4 
\e[17;${cl}H$ln\e[17;${cl}H$c2 Local ip:\e[0;2m -- $blue$iploc 
\e[19;${cl}H$ln\e[19;${cl}H$c2 $bold$cyan$italic$(date +%T)$re$dim --- $pink$(date +%A" $green"%B" $yellow"%D) 
\e[20;${cl}H$ln$re\n"
if [ "$SSH_CONNECTION" ]; then shsh=($SSH_CONNECTION);
printf "
\e[20;${cl}H$ln\e[20;${cl}H$c2 $bold"$red"ssh$re\
 from$re: $cyan${shsh[0]}$re to$re $cyan${shsh[2]}$re:$cyan${shsh[3]} 
 \e[21;${cl}H$ln$re\n"; fi; 
printf "\e[u\e8";) & disown;
PS1='\e[0m\e[2;3m\t\e[0m\e[1;36m\u\e[0;2;33m\H\e[0;32m\w\e[0m _ \n'
