#!/bin/bash
## A better bash. Written by 12ants.github.io
## _do nothing if not interactive
case $- in
*i*) ;;
*) return;;
esac
if [ -z "${PREFIX}" ]; then if ! shopt -oq posix; then if [ -f /usr/share/bash-completion/bash_completion ]; 
then . /usr/share/bash-completion/bash_completion; elif [ -f /etc/bash_completion ]; then . /etc/bash_completion; fi; fi; fi; 
shopt -s histappend; ## append to history, don't overwrite it
#### # export BROWSER='google-chrome'; # export BROWSER_CLI='links2';  # alias fix-opera='sudo ~root/.scripts/fix-opera.sh' # Opera fix HTML5 media
export PROMPT_COMMAND="history -a; history -n;" NVM_DIR="$HOME/.nvm"; alias nvm_initzz='[ -s "$NVM_DIR/nvm.sh" ]&& \
. "$NVM_DIR/nvm.sh"; [ -s "$NVM_DIR/bash_completion" ]&& . "$NVM_DIR/bash_completion"'
####
[ -e "/bin/gcalcli" ]&& [ "$me" = "aa" ]&& \
timeout 6 gcalcli remind --locale='sv_SE.UTF-8' "166" "notify-send -a ""'$(date)'"" -u "normal" -t "6666" ""'%s'"" " 2>/dev/null & disown; 
## COLORS -- VARIABLES ##########################
apts=(fzf ccze lf batcat tmux)
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
[ $(echo $HOME|grep -w "termux") ]&& alias sudo='command'; 
[ "$TMUX" ]&& echo; 
export TERM="xterm-256color"; 
[ -z "${EDITOR}" ]&& export EDITOR='micro';
export PAGER='less' GCC_COLORS='error=01;31:warning=01;35:note=01;36:caret=01;32:locus=01:quote=01'
# qqkrel="$(uname --kernel-release)"; qqkvers="$(uname --kernel-version)"; # qqkname="$(uname --kernel-name)"; qqos="$(uname --operating-system)"; # qqarch="${BASH_VERSINFO[-1]}"; qqterm="${TERM}"; sep='\e[0m -\e[2m';
[ -z "${ants}" ]&& read -rp "ants: " -i "$PWD" "ants"; 
[ -z "${ants}" ]&& ( printf "export ants=$ants >> ~/.bashrc; "; 
printf %b "export ants=$ants\n" ) >> ~/.bashrc; 
. $ants/alias.sh; 
. $ants/func/func.sh; 
# [ -e $ants/func/func.sh ]&& for i in $ants/functions/*; do . $i; done; 
# qqshell="${SHELL/*\//}"; qqshell="$(printf "${qqshell^^}$sep $BASH_VERSION")"; 
# printf "$dim$qqkvers \n$qqshell$sep $qqarch\n$qqkname $qqkrel$sep $qqos$sep $re$red$qqterm\n"; 
# model="$(getprop ro.product.model ro.product.model ro.build.version.min_supported_target_sdk ro.build.version.sdk ro.product.abilist ro.product.name ro.soc.manufacturer ro.soc.model gsm.sim.operator.alpha 2>/dev/null )"; 
# [ -e "/etc/os-release" ]&& OOSS=($(cat "/etc/os-release"|tr " " "_"|tr -d '""'));
# for i in ${!OOSS[@]}; do printf -v "OS_${OOSS[i]/=*}" "${OOSS[i]/*=}"; done 
# printf "$green${OS_ID_LIKE^} ${OS_ID^} ${OS_VERSION}\n";
[ -n "${PREFIX}" ]&& model=($(getprop ro.product.model))&& \
[ -z "${HOST}" ]&& HOST="$(uname --kernel-name --kernel-release);";  
[ -z "${PREFIX}" ]&& [ -e /sys/devices/virtual/dmi/id/product_family ]&& \
model=($(cat /sys/devices/virtual/dmi/id/product_sku /sys/devices/virtual/dmi/id/board_vendor /sys/devices/virtual/dmi/id/bios_vendor|sort|uniq -u|tr '\n' ' '))
#### (systemd-analyze|batcat -ppflzig; echo;); 
###############################################
dawd="$(date +%w)"; dadm="$(date +%d)"; damo="$(date +%m)"; daye="$(date +%y)"; dahh="$(date +%H)"; damm="$(date +%M)";
####
alias neighbours='sudo nmap $ip0 -p 22,80,443,53,8022,5555 --open --min-rate 22|batcat -ppflgo --theme Nord|grep -v "Not"'; 
alias fortshort='seq 12 > $HOME/.ff.sh; while [ "$(cat $HOME/.ff.sh|wc --lines)" -gt "6" ]; do fortune > $HOME/.ff.sh; done; cat $HOME/.ff.sh'; 
alias vim='nano'; 
alias ff='timeout 1 fastfetch||timeout 1 neofetch||id'
####
####
sshc=($SSH_CONNECTION); 
ipgateway="$(ip -c -4 r|cut -f3 -d" "|head -n1;)"; 
ip4=$(timeout 1 curl icanhazip.com -s4 -L); [ "${#ip4}" -gt 22 ]&& ip4="nope"; 
ip0="$(ip r 2>/dev/null|tail -n1|cut -f1 -d"/")-12"; 
[ -n "$PREFIX" ]&& iploc="$(getprop "vendor.arc.net.ipv4.host_wifi_address")"; 
[ -n "$iploc" ]|| iploc="$(ifconfig 2>/dev/null|grep -v "lo"|grep -w "4163" -A1|tail -n1|cut -f10 -d" ";)"; 
####
####
[ -z "$HOSTNAME" ]&& HOSTNAME="$(uname --kernel-name --kernel-release|tr " ." "_")"; 
[ -z "$HOST" ]&& HOST="$(uname --kernel-name --kernel-release|tr " ." "_")"; 
####
####
if [ -e "${PREFIX}/bin/figlet" ]; then ff=$(figlist|shuf -n1); printf "\n\n$ff\n\n"; 
figlet -c -f "$ff" "_Hello"|batcat -ppfl zig 2>/dev/null; printf "\n\n"; fi; 
####
####
printf "\e[40m\e[96m$HOSTNAME\e[1;37m -\e[0m\e[40m\e[2m$(uptime) $re\n"; 
printf "$re··········\n"; 
printf "$re$dim$(fortshort 2>/dev/null)\n"; 
printf "$re··········\n"; 
printf "$(test -e ~/logs/gcalagenda.sh && batcat ~/logs/gcalagenda.sh -ppflzig --theme Nord|column|head -n4;)$re\n";
printf "$re··········\n"; 
printf "$cyan$MACHTYPE$re | $green$TERM$re | $cyan$0 $TERM_PROGRAM$re\n" 
printf "$re··········\n"; 
printf "$green$rev${model[*]}$re\n"; 
printf "$re··········\n"; 
[ "${SSH_CONNECTION}" ] && printf "$re$red${sshc}$re >> "; 
printf "$cyan$me$re@$pink$HOSTNAME$re | $cyan$ip4$re | $blue$iploc$re\n"; 
printf "$re··········\n"; 
printf "$dim$(date -R)$re | $re$dim$(uptime -p)\n"; 
printf "$re··········\n"; 
####
####
####
mod="$(echo -e "${model[*]}"|tr " " "-";)"; 
[ "${LF_LEVEL}" ]&& printf "\n\e[0;91m -- LF_LEVEL \e[0m = $LF_LEVEL\n"; 
######## << TMUX TO BASHRC
#tmux source-file "$HOME/.tmux.conf"; 
#if [ -z "${TMUX}" ]; then [ "$SSH_CONNECTION" ]|| tmux source&& exit; 
#else tmux lock-server fi;
##################################
## PS1:s to save >>
## PS1='\e[2;40;96m\t\e[37m$(echo $PWD|bat --theme Nord -ppflr;)/\e[0m\n'
##PS1='\e[2;37m${mod:0:22}$re $cyan$me$re @ \e[45;30m\H\e[0m \e[34;40m\W/\e[0m \e[$((COLUMNS-26))G$(date +%d-%m-%y" $(printf \e[9${dawd:(-1)}m)"%^A"$re "%X)\n'
##################################
PS1='\e[2;37m${mod:0:22}$re $cyan$me$re \e[0;40;96;2m${PWD}\e[97m/ \e[0m \n'; 
