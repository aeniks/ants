#!/bin/bash
## A better bash. Written by 12ants.github.io
################################
################ _do nothing if not interactive
case $- in
*i*) ;;
*) return;;
esac
if ! shopt -oq posix; then if [ -f $PREFIX/share/bash-completion/bash_completion ]; 
then . $PREFIX/share/bash-completion/bash_completion; elif [ -f $PREFIX/etc/bash_completion ]; 
then . $PREFIX/etc/bash_completion; fi; fi; 
export "ants"='/data/data/com.termux/files/home/ants'; 
ants='/data/data/com.termux/files/home/ants'
export EDITOR='micro'; 
export GCC_COLORS='error=01;31:warning=01;35:note=01;36:caret=01;32:locus=01:quote=01'  
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
vader="$(curl -sm2 http://wttr.in/sthlm?format=%l:+%c+%t+/+%f++ & disown)"; 
############
########
sv up sshd;
sv up crond;
alias sd='cd /sdcard/ '
##############
################_ lfilemanager
################################
################################
################ _functions
LFRC="$ants/sh/config/lfrc.sh";
alias l='cd $(lf -config $LFRC -print-last-dir )';
lfcd() { cd "$(command lf -config $LFRC -print-last-dir "$@")"; }; 
cd() { builtin cd "$@" && ls --hyperlink -hltrp --color=always --group-directories-first; echo -e '\e[36m'; pwd; }
################################
################ _alias
alias mm='micro'
alias ee='echo ';
alias ll='ls --hyperlink -hltrp --color=always --group-directories-first'; 
alias la='ls --hyperlink -Ahltrp --color=always --group-directories-first; pwd'; 
alias 'sl_cc@192.168.0.105'='ssh cc@192.168.0.105'
alias 'sl'='ssh aaaa@ants.ftp.sh'; 
alias m8='ssh -p 8022 192.168.0.102'
#iploc="$(ip a|head -n 12|tail -n 4|grep "inet "|tr -s "[:alpha:] /\n" " \n"|head -n2|tail -n1 2>/dev/null)"; 
iploc="$(ip route |tail -n1|cut --fields=9 --delimiter=" ")"; 
ip4="$(curl -4 ip.me -s&)"; zz=' 2>/dev/null'; 
################ _variables
export m8='62e27586_c5be_4dd2_a26c_6c558847cf63';
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
#PS1=''$re$blue$dim'\t'$red' \u '$green'\H '$cyan'$PWD '$pink'\$ '$re'\n'
#######
##########################
#### Welcome screen ######
##########################
####
. $ants/alias.sh; 
[ -e $ants/functions/ ]&& for i in $ants/functions/*; do . $i; done; 
[ -e ~/functions.d/ ]&& for i in ~/functions.d/*; do . $i; done; 
alias 12_='menu "$ants/12"';
fastfetch; 
timeout -k 1s 2s echo -e "  $c2 ${vader^^}
  $c2 Welcome back $cyan$bold$(id -un)
  $c2 Public ip: $green$line$ip4$re 
  $c2 Local  ip: $cyan$line$iploc$re "; 
echo -e "  $c2 $pink$(date +%A" $green"%B" $yellow"%D)$re -- $bold$cyan$blink$italic$(date +%T)$re"
if [ "$SSH_CONNECTION" ]; then shsh=($SSH_CONNECTION);
echo -e "  $c2 $bold"$red"ssh$re from$re: $cyan${shsh[0]}$re to$re $cyan${shsh[2]}$re:$cyan${shsh[3]}$re\n"; fi; echo;
#PS1='\e7\e[4;4H\e[1;3;36m\w\e[0m\e8\n'
