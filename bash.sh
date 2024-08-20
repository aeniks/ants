#!/bin/bash
## A better bash. Written by 12ants.github.io
################################
################ _do nothing if not interactive
export "ants"='/ants'; ants='/ants';
################ keep on line 5 for sed replacement
case $- in
*i*) ;;
*) return;;
esac
if ! shopt -oq posix; then if [ -f /usr/share/bash-completion/bash_completion ]; 
then . /usr/share/bash-completion/bash_completion; elif [ -f /etc/bash_completion ]; 
then . /etc/bash_completion; fi; fi; 
export EDITOR='micro'; export GCC_COLORS='error=01;31:warning=01;35:note=01;36:caret=01;32:locus=01:quote=01'  
export RANGER_LOAD_DEFAULT_RC=FALSE; RANGER_LOAD_DEFAULT_RC=FALSE; 
shopt -s histappend;                      # append to history, don't overwrite it
alias zz='ranger --choosedir=OUTFILE';
################################
############# _COLORS ##########
e='echo -e '; bold=$($e'\e[1m';); dim=$($e'\e[2m';); italic=$($e'\e[3m';); 
underline=$($e'\e[44m';); blink=$($e'\e[45m';); rev=$($e'\e[47m';); invis=$($e'\e[8m';); 
strike=$($e'\e[9m';); blank=$($e'\e[0;30m';); red=$($e'\e[0;31m';); green=$($e'\e[0;32m';); 
yellow=$($e'\e[0;33m';); blue=$($e'\e[0;34m';); pink=$($e'\e[0;35m';); cyan=$($e'\e[0;36m';); 
white=$($e'\e[0;37m';); re=$($e'\e[0m';); c2=$($e'\e[36m --\e[0m';); 
################################
alias coolers='grep -m1 -wA6 --colour "_COLORS" $ants/bash.sh;'
################################
################################
################ _functions
LFRC="$ants/sh/config/lfrc.sh"; if [ -e /bin/lf ]; then bind '"\C-o":"lfcd\C-m"'; 
alias l='cd $(lf -config $LFRC -print-last-dir )';
lfcd() { cd "$(command lf -config $LFRC -print-last-dir "$@")"; } fi; 
cd() { builtin cd "$@" && ls --hyperlink -hltrp --color=always --group-directories-first; 
echo -e '\e[36m'; pwd; }
################################
################ _alias
alias 11='kdeconnect-cli -d "fb1c649a_3a0c_4297_ae12_b0cf5cb558b8" --ring'; 
m11='fb1c649a_3a0c_4297_ae12_b0cf5cb558b8'; 
alias mm='micro';
alias qq='cd ..; ll';
alias ee='echo ';
alias ll='ls --hyperlink -hltrp --color=always --group-directories-first'; 
alias la='ls --hyperlink -Ahltrp --color=always --group-directories-first; pwd'; 
alias 'sl_cc@192.168.0.105'='ssh cc@192.168.0.105'
alias 'sl'='ssh aaaa@ants.ftp.sh'; 
alias m11='ssh -p 8022 192.168.0.105'
#iploc="$(ip a|head -n 12|tail -n 4|grep "inet "|tr -s "[:alpha:] /\n" " \n"|head -n2|tail -n1 2>/dev/null)"; 
iploc="$(ip route |tail -n1|cut --fields=9 --delimiter=" ")"; ip4="$(curl -4 ip.me -s&)"; 
################ _variables
alias nvm_init='export NVM_DIR="$([ -z "${XDG_CONFIG_HOME-}" ] && printf %s "${HOME}/.nvm" \
|| printf %s "${XDG_CONFIG_HOME}/nvm")"; [ -s "$NVM_DIR/nvm.sh" ] && \. "$NVM_DIR/nvm.sh"; ';
################################
#env=~/.ssh/agent.env
#agent_load_env () { test -f "$env" && . "$env" >| /dev/null ; }
#agent_start () {
#    (umask 077; ssh-agent >| "$env")
#    . "$env" >| /dev/null ; }
#agent_load_env 2>/dev/null; 
## agent_run_state: 0=agent running w/ key; 1=agent w/o key; 2=agent not running
#agent_run_state=$(ssh-add -l >| /dev/null 2>&1; echo $?)
#if [ ! "$SSH_AUTH_SOCK" ] || [ $agent_run_state = 2 ]; then
#    agent_start
#    ssh-add
#elif [ "$SSH_AUTH_SOCK" ] && [ $agent_run_state = 1 ]; then
#    ssh-add
#fi
#unset env
basicapps=(
micro
openssl
openssh-server
net-tools
lolcat
fortunes
fortune-mod
cowsay
neofetch
mc
btop
gpm
links2
ranger
pv
fortune-mod
tlp
googler
lf
ncdu
)
#######
##########################
#### Welcome screen ######
##########################
####
vader="$(curl -sm2 http://wttr.in/sthlm?format=%l:+%c+%t+/+%f++ & disown)"; 
# qwqw="$(curl -sm2 http://wttr.in/sthlm?format=%l:+%c+%t+/+%f++ & disown)"
. $ants/alias.sh; 
for i in $ants/functions/*; do . $i; done; 
alias 12_='menu "$ants/12"';
#if [ -e /bin/neofetch ]; then neofetch; fi; 
timeout -k 1s 2s echo -e "
 $c2 ${vader^^}
 $c2 Welcome back $cyan$bold$(id -un)
 $c2 Public ip: $green$line$ip4$re 
 $c2 Local  ip: $cyan$line$iploc$re  
 $c2 $pink$(date +%A" $green"%B" $yellow"%D)$re -- $bold$cyan$blink$italic$(date +%T)$re"
if [ "$SSH_CONNECTION" ]; then shsh=($SSH_CONNECTION);
echo -e " $c2 $bold"$red"ssh$re from$re: $cyan${shsh[0]}$re to$re $cyan${shsh[2]}$re:$cyan${shsh[3]}$re\n"; fi; echo; 
#PS1=''$re$blue$dim'\t'$red' \u '$green'\H '$cyan' '$pink'\$ '$re'\n'
export PROMPT_COMMAND="history -a; history -c; history -r; $PROMPT_COMMAND"

PS1='\e[0m\e[2;3m\t\e[0m\e[1;36m\u\e[0;2;33m\H\e[0;32m\w\e[0m _ \n'
