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
# alias fix-opera='sudo ~root/.scripts/fix-opera.sh' # Opera fix HTML5 media
# HSTR configuration - add this to ~/.bashrc
# alias hs=hstr                    # hh to be alias for hstr
# export HSTR_CONFIG=hicolor       # get more colors
# shopt -s histappend              # append new history items to .bash_history
# export HISTCONTROL=ignorespace   # leading space hides commands from history
# export HISTFILESIZE=10000        # increase history file size (default is 500)
# export HISTSIZE=${HISTFILESIZE}  # increase history size (default is 500)
# ensure synchronization between bash memory and history file
# export PROMPT_COMMAND="history -a; history -n; ${PROMPT_COMMAND}"
export PROMPT_COMMAND="history -a; history -n;"; 
# function hstrnotiocsti {
#     { READLINE_LINE="$( { </dev/tty hstr ${READLINE_LINE}; } 2>&1 1>&3 3>&- )"; } 3>&1;
#     READLINE_POINT=${#READLINE_LINE}
# }
# # if this is interactive shell, then bind hstr to Ctrl-r (for Vi mode check doc)
# if [[ $- =~ .*i.* ]]; then bind -x '"\C-r": "hstrnotiocsti"'; fi
# export HSTR_TIOCSTI=n
######## NVM
export NVM_DIR="$HOME/.nvm"
[ -s "$NVM_DIR/nvm.sh" ] && \. "$NVM_DIR/nvm.sh"  # This loads nvm
[ -s "$NVM_DIR/bash_completion" ] && \. "$NVM_DIR/bash_completion"  # This loads nvm bash_completion
#################################################
## GET IP:S #####################################
[ "$LF_LEVEL" ]&& printf "\n\e[0;91m -- LF_LEVEL\e[0m=$LF_LEVEL\n"; 
ip4=$(timeout 1 curl icanhazip.com -s4 -L); 
ip6=$(timeout 1 curl icanhazip.com -s6 & disown); 
ip_loc=$(ifconfig 2>/dev/null|grep 4163 -A1|cut -f10 -d" "|tail -n1); 
ip_mac=$(ifconfig|grep "ether"|cut -f10 -d" "); sshc=($SSH_CLIENT); 
# ip_pub=($(timeout 2 curl -s ipinfo.io|tr -d ',}{"" '& disown;))
#################################################
## COLORS -- VARIABLES ##########################
key='\e[30m'; red='\e[31m'; green='\e[32m'; ee='echo';
yellow='\e[33m'; blue='\e[34m'; pink='\e[35m';
cyan='\e[36m'; white='\e[37m'; rev='\e[7m'; nn='0000\n'
re='\e[0m'; bold='\e[1m'; dim='\e[2m'; og='\e[8m'; 
me="$(whoami)"; e='\e'; 
# esc='\1xb'; 
[ "$TERMUX" ]&& nn=$(printf '\n'); 
printf "$HOME"|grep "termux" && PS1=''${PS1}'\n';

#[ "$TMP" ]&& export $TMP; [ -f "$TMP" ]||read -rep 'tmp? ' -i "$PWD" "TMP"; 

##########################
##################################################
## SYSTEM // INFO ################################
#########################
########
if [ "$(id -u)" -gt "0" ]; then export s=' '; 
elif [ $(echo $HOME|grep "termux") ]; then export s=' '; nn='\n'
else export s='sudo'; fi; 
########
printf -v shall "${0/*\//}"; 
printf "\n"; date; 
printf "$re${dim}··········$yellow\n"; 
[ "$s" ]&& $s who --count|tr "\n" "\t"; 
printf "\n$re${dim}··········\n";  
printf "$(uname --kernel-name;)$re | $dim${BASH_VERSINFO[-1]}$re |$dim "; 
uname --kernel-release; uname --kernel-version; 
printf "$re${shall}$dim $BASH_VERSION$re | $red$TERM \n"; 
printf "$re${dim}··········$re\n"; 
[ "${SSH_CLIENT}" ] && printf "\n$re $red${sshc}:$dim${sshc[2]}$re >> "; 
printf "$cyan$ip4$re | $blue$ip_loc$re"; 
printf "\n$re${dim}··········"; 
printf "\n$cyan$me$re@$pink$HOSTNAME$re"; 
printf "\n$re${dim}··········$re\n$(fortune)\n"; 
PS1=''$re'\e[2;3m\t '$re$cyan$me$re'@\e[35;40m\H\e[34m $PWD/\e[0m\n'

