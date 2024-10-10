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
ip4=$(timeout 1 curl ip.me -s4 & disown); 
ip6=$(timeout 1 curl ip.me -s6 & disown); 
ip_loc=$(ifconfig 2>/dev/null|grep 4163 -A1|cut -f10 -d" "|tail -n1); 
ip_mac=$(ifconfig|grep "ether"|cut -f10 -d" "); sshc=($SSH_CLIENT); 
ip_pub=($(timeout 2 curl -s ipinfo.io|tr -d ',}{"" '& disown;))
me="$(whoami)"; 
#################################################
## COLORS -- VARIABLES ##########################
key='\e[30m'; red='\e[31m'; green='\e[32m';
yellow='\e[33m'; blue='\e[34m'; pink='\e[35m';
cyan='\e[36m'; white='\e[37m'; rev='\e[7m';
re='\e[0m'; bold='\e[1m'; dim='\e[2m'; og='\e[8m'; 
[ "$LF_LEVEL" ]&& printf "\e[0;97m -- LF_LEVEL -- \e[0m=$LF_LEVEL\n"; 

## $dim$(id --groups -n)$re
##################################################
## SYSTEM // INFO ################################
#########################
printf "$re${dim}··········\n"; 
uname --kernel-name --kernel-release --kernel-version; 
printf "$re${dim}··········$re\n"; 
# printf "$re${dim}··········$re\n"; 
printf "$cyan$me$re@$pink$HOSTNAME$re | $dim"; date; 
printf "$re${BASH_ARGV0}$dim $BASH_VERSION$re | $red$TERM \n"; 
printf "$re${dim}··········$re\n"; 
printf "$re$blue$ip_loc$re | $cyan$ip4";
[ ${SSH_CLIENT} ]&& printf "\n\e[0m\e[31m${sshc}$re : \e[34m${sshc[2]}\e[0m"
printf "\n$re${dim}··········${re}\n"; 
PS1='\e[0m\e[2;3m\t\e[36;30;2m|'${yo}'\e[0;2;40m@\e[35;40m\H\e[48;5;224m\e[34m$PWD/\e[0m\n'
####



