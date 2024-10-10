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
####################################################################
[ "$PREFIX" ]&& alias ipa='ip -c a'; [ "$PREFIX" ]&& alias ipa='ifconfig'; 
#[ -e "/bin/neofetch" ]&& neofetch;
#[ -e "$PREFIX/bin/fastfetch" ]&& fastfetch;
################################# NEOFETCH #########################
#PROMPT_COMMAND="history -a; history -c; history -r; $PROMPT_COMMAND"
## load alias and functions 
. $ants/alias.sh; 
[ -e $ants/functions ] && for i in $ants/functions/*; do . $i; done; 
###### <SSH> ######
###################
# koko() { hh=$(date +%H); mm=$(date +%M); echo -ne "\e7\e[1;$(($COLUMNS/2-4))H \e[0m\e[40m  ${hh}\e[2m:\e[0;40m${mm}  \e[0m\e8"; } 
# jojo() { while true; do echo -ne "\e7\e[1;$(($COLUMNS/2-4))H \e[1;105m         \e[0m\e8"; sleep 1; koko; sleep 59; done }; jojo & disown; 
##bs(){ for b in ${BASH_CMDS[@]}; do printf "\e[2m\e[38;5;$((RANDOM%8+$RANDOM%2));7m ${b##**/} \e[0m "; done; }; 
##works
##\e7\e[H\e[2K\e[44m\n\e[H$(date +%)\e[2;40m ${BASH_COMMAND} \e8
#printf "\e[96m"; figlet -c -f Big_Money-ne "h e l_ l_ o" 2>/dev/null|batcat -ppfl Zig 2>/dev/null; 
# bs=(${BASH_CMDS[@]} ${BASH_COMMAND[@]})
#bs=(cmds $(printf "(${BASH_CMDS[@]} ${BASH_COMMAND[@]})"|batcat -ppfl d));
#printf "${bs[*]}"
#################################################
#################################################
## GET IP:S #####################################
ip_pub=($(timeout 2 curl -s ipinfo.io|tr -d ',}{"" '& disown;))
ip_loc=$(ifconfig 2>/dev/null|grep 4163 -A1|cut -f10 -d" "|tail -n1);
#################################################
## COLORS -- VARIABLES ##########################
key='\e[30m'; red='\e[31m'; green='\e[32m';
yellow='\e[33m'; blue='\e[34m'; pink='\e[35m';
cyan='\e[36m'; white='\e[37m'; rev='\e[7m';
re='\e[0m'; bold='\e[1m'; dim='\e[2m'; og='\e[8m'; 
csys="$(uname --kernel-name --kernel-release --operating-system --machine)"
# csys="$(uname --kernel-name --kernel-release --operating-system --machine|batcat -ppf --language nim)"

[ "$UID" = "0" ]&& ss="\e[0;41m\e[32m"; me=$(whoami); uc="\e[48;5;16${UID:(-1)}m"; yo="${uc}$ss${me}"; 
## $dim$(id --groups -n)$re
##################################################
## SYSTEM // INFO ################################
printf "$csys$re$dim | $re$red$TERM$re$dim | $white$SHELL $re
$cyan$USER$re@$pink$HOSTNAME$re//$dim$yellow${ip_pub[4]}$re//$dim$green${ip_pub[2]}$re//$dim$blue${ip_pub[3]}$re\n\n"; 
## QUOTES!! ######################################
#printf " \t\t >_< \n\n"; 
#quotes||apt install fortune; 
####
if [ "$TERMUX_APP_PID" ]; then 
a_manu="$(getprop ro.product.manufacturer)"; 
a_cpu="$(getprop ro.product.cpu.abi)"; 
a_vers="$(getprop ro.product.build.version.release_or_codename)"; 
a_model="$(getprop ro.product.model)"; 
a_device="$(getprop ro.product.device)"; 
printf "\n$a_manu [${a_model}] -- build: ${a_device} [${a_vers}] -- cpu $a_cpu -- \n\n";  
else hostnamectl; fi
##################################################
## IP;S !! #######################################
printf "$re\n\n$blue${ip_pub[0]:3}$re\n$cyan$ip_loc$re\n";
[ "$SSH_TTY" ]&& printf "\e[0m\e[36m$SSH_CONNECTION\e[0m\n"

##################################################

[ "$LF_LEVEL" ]&& printf "\e[7;97m -- LF_LEVEL -- \e[0m=$LF_LEVEL\n"; 
# for i in {1..6}; do printf "  \e[1C\e[$((COLUMNS-12))G\e[2;4${i}m $i "; read -t1 -n1 -srep " " dd; [ -n "$dd" ]&& return 0; done; 
# printf "\n\n\e[2A -- welcome! $dim[${re}x${dim}]$re to $blue$SHELL $re//$red$TERM$re$dim !! \n\n"; rere=x; read -t6 -srep " " -n1 "rere"&& 
# [ "$rere" != "x" ]&& neofetch& disown;
# [ "$rere" = "x" ]&& [ $DISPLAY ]||startx 2>/dev/null; 
ghuser="aeniks"; ghmail="leon@12ants.com"
export TERM="xterm-256-color"
PS1='\e[0m\e[2;3m\t\e[36;30;2m|'${yo}'\e[0;2;40m@\e[35;40m\H\e[48;5;224m\e[34m$PWD/\e[0m\n'
####



