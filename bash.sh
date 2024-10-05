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
jojo() { while true; do echo -ne "\e7\e[1;$(($COLUMNS/2-4))H \e[1;105m         \e[0m\e8"; sleep 1; koko; sleep 59; done } 
jojo & disown; 
#printf "\e[96m"; figlet -c -f Big_Money-ne "h e l_ l_ o" 2>/dev/null|batcat -ppfl Zig 2>/dev/null; 
if [ -z $PREFIX ]; then alias ipa='ip -c a'; [ -e "/bin/neofetch" ]&& neofetch; 
else alias ipa='ifconfig'; [ -e "$PREFIX/bin/fastfetch" ]&& fastfetch; fi; 
# getprop ro.product.system.model 2>/dev/null; hostnamectl& disown 2>/dev/null; 
printf "\e[2;97m"; date +%^A" "%d" "%^B" "%Y" $(printf "\e[0m- \e[0;1;96m")"%T; printf "\e[0;1m"; 
uname --kernel-name --kernel-release --operating-system --machine; 
ip_pub=$(timeout 2 curl ip.me -s4 & disown); 
ip_loc=$(ifconfig 2>/dev/null|grep 4163 -A1|cut -f10 -d" "|tail -n1); 
blue='\e[34m'; re='\e[0m'; cyan='\e[36m'; pink='\e[35m'; green='\e[32m'; red='\e[31m'; 
if [ $(id -u) != 1000 ]; then me="$blue$USER$re"; 
elif [ $(id -u) = 0 ]; then me="$red$USER$re"; 
else me="$cyan$USER$re"; fi; 
printf "$blue$ip_pub$re - $cyan$ip_loc$re   $SSH_CLIENT
$me$re @ $green$HOSTNAME$re - $red$TERM$re\e[2;97m\n"; 
#fortune|batcat -ppl c# date +%A" "%B" "%F" "%T 
####################
PS1='\e[0m\e[2;3;40m\t'${me}'\e[0;1;40m@\e[0;2;35;40m\H\e[32m$PWD\e[0m\n'
