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
koko() { hh=$(date +%H); mm=$(date +%M); echo -ne "\e7\e[1;$(($COLUMNS/2-4))H \e[0m\e[40m  ${hh}\e[2m:\e[0;40m${mm}  \e[0m\e8"; } 
jojo() { while true; do echo -ne "\e7\e[1;$(($COLUMNS/2-4))H \e[1;105m         \e[0m\e8"; sleep 1; koko; sleep 20; done } 
jojo & disown; 
#printf "\e[96m"; figlet -c -f Big_Money-ne "h e l_ l_ o" 2>/dev/null|batcat -ppfl Zig 2>/dev/null; 
beggn() { sleep 2; 
printf "\e[2;$((COLUMNS/2))H\e[1;38;5;67;40m $(timeout 1 lsb_release -ds) \e[0m";  
printf "\e[3;$((COLUMNS/2))H\e[0;2;37;40m $TERM_PROGRAM \e[0;1;97;40m-\e[0;2;37;40m $SHELL \e[0;1;97;40m-\e[0;2;37;40m $TERM \e[0m"; 
printf "\e[4;$((COLUMNS/2))H\e[38;5;24;40m $(ip l|grep --color=never -w link/ether|cut -f6-6 -d " ";) \e[0m"; 
printf "\e[5;$((COLUMNS/2))H\e[92;40m $(date) \e[0m"; 
printf "\e[6;$((COLUMNS/2))H\e[31;40m $(hostname --all-ip-addresses|cut -f1 -d" "
) \e[0;1;97;40m-\e[0;94;40m $(curl -s ip.me -4) \e[0m"; 
printf "\e[7;$((COLUMNS/2))H\e[96;40m $USER \e[97m@\e[95;40m $HOSTNAME \e8"; }; 
#fortune|batcat -ppl c#
beggn & disown; 
printf "\n\e[0m"
####################
PS1='\e[0m\e[40m\e[2;3m\t\e[40m\e[1;36m\u\e[40;2;33m\H\e[32m$PWD\e[0m\e7\n'
