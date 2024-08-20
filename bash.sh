#!/bin/bash
## A better bash. Written by 12ants.github.io
##
## keep on line 5 for sed replacement
export "ants"='/ants'; ants='/ants';
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
export GCC_COLORS='error=01;31:warning=01;35:note=01;36:caret=01;32:locus=01:quote=01'  
export PROMPT_COMMAND="history -a; history -c; history -r; $PROMPT_COMMAND"
. $ants/alias.sh; 
## load alias and functions 
for i in $ants/functions/*; do . $i; done; 
#if [ -e /bin/neofetch ]; then neofetch; fi; 
vader="$(curl -sm2 http://wttr.in/sthlm?format=%l:+%c+%t+/+%f++ & disown)"; 
bath=($(batcat --list-themes|cut -f1 -d:|tr ' ' '_')); 
batl=($(batcat --list-languages|grep ','|tr "," "\n"|grep -v "*"|cut -f2 -d ":"));
batn=$(shuf -en1 ${batl[@]})
bathb=$(shuf -en1 ${bath[@]});
echo -e "
  --------------------
$dim  -- $cyan$dim${batn}$re
$dim  -- $pink$dim${bathb}$re \e[0m\n  --------------------\n"; 
fortune|pr --omit-header --indent=2|batcat --terminal-width $((COLUMNS-6)) --style numbers --theme "${bathb//_/ }" --language ${batn};
timeout -k 1s 2s echo -e "
 $c2 Welcome back $cyan$bold$(id -un)$re
 $c2 Public ip: $green$line$ip4$re 
 $c2 Local  ip: $cyan$line$iploc$re  
 $c2 $pink$(date +%A" $green"%B" $yellow"%D)$re -- $bold$cyan$blink$italic$(date +%T)$re
\t\t\t\t${vader^^} " ;
if [ "$SSH_CONNECTION" ]; then shsh=($SSH_CONNECTION);
echo -e " $c2 $bold"$red"ssh$re from$re: $cyan${shsh[0]}$re to$re $cyan${shsh[2]}$re:$cyan${shsh[3]}$re\n"; fi; echo; 
PS1='\e[0m\e[2;3m\t\e[0m\e[1;36m\u\e[0;2;33m\H\e[0;32m\w\e[0m _ \n'
