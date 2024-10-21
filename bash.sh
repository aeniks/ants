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
ip6=$(timeout 1 curl icanhazip.com -s6 & disown); 
ip_loc=$(ifconfig 2>/dev/null|grep 4163 -A1|cut -f10 -d" "|tail -n1); 
#ip_mac=$(ifconfig 2>/dev/null|grep "ether"|cut -f10 -d" "); 
sshc=($SSH_CLIENT); 
# Add this to .bashrc or .zshrc or its equivalent
transfer(){ if [ $# -eq 0 ];then echo "No arguments specified.\nUsage:\n transfer <file|directory>\n ... | transfer <file_name>">&2;return 1;fi;if tty -s;then file="$1";file_name=$(basename "$file");if [ ! -e "$file" ];then echo "$file: No such file or directory">&2;return 1;fi;if [ -d "$file" ];then file_name="$file_name.zip" ,;(cd "$file"&&zip -r -q - .)|curl --progress-bar --upload-file "-" "https://transfer.sh/$file_name"|tee /dev/null,;else cat "$file"|curl --progress-bar --upload-file "-" "https://transfer.sh/$file_name"|tee /dev/null;fi;else file_name=$1;curl --progress-bar --upload-file "-" "https://transfer.sh/$file_name"|tee /dev/null;fi;}
# Now you can use transfer function
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
# [ -e "/usr/bin/gcalcli" ]&& 
# printf "$re${dim}··········$re\n"; 
# date="$(date)"; 
# printf "\e7\e[4;64H\e[2;37m${date}\e8\e[0m"; 
# [ "${SSH_CLIENT}" ] && 
# gcalcli remind 66 & disown; 
[ -e "/bin/gcalcli" ]&& gcalcli remind --use-reminders 66 'notify-send -a "'"$(date)"'" -u "normal" -t "6666" "%s" '& disown; 
printf "$re$dim$(fortune)\n"; 
printf "$re··········\n"; 
printf "\e[A$(cat $HOME/calagenda.sh)"; 
printf "$re··········\n"; 
[ -e /sys/devices/virtual/dmi/id/product_family ]&& printf "$blue$(cat /sys/devices/virtual/dmi/id/product_sku;) $re\n"; 
printf "$re··········\n";
[ "${SSH_CLIENT}" ] && printf "$re$red${sshc}$re >> "; 
printf "$cyan$me$re@$pink$HOSTNAME$re | $cyan$ip4$re | $blue$ip_loc$re\n"; 
printf "$re··········\n${dim}"; 
date;
printf "$re··········\n"; 
####


(timeout 6 ssh aa@ants.ftp.sh "gcalcli --locale sv_SE.UTF-8 --calendar leonljunghorn@gmail.com agenda --military"& disown) > $HOME/calagenda.sh
[ "$LF_LEVEL" ]&& printf "\n\e[0;91m -- LF_LEVEL\e[0m=$LF_LEVEL\n"; 
PS1=''$re'\e[2;3m\t '$re$cyan$me$re'@\e[35;40m\H\e[34m $PWD/\e[0m\n'







