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
export BROWSER='google-chrome'; 
export BROWSER_CLI='links2'; 
export GCC_COLORS='error=01;31:warning=01;35:note=01;36:caret=01;32:locus=01:quote=01'
##############################################################
## load alias and functions 
# alias fix-opera='sudo ~root/.scripts/fix-opera.sh' # Opera fix HTML5 media
export PROMPT_COMMAND="history -a; history -n;"; 
######## NVM
export NVM_DIR="$HOME/.nvm"
alias nvm_initzz='[ -s "$NVM_DIR/nvm.sh" ] && \. "$NVM_DIR/nvm.sh"; [ -s "$NVM_DIR/bash_completion" ] && \. "$NVM_DIR/bash_completion"'
#################################################
## GET IP:S #####################################
# ip6=$(timeout 1 curl icanhazip.com -s6 & disown); 
# ip_loc=$(ifconfig 2>/dev/null|grep 4163 -A1|cut -f10 -d" "|tail -n1); 

#ip_mac=$(ifconfig 2>/dev/null|grep "ether"|cut -f10 -d" "); 
# ip_pub=($(timeout 2 curl -s ipinfo.io|tr -d ',}{"" '& disown;))
#################################################
## COLORS -- VARIABLES ##########################

ee='echo';
key="$(printf "\e[30m";)"; 
red="$(printf "\e[31m";)"; 
green="$(printf "\e[32m";)"; 
yellow="$(printf "\e[33m";)"; 
blue="$(printf "\e[34m";)"; 
pink="$(printf "\e[35m";)";
cyan="$(printf "\e[36m";)"; 
white="$(printf "\e[37m";)"; 
rev="$(printf "\e[7m";)"; 
re="$(printf "\e[0m";)"; 
bold="$(printf "\e[1m";)"; 
dim="$(printf "\e[2m";)"; 
c2="$(printf "\e[0m\e[36m--\e[0m")"; 
invis="$(printf "\e[8m")"; 
me="$(id -nu)"; 
#e='\e'; 
##########################
##################################################
# [ "${SECONDS}" -gt "90" ]&& systemd-analyze|batcat -ppflzig;

## SYSTEM // INFO ################################
#########################
########
# if [ "$(id -u)" -gt "0" ]; then export s=' '; 
# elif [ $(echo $HOME|grep "termux") ]; then alias sudo=' '; export s=' '; nn='\n'
# else export s='sudo'; fi; 
########
# 
# date; #### begin printf here ################
# printf "$re${dim}··········$yellow\n"; 
# uptime|cut -c2-; 
# printf "$re${dim}··········\n";  
# qqkrel="$(uname --kernel-release)"; qqkvers="$(uname --kernel-version)"; 
# qqkname="$(uname --kernel-name)"; qqos="$(uname --operating-system)"; 
# qqarch="${BASH_VERSINFO[-1]}"; qqterm="${TERM}"; sep='\e[0m -\e[2m';
[ -z "${ants}" ]&& read -rp "ants: " -i "$PWD" "ants"; 
[ -z "${ants}" ]&& ( printf "export ants=$ants >> ~/.bashrc; "; printf %b "export ants=$ants\n" ) >> ~/.bashrc; 
. $ants/alias.sh; 
# [ -e $ants/functions ] && for i in $ants/functions/*; do . $i; done; 
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
# if [ -e "${PREFIX}/bin/figlet" ]; then ff=$(figlist|shuf -n1); printf "\n\n$ff\n\n"; 
# figlet -c -f "$ff" "_Hello"|batcat -ppfl zig 2>/dev/null; 
# printf "\n\n"
# fi; 
tty="$(tty)"; 
tty="${tty:(-1):1}"; 
[ "$PREFIX" ]&& model=($(getprop ro.product.model))&& \
[ -z "${HOST}" ]&& HOST="$(uname --kernel-name --kernel-release);";  
[ -e /sys/devices/virtual/dmi/id/product_family ]&& \
model=($(cat /sys/devices/virtual/dmi/id/product_sku /sys/devices/virtual/dmi/id/board_vendor /sys/devices/virtual/dmi/id/bios_vendor|sort|uniq -u|tr '\n' ' '))
[ "$(uptime -p|tr -d '[:alpha:] ,:')" -lt 6 ] && (systemd-analyze|batcat -ppflzig; echo;echo;); 
# printf "$re··········\n"; )

# printf "\e7\e[4;64H\e[2;37m${date}\e8\e[0m"; 
# [ "${SSH_CLIENT}" ] && 
# gcalcli remind 66 "notify-send -a "$(date)" -u "normal" -t "6666" "%s" "& disown; 
# gcalcli remind 66 & disown; 
#tty=${tty##*/}
# printf "$dim$(date -R)$re | $dim$(uptime -p)\n"; 
# printf "$re\nhello\n$re··········\n\e[7m"; 
########cat ~/logs/gcalagenda.sh
###############################################
###############################################
[ "${tty}" -lt "4" ]&& [ -e "/bin/gcalcli" ]&& [ "$me" = "aa" ]&& \
timeout 6 gcalcli remind --locale='sv_SE.UTF-8' "166" "notify-send -a ""'$(date)'"" -u "normal" -t "6666" ""'%s'"" " 2>/dev/null & disown; 
ip4=$(timeout 1 curl icanhazip.com -s4 -L); 
[ "${#ip4}" -gt 22 ] && ip4="nope"; 
iploci="$(ifconfig|grep UP -A1|tail -n1|cut -f10 -d" ";)"; 
iploca="$(ip a|grep UP -A2|tail -n1|cut -f6 -d" ")"
ip_loc=$(ip r|tail -n1|tr " " "\n"|grep "src" -A1|tail -n1)
sshc=($SSH_CONNECTION); 
[ -z "$HOSTNAME" ]&& HOSTNAME="$(uname --kernel-name --kernel-release|tr " ." "_")"; 
[ -z "$HOST" ]&& HOSTNAME="$(uname --kernel-name --kernel-release|tr " ." "_")"; 
# calcurse -d 6 2>/dev/null; 
###############################################
# printf "$re··········\n"; 
printf "\e[40m\e[96m$HOSTNAME\e[1;37m -\e[0m\e[40m\e[2m$(uptime) \n"; 
printf "$re··········\n"; 
printf "$re$dim$(fortune 2>/dev/null)\n$re··········\n$(head -n6 logs/gcalagenda.sh|tail -n+2)";
printf "$re··········\n"; 
printf "$cyan$MACHTYPE$re | $green$TERM$re | $cyan$0 $TERM_PROGRAM$re\n" 
printf "$re··········\n"; 
printf "$green$rev${model[*]}$re\n"; 
printf "$re··········\n";
[ "${SSH_CONNECTION}" ] && \
printf "$re$red${sshc}$re >> "; 
printf "$cyan$me$re@$pink$HOSTNAME$re | $cyan$ip4$re | $blue$ip_loc$re\n"; 
printf "$re··········\n"; 
printf "$dim$(date -R)$re | $re$dim$(uptime -p)\n"; 
printf "$re··········\n"; 
####
####
dawd="$(date +%w)"; dadm="$(date +%d)"; 
damo="$(date +%m)"; daye="$(date +%y)"; 
dahh="$(date +%H)"; damm="$(date +%M)";
[ "$LF_LEVEL" ]&& printf "\n\e[0;91m -- LF_LEVEL \e[0m = $LF_LEVEL\n"; 
PS1='\e[37;41m$model$re$cyan$me$re@\e[45;30m\H\e[34;40m$(pwd)/\e[0m\e[$((COLUMNS-26))G$(date +%d-%m-%y" $(printf \e[9${dawd:(-1)}m)"%^A"$re "%X)\n'
