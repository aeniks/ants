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
export PAGER='batcat -p';
export GCC_COLORS='error=01;31:warning=01;35:note=01;36:caret=01;32:locus=01:quote=01'
##############################################################
## load alias and functions 
. $ants/alias.sh; 
[ -e $ants/functions ] && for i in $ants/functions/*; do . $i; done; 
#################################################
## GET IP:S #####################################
[ "$LF_LEVEL" ]&& printf "\n\e[0;91m -- LF_LEVEL\e[0m=$LF_LEVEL\n"; 
ip4=$(timeout 1 curl ip.me -s4 & disown); 
ip6=$(timeout 1 curl ip.me -s6 & disown); 
ip_loc=$(ifconfig 2>/dev/null|grep 4163 -A1|cut -f10 -d" "|tail -n1); 
ip_mac=$(ifconfig|grep "ether"|cut -f10 -d" "); sshc=($SSH_CLIENT); 
# ip_pub=($(timeout 2 curl -s ipinfo.io|tr -d ',}{"" '& disown;))
#################################################
## COLORS -- VARIABLES ##########################
key='\e[30m'; red='\e[31m'; green='\e[32m'; ee='echo';
yellow='\e[33m'; blue='\e[34m'; pink='\e[35m';
cyan='\e[36m'; white='\e[37m'; rev='\e[7m'; nn='\e[B'
re='\e[0m'; bold='\e[1m'; dim='\e[2m'; og='\e[8m'; me="$(whoami)"
[ -z "$TERMUX" ]&& nn='\n'; 
##########################
##################################################
## SYSTEM // INFO ################################
#########################
########
if [ "$(id -u)" -eq 0 ]; then s=' '; 
elif [ "$TERMUX" ]; then s=' '; else export s='sudo'; fi; 
########
printf "\n"; date; 
printf "$re${dim}··········\n"; 
uname --kernel-name --kernel-release --kernel-version; 
printf "$re${dim}··········$re"; 
printf "\n$re${BASH_ARGV0/#*\/}$dim $BASH_VERSION$re | $red$TERM "; 
printf "\n$re${dim}··········$re"; 
[ "${SSH_CLIENT}" ] && printf "$re $red${sshc}:$dim${sshc[2]}$re >> "; 
printf "\n$cyan$ip4$re | $blue$ip_loc$re"; 
printf "\n$re${dim}··········"; 
printf "\n$cyan$me$re@$pink$HOSTNAME$re"; 
printf "\n$re${dim}··········$re\n\n"; 
PS1=''$re'\e[2;3m\t '$re$cyan$me$re'@\e[35;40m\H\e[34m $PWD/\e[0m'$nn''
