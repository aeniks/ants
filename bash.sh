#!/bin/bash
## written by 12ants.github.io
#########################
## -- CUSTOM LINUX --  ##
#########################
# enable programmable completion features (you don't need to enable
# this, if it's already enabled in /etc/bash.bashrc and /etc/profile
# sources /etc/bash.bashrc).
if ! shopt -oq posix; then
  if [ -f /usr/share/bash-completion/bash_completion ]; then
    . /usr/share/bash-completion/bash_completion
  elif [ -f /etc/bash_completion ]; then
    . /etc/bash_completion
  fi
fi
## tput sc; tput cup 7 $((COLUMNS-28)); echo -en "loaded $(tput setaf 7)/etc/bbbb"; tput rc;
export EDITOR='micro'; 
export GCC_COLORS='error=01;31:warning=01;35:note=01;36:caret=01;32:locus=01:quote=01'  
alias ee='echo ';
alias ll='ls -lhpAtr --color=always --group-directories-first';
######## COLORS
bold=$(tput bold) dim=$(tput dim) so=$(tput smso) noso=$(tput rmso) rev=$(tput rev) re=$(tput sgr0) normal=$(tput sgr0) \
redb=$(tput setab 1) greenb=$(tput setab 2) yellowb=$(tput setab 3) blueb=$(tput setab 4) purpleb=$(tput setab 5) cyanb=$(tput setab 6) \
grayb=$(tput setab 7) red=$(tput setaf 1) green=$(tput setaf 2) yellow=$(tput setaf 3) blue=$(tput setaf 4) purple=$(tput setaf 5) \
cyan=$(tput setaf 6) gray=$(tput setaf 7) white=$(tput setaf 7 bold) pink=$(tput setaf 5 bold) darkblue=$(tput setab 5 bold) blink=$(tput blink) \
left2=$(tput cub 2) up1=$(tput cuu1) pinkb=$(tput setab 5 bold) c2=""$cyan"--$re"; 
if [[ $TERM != "xterm-256color" ]]; then
ra1=$((RANDOM%16+1)); ra2=$((RANDOM%8+1)); rb1=$((RANDOM%16+1)); rb2=$((RANDOM%8+1)); rc1=$((RANDOM%16+1))
rc2=$((RANDOM%8+1)); rd1=$((RANDOM%16+1)); rd2=$((RANDOM%8+1)); re1=$((RANDOM%16+1)); re2=$((RANDOM%8+1)); 
else
ra1=$((RANDOM%16+1)); ra2=$((RANDOM%256+1)); rb1=$((RANDOM%16+1)); rb2=$((RANDOM%256+1)); rc1=$((RANDOM%16+1))
rc2=$((RANDOM%256+1)); rd1=$((RANDOM%16+1)); rd2=$((RANDOM%256+1)); re1=$((RANDOM%16+1)); re2=$((RANDOM%256+1)); 
fi
########
export NVM_DIR="$([ -z "${XDG_CONFIG_HOME-}" ] && printf %s "${HOME}/.nvm" || printf %s "${XDG_CONFIG_HOME}/nvm")"
[ -s "$NVM_DIR/nvm.sh" ] && \. "$NVM_DIR/nvm.sh" # This loads nvm
## bash completion for the `wp` command
#_wp_complete() {
#	local OLD_IFS="$IFS"
#	local cur=${COMP_WORDS[COMP_CWORD]}
#
#	IFS=$'\n';  # want to preserve spaces at the end
#	local opts="$(wp cli completions --line="$COMP_LINE" --point="$COMP_POINT")"
#
#	if [[ "$opts" =~ \<file\>\s* ]]
#	then
#		COMPREPLY=( $(compgen -f -- $cur) )
#	elif [[ $opts = "" ]]
#	then
#		COMPREPLY=( $(compgen -f -- $cur) )
#	else
#		COMPREPLY=( ${opts[*]} )
#	fi
#
#	IFS="$OLD_IFS"
#	return 0
#}
#complete -o nospace -F _wp_complete wp
##
##
## bash prompt
#########
##
ants_swe_net="https://freedns.afraid.org/dynamic/update.php?OHJNTjc5SWZsRGZoZm1Nanhtek06MjI1MjY0NTM="
ants_ftp_sh="https://freedns.afraid.org/dynamic/update.php?OHJNTjc5SWZsRGZoZm1Nanhtek06MjI1MjY0NTk="
aeniks_mooo_com="https://freedns.afraid.org/dynamic/update.php?OHJNTjc5SWZsRGZoZm1Nanhtek06MjI1NzE2MzY="
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
#######
#zz=' 2>/dev/null'
#ip4=$(curl -4 ip.me -s&); 
#alias ip6=$(curl -6 ip.me -s&); 
#iplocal=$(ifconfig|grep "4163" -n1|tail -n1|cut -c16-29|tr -d " [:alpha:]"); 
#ipbase=${iplocal%.*};
#echo -e "\n\t$c2 Last logins: "; who
##########################
#### Welcome screen ######
##########################
if [ "$SSH_CONNECTION" ]; then shsh=($SSH_CONNECTION);
echo -e "\n  $bold"$green"ssh$re from$re: $cyan${shsh[0]}$re \
to$re $cyan${shsh[2]}$re:$cyan${shsh[3]}$re"; fi; 
####
iploc="$(ip a|head -n 12|tail -n 4|grep "inet "|tr -s "[:alpha:] /\n" " \n"|head -n2|tail -n1)";
ip4="$(curl -4 ip.me -s&)";
####
echo -e "
  $c2 Welcome back $darkblue $USER, $re today is:$blue $(date) $re
  $c2 Public ip: $green$ip4$re 
  $c2 Local  ip: $cyan$iploc$re\n";
#export ipn=$(hostname -I|tr " " "\n"|head -n1|tail -c2)
#if [ lolcat ]; then qw|pr --omit-header --indent=8 --across|lolcat -p 88 2>/dev/null; fi; echo;
#echo -ne "
#\t$(rrf)------$(tput setaf $rd2) Public IP4: $(tput sgr0)$ip4$(tput setaf 6) 
#\t$(rrf)------$(tput setaf $rd1) Network IP: $(tput sgr0)$iplocal$(tput setaf 6)
#"
#$(ls -Fptr --classify --color --group-directories-first|tr "\n" " "|head -c$((COLUMNS*6)))
#$dim$(ls -pAmtr|tr -d ","|pr --omit-header -c1 -w$((COLUMNS*2))|head -n1)
. /ants/alias.sh; . /ants/functions.sh;
qa() { 
tput setaf $((RANDOM%$1+$2)); 
}
if [ "$(id -u)" -eq 0 ]; then us='#'; else us='$'; fi;
computer=$(hostname 2>/dev/null)
#PS1='$re\
#[$(qa $ra1 $ra2)$()$us$re]\
#[$(qa $rd1 $rd2)$USER$re@$(qa $rc1 $rc2)$computer$re]\
#[$(tput setaf 6)$iploc$re]\
#[$(qa $rb1 $rb2)$(date +%T)$re]\
#$(qa $re1 $re2; tput rev)$PWD $re\n'
PS1='$green$us$cyan$PWD$re: '
