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
#export GCC_COLORS='error=01;31:warning=01;35:note=01;36:caret=01;32:locus=01:quote=01'  
#export PROMPT_COMMAND="history -a; history -c; history -r; $PROMPT_COMMAND"
## load alias and functions 
. $ants/alias.sh; 
[ -e $ants/functions ] && for i in $ants/functions/*; do . $i; done; 
###### <SSH> ######
[ -n "$SSH_CONNECTION" ] && shsh=($SSH_CONNECTION) &&
printf "$c2$dim \e[2;32mssh$re from$re: $cyan${shsh[0]}$re to$re $cyan${shsh[2]}$re:$cyan${shsh[3]}\n\e[0m"; 
###################
PS1='\e[0m\e[2;3m\t\e[0m\e[1;36m\u\e[0;2;33m\H\e[0;32m\w\e[0m\n'
# [ "$BASH" ]&& hey; 
