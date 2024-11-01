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
export PAGER='less';
export GCC_COLORS='error=01;31:warning=01;35:note=01;36:caret=01;32:locus=01:quote=01'
##############################################################
## load alias and functions 
. $ants/alias.sh; 
[ -e $ants/functions ] && for i in $ants/functions/*; do . $i; done; 
# alias fix-opera='sudo ~root/.scripts/fix-opera.sh' # Opera fix HTML5 media
export PROMPT_COMMAND="history -a; history -n;"; 
######## NVM
export NVM_DIR="$HOME/.nvm"
[ -s "$NVM_DIR/nvm.sh" ] && \. "$NVM_DIR/nvm.sh"  # This loads nvm
[ -s "$NVM_DIR/bash_completion" ] && \. "$NVM_DIR/bash_completion"  # This loads nvm bash_completion
#################################################
## GET IP:S #####################################
ip4=$(timeout 1 curl icanhazip.com -s4 -L); 
# ip6=$(timeout 1 curl icanhazip.com -s6 & disown); 
ip_loc=$(ifconfig 2>/dev/null|grep 4163 -A1|cut -f10 -d" "|tail -n1); 
#ip_mac=$(ifconfig 2>/dev/null|grep "ether"|cut -f10 -d" "); 
sshc=($SSH_CLIENT); 
# ip_pub=($(timeout 2 curl -s ipinfo.io|tr -d ',}{"" '& disown;))
#################################################
## COLORS -- VARIABLES ##########################
key='\e[30m'; red='\e[31m'; green='\e[32m'; ee='echo';
yellow='\e[33m'; blue='\e[34m'; pink='\e[35m';
cyan='\e[36m'; white='\e[37m'; rev='\e[7m'; nn='0000\n'
re='\e[0m'; bold='\e[1m'; dim='\e[2m'; og='\e[8m'; 
me="$(whoami)"; e='\e'; 
##########################
##################################################
# [ "${SECONDS}" -gt "90" ]&& systemd-analyze|batcat -ppflzig;

## SYSTEM // INFO ################################
#########################
########
if [ "$(id -u)" -gt "0" ]; then export s=' '; 
elif [ $(echo $HOME|grep "termux") ]; then export s=' '; nn='\n'
else export s='sudo'; fi; 
########
# 
# date; #### begin printf here ################
# printf "$re${dim}··········$yellow\n"; 
# uptime|cut -c2-; 
# printf "$re${dim}··········\n";  
# qqkrel="$(uname --kernel-release)"; qqkvers="$(uname --kernel-version)"; 
# qqkname="$(uname --kernel-name)"; qqos="$(uname --operating-system)"; 
# qqarch="${BASH_VERSINFO[-1]}"; qqterm="${TERM}"; sep='\e[0m -\e[2m';
# qqshell="${SHELL/*\//}"; qqshell="$(printf "${qqshell^^}$sep $BASH_VERSION")"; 
# printf "$dim$qqkvers \n$qqshell$sep $qqarch\n$qqkname $qqkrel$sep $qqos$sep $re$red$qqterm\n"; 
# printf "$re${dim}··········$re\n"; 
# model="$(getprop ro.product.model ro.product.model ro.build.version.min_supported_target_sdk ro.build.version.sdk ro.product.abilist ro.product.name ro.soc.manufacturer ro.soc.model gsm.sim.operator.alpha 2>/dev/null )"; 
# printf "$re${dim}··········\n";  
# [ -e "/etc/os-release" ]&& OOSS=($(cat "/etc/os-release"|tr " " "_"|tr -d '""'));
# for i in ${!OOSS[@]}; do printf -v "OS_${OOSS[i]/=*}" "${OOSS[i]/*=}"; done 
# printf "$green${OS_ID_LIKE^} ${OS_ID^} ${OS_VERSION}\n";
# printf "$re${dim}··········\n";  
##cat ~/neocache.sh 2>/dev/null||neofetch 
tty="$(tty)"; tty="${tty:(-1):1}"
[ "$PREFIX" ]&& model="$(getprop ro.product.system.model;)";  
[ -e /sys/devices/virtual/dmi/id/product_family ]&& \
model="$(cat /sys/devices/virtual/dmi/id/product_sku /sys/devices/virtual/dmi/id/board_vendor /sys/devices/virtual/dmi/id/bios_vendor|sort|uniq|tr '\n' ' ')"
# [ -e "/usr/bin/gcalcli" ]&& 
# printf "$re${dim}··········$re\n"; 
# date="$(date)"; 
[ "$(uptime -p|tr -d '[:alpha:] ,:')" -lt 6 ] && (systemd-analyze|batcat -ppflzig;  
printf "$re··········\n"; )

# printf "\e7\e[4;64H\e[2;37m${date}\e8\e[0m"; 
# [ "${SSH_CLIENT}" ] && 
# gcalcli remind 66 "notify-send -a "$(date)" -u "normal" -t "6666" "%s" "& disown; 
# gcalcli remind 66 & disown; 
#tty=${tty##*/}
# printf "$dim$(date -R)$re | $dim$(uptime -p)\n"; 
printf "$re\n\nhello\n$re··········\n\e[7m"; 
########
###############################################
###############################################
[ "${tty}" -lt "4" ]&& [ -e "/bin/gcalcli" ]&& timeout 6 gcalcli remind --locale='sv_SE.UTF-8' "166" "notify-send -a ""'$(date)'"" -u "normal" -t "6666" ""'%s'"" " 2>/dev/null & disown; 
# calcurse -d 6 2>/dev/null; 
###############################################
# printf "$re··········\n"; 
[ "${tty}" -lt "4" ]&& printf "$re$dim$(fortune 2>/dev/null)\n$re··········\n\e[A$(cat $HOME/calagenda.sh)"; 
printf "$re··········\n"; 
printf "$cyan$MACHTYPE$re | $green$TERM$re | $cyan$0 $TERM_PROGRAM$re\n" 
printf "$re··········\n"; 
printf "$green$rev${model[*]}$re\n"; 
printf "$re··········\n";
[ "${SSH_CLIENT}" ] && \
printf "$re$red${sshc}$re >> "; 
printf "$cyan$me$re@$pink$HOSTNAME$re | $cyan$ip4$re | $blue$ip_loc$re\n"; 
printf "$re··········\n"; 
printf "$dim$(date -R)$re | $re$dim$(uptime -p)\n"; 
printf "$re··········\n"; 
####
####
[ "${tty}" -lt "4" ]&& (timeout 6 ssh aa@ants.ftp.sh "timeout 6 gcalcli --locale sv_SE.UTF-8 --calendar leonljunghorn@gmail.com agenda --military" 2>/dev/null & disown) > $HOME/calagenda.sh
[ "$LF_LEVEL" ]&& printf "\n\e[0;91m -- LF_LEVEL \e[0m = $LF_LEVEL\n"; 
PS1=''$re'\e[2;3m\t '$re$cyan$me$re'@\e[35;40m\H\e[34m \w/\e[0m\n'
