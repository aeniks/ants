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
vader="$(curl -sm2 http://wttr.in/sthlm?format=%l:+%c+%t+/+%f++ & disown)"; 
## bat
quotes;
###################
###################
timeout 1s printf "
 $c2 Welcome back $cyan$bold$(id -un)$re
 $c2 Public ip: $green$line$ip4$re //// $red$ip6$re 
 $c2 Local  ip: $cyan$line$iploc$re ////\
 $dim$(ip -c l|grep -w "link/ether "|cut -f6-6 -d " ";)$re  
 $c2 $pink$(date +%A" $green"%B" $yellow"%D)$re -- $bold$cyan$blink$italic$(date +%T)$re
\t\t\t\t${vader^^} \n" ;
if [ "$SSH_CONNECTION" ]; then shsh=($SSH_CONNECTION);
printf " $c2 $bold"$red"ssh$re from$re: $cyan${shsh[0]}$re to$re $cyan${shsh[2]}$re:$cyan${shsh[3]}$re\n"; fi; echo; 
PS1='\e[0m\e[2;3m\t\e[0m\e[1;36m\u\e[0;2;33m\H\e[0;32m\w\e[0m _ \n'
