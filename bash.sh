#!/bin/bash
## A better bash. Written by 12ants.github.io
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
export PAGER='batcat'; 
#export GCC_COLORS='error=01;31:warning=01;35:note=01;36:caret=01;32:locus=01:quote=01'  
PROMPT_COMMAND="history -a; history -c; history -r; $PROMPT_COMMAND"
## load alias and functions 
. $ants/alias.sh; 
[ -e $ants/functions ] && for i in $ants/functions/*; do . $i; done; 
###### <SSH> ######
#[ -n "$SSH_CONNECTION" ] && shsh=($SSH_CONNECTION) &&
#printf "$c2$dim \e[2;32mssh$re from$re: $cyan${shsh[0]}$re to$re $cyan${shsh[2]}$re:$cyan${shsh[3]}\n\e[0m"; 
###################
koko() { hh=$(date +%H); mm=$(date +%M); 
echo -ne "\e7\e[1;$(($COLUMNS/2-4))H \e[0m\e[40m  ${hh}\e[2m:\e[0;40m${mm}  \e[0m\e8"; 
} 
jojo() { while true; do 
echo -ne "\e7\e[1;$(($COLUMNS/2-4))H \e[1;105m         \e[0m\e8"; sleep 1;
koko; sleep 60; done 
} 
jojo & disown; 
echo;
printf "\e[11;4H"; $ants/sh/q/iplocal.sh 
printf "\e[11;20H"; $ants/sh/q/mac.sh 
printf "\e7\e[11;40H\e[96m $(curl -s ip.me -4)\e[0m\e8" & disown 
#fortune|batcat -ppl c#
echo;
####################
PS1='\e[0m\e[40m\e[2;3m\t\e[40m\e[1;36m\u\e[40;2;33m\H\e[32m\w\e[0m\n'

