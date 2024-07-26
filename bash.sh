#!/bin/bash
## A better bash. Written by 12ants.github.io
################################
################ _do nothing if not interactive
case $- in
*i*) ;;
*) return;;
esac
if ! shopt -oq posix; then if [ -f /usr/share/bash-completion/bash_completion ]; 
then . /usr/share/bash-completion/bash_completion; elif [ -f /etc/bash_completion ]; 
then . /etc/bash_completion; fi; fi; 
export EDITOR='micro'; export GCC_COLORS='error=01;31:warning=01;35:note=01;36:caret=01;32:locus=01:quote=01'  
################################
################ _colors
## black='\e[0;30m'; red='\e[0;31m'; green='\e[0;32m'; yellow='\e[0;33m'; blue='\e[0;34m'; pink='\e[0;35m'; cyan='\e[0;36m'; white='\e[0;37m'; 
############
## COLORS ##
e='echo -e '; bold=$($e'\e[1m';); dim=$($e'\e[2m';); italic=$($e'\e[3m';); 
underline=$($e'\e[44m';); blink=$($e'\e[45m';); rev=$($e'\e[47m';); invis=$($e'\e[8m';); 
strike=$($e'\e[9m';); blank=$($e'\e[0;30m';); red=$($e'\e[0;31m';); green=$($e'\e[0;32m';); 
yellow=$($e'\e[0;33m';); blue=$($e'\e[0;34m';); pink=$($e'\e[0;35m';); cyan=$($e'\e[0;36m';); 
white=$($e'\e[0;37m';); re=$($e'\e[0m';); c2=$($e'\e[36m --\e[0m';); 
############
########
##############
################_ lfilemanager
################################
################################
################ _functions
LFRC='/ants/sh/config/lfrc.sh'; if [ -e /bin/lf ]; then bind '"\C-o":"lfcd\C-m"'; alias l='cd $(lf -config $LFRC -print-last-dir )';
lfcd () { cd "$(command lf -config $LFRC -print-last-dir "$@")"; } fi; 
cd () { builtin cd "$@" && ls --hyperlink -hltrp --color=always --group-directories-first; echo -e '\e[36m'; pwd; }
################################
################ _alias
alias ee='echo ';
alias ll='ls --hyperlink -hltrp --color=always --group-directories-first'; 
alias la='ls --hyperlink -Ahltrp --color=always --group-directories-first; pwd'; 
alias 'sl_cc@192.168.0.105'='ssh cc@192.168.0.105'
alias 'sl_aaaa@ants.ftp.sh'='ssh aaaa@ants.ftp.sh'; 
alias m8='ssh -p 8022 192.168.0.102'
iploc="$(ip a|head -n 12|tail -n 4|grep "inet "|tr -s "[:alpha:] /\n" " \n"|head -n2|tail -n1 2>/dev/null)"; 
ip4="$(curl -4 ip.me -s&)"; zz=' 2>/dev/null'; 
################ _variables
export m8='62e27586_c5be_4dd2_a26c_6c558847cf63';
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
. /ants/alias.sh; . /ants/functions.sh;
for i in /ants/12/*.*; do . $i; done; 
if [ -e /bin/neofetch ]; then neofetch; fi 
echo -e "
  $c2 Welcome back $cyan$bold $USER, $re today is:$blu $(date) $re
  $c2 Public ip: $green$line$ip4$re 
  $c2 Local  ip: $cyan$line$iploc$re";
if [ "$SSH_CONNECTION" ]; then shsh=($SSH_CONNECTION);
echo -e "  $c2 $bold"$red"ssh$re from$re: $cyan${shsh[0]}$re to$re $cyan${shsh[2]}$re:$cyan${shsh[3]}$re\n"; fi; echo;
PS1='$(history -a)'$re$blue$dim'\t'$red' \u '$green'\H '$cyan'$PWD '$pink'\$ '$re'\n'
