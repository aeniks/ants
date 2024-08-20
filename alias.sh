#!/bin/bash
# alias for bash terminal
export EDITOR='micro'; 
export GCC_COLORS='error=01;31:warning=01;35:note=01;36:caret=01;32:locus=01:quote=01'  
#export PATH="$PATH:/usr/games"
#alias grep='grep --color=auto'
#alias fgrep='fgrep --color=auto'
#alias egrep='egrep --color=auto'
alias 12_network='ip -c n | grep -v FAILED|head -n-1'
####
####
kl() {
if [ -z $1 ] 2>/dev/null; then 
timeout 1 batcat -Pp --language c;
[ $? ] 2>/dev/null && kat; else 
timeout 1 batcat -Pp --language $1
if [ $? = 130 ] 2>/dev/null; then kat
else batcat -L; fi; fi; 
}
hh(){
# get bat in no has
[ -e /bin/batcat ]||[ -e /bin/bat ]||\
(read -rep "$c2 install bat? " "qq"; 
sudo apt install batcat -y 2>/dev/null||\
apt install bat -y 2>/dev/null; echo gg;)  
# do script
[ $1 = "help" ] 2>/dev/null && (echo -e "\n$c2 hh + #number_lines \n"; return 0;); # help
lng="c"; [ $2 ]&& lng="${2}"; 
lns="42"; [ $1 ]&& lns="${1}"; 
history -a;
tail -n $lns ~/.bash_history|awk '!x[$0]++'|batcat -Pp --language "$lng"||batcat --list-languages;
}
kat() {
unset -v kat; 
if [ $1 = "help" ] 2>/dev/null; then 
batcat -h|batcat --force-colorization -pP --language c;
return 0; fi; 
[ $2 ]&& lng="${2}"; [ $2 ]|| lng="c"; 
[ $1 ] 2>/dev/null||ls -p --color --group-directories-first --hyperlink; 
[ $1 ] 2>/dev/null||read -rep "$c2 kat file: " -i "$PWD/" kat;
batcat -Pp --color always --decorations always $kat $1 \
--language $lng;  
}
alias fill='seq -s "" 2222';
alias 12_nuke_ants='
read -rep "$c2$red nuke$re old ant-folder: " -i "$ants" "ok"; 
read -rep "$c2$red nuke$re new ant-folder: " -i "$ants" "nk"; 
read "$nk${cyan} ok${re}? " "okok" 2>/dev/null;
sudo rm $ok -R;  git clone https://github.com/aeniks/ants /tmp/ants; 
sudo mv /tmp/ants $nk 2>/dev/null; cd $nk/ants; exec bash;'
alias 12_make_admin='if [ -e != /etc/sudoers.d/admins ]; 
then sudo touch /etc/sudoers.d/admins; fi; 
sudo chmod 775 /etc/sudoers.d/admins && 
read -epr " $c2 Add as admin-user: " "newsudo" && sudo echo -e "
$newsudo ALL=(ALL) NOPASSWD:ALL
%"$newsudo" ALL=(ALL) NOPASSWD:ALL \n" >> "/etc/sudoers.d/admins"'
##### << make this a function
alias 12_make_foler='
psp read -ep "$c2 "$rev"new folder?$re " -i "$PWD" "folder"; 
mkdir -p $folder -m 775; 
chown "$SUDO_USER":"$USER" "$folder"; 
cd $folder; echo -e "\n\t $cyan$bold> $pink$PWD$cyan <$re\n\t * * * *\n"; ls -caklhuptr --group-directories-first;'
alias 12_goto='echo -e "\n\n\n\n"; tput cuu 2; echo -ne "\t $c2 goto: "; read -ep "" -i "$PWD/" "pwd"; cd $pwd; ll; echo;';
#alias apt='sudo apt'
alias 12_gmail='open gmail.com'
alias no='echo -e "\e[?25h"'
alias 12_ansi_info='glow $ants/sh/info/ansi.md'
alias 12_tard='lo="$(jp2a $ants/media/tard5.jpg --chars="_oooo" --term-width)";
echo -e "\e[?25l\e[36m"; for i in $(seq ${#lo}); 
do echo -ne "\e[3$(shuf -en1 2 4 6)m${lo:$i-1:1}"|tr "_o" " ."; done; echo -ne "\e[?25h";'
alias tard='lo="$(jp2a $ants/media/tard5.jpg --chars="_oooo" --term-width)";
echo -e "\e[?25l\e[36m"; for i in $(seq ${#lo}); 
do echo -ne "\e[3$(shuf -en1 2 4 6)m${lo:$i-1:1}"|tr "_o" " ."; done; echo -ne "\e[?25h";'
alias 12_lf_config='micro /etc/lf/lfrc.sh;'
alias pick='height="$(stty size|head -c3)"; tput indn $((height/4)) cuu $((height/4-2)); gum choose * --no-limit --cursor=" > " --height $((height/2))'
alias staticants=''
alias reloadbash='exec bash'
alias 12_history='less +G ~/.bash_history'
norm() { echo -e '\e[0m'; tput cnorm 2>/dev/null; }  
#alias alert='notify-send --urgency=low -i "$([ $? = 0 ] && echo terminal || echo error)" "$(history|tail -n1|sed -e '\''s/^\s*[0-9]\+\s*//;s/[;&|]\s*alert$//'\'')"'
#alias 11='ssh ants.swe.net -p 8022 "termux-media-player play /sdcard/Music/money.mp3"'
#alias 22='ssh ants.swe.net -p 8022 "termux-media-player stop"'
#alias aa='if [ $USER = "root" ]; then sudo chown $SUDO_USER:  -R; sudo chmod 775  -R; 
#else sudo chown $USER:  -R; sudo chmod 775  -R; fi; cd ; 
#echo; pwd|pr --omit-header --indent=4|lolcat -p 2; echo; echo -e "$cyan$dim --------$re"; 
#ls -Ahltrp --color=always --group-directories-first; echo -e "$cyan$dim --------$re \n"'
alias aa='cd $ants; '
alias aaaa="micro "$ants/alias.sh"; read -ep 'update $ants/alias.sh? '; . $ants/alias.sh;"
alias bbbb="micro "$ants/bash.sh"; read -ep 'update $ants/bash.sh? '; . $ants/bash.sh;"
alias cccc="micro "$ants/functions.sh"; read -ep 'update $ants/functions.sh? '; . $ants/functions.sh;"
####
alias bgbg='tput cup 0 setab $((RANDOM%222 + 44)); for i in $(seq $((LINES * COLUMNS))); 
do echo -n " "; done; tput cup 0'
alias psp='tput indn 12 cuu 8;'
alias 12_fillscreen='seq -s "-" 2222|lolcat -p .8 -s 2'
alias 12_ansii_codes="echo '
## $($e'\e[1m') bold $($e'\e[0m') 	## $($e'\e[2m') dim $($e'\e[0m')
## $($e'\e[3m') italic $($e'\e[0m') 	## $($e'\e[4m') underline $($e'\e[0m')
## $($e'\e[5m') blink $($e'\e[0m') 	## $($e'\e[7m') rev $($e'\e[0m')
## $($e'\e[2m') invis $($e'\e[0m') 	## $($e'\e[9m') strike $($e'\e[0m')
## $($e'\e[2m') blank $($e'\e[0m') 	## $($e'\e[31m') red$($e'\e[0m')
## $($e'\e[32m') green $($e'\e[0m') 	## $($e'\e[33m') yellow $($e'\e[0m')
## $($e'\e[34m') blue $($e'\e[0m') 	## $($e'\e[35m') pink $($e'\e[0m')
## $($e'\e[36m') cyan $($e'\e[0m') 	## $($e'\e[37m') white $($e'\e[0m')
## $($e'\e[0m') re $($e'\e[0m') 	## $($e'\e[36m --\e[0m') c2 $($e'\e[0m')'"
#shost="aeniks.mooo.com"; suser="aaaa";
#alias sl='ssh $suser@$shost'
alias 12_serve_folder_with_wrangler='read -n1 -ep  "$c2 serve $PWD/? "; npx wrangler pages dev . 2>/dev/null'
#alias wrangler='npx wrangler pages'
alias 12_iplocal='ip route; cat ~/iplog; ' 
alias 12_ants_dl_installer='read -ep "$c2 get ants? " ""; wget -O /tmp/in.sh git.new$ants; . /tmp/in.sh;'
alias lenoo='read -t 8 -ep "$c2 update ants.swe.net to lenoos cmp? " "kndfkd"; curl -k https://freedns.afraid.org/dynamic/update.php?OHJNTjc5SWZsRGZoZm1Nanhtek06MjI1MjY0NTM='
alias 12_rainbow='echo;echo;echo; tput cuu 2; read -ep "$c2 " "rainbow"; rb "$rainbow";'
alias 12_fortune="rrf; fortune; tput sgr0;"
alias rr="sudo -s"
alias 12_edit_etc_besh="micro /etc/bash.bashrc"
alias mm="micro"
alias 12_randomword="wotd"
alias 12_zip='echo -ne "\n\t $c2 "; read -ep "zip folder: " -i "$PWD"  "zipf"; 
echo -ne "\n\t $c2"; read -ep "to: " -i "$(wotd|tr -d "''").zip" "zipz";
zip -r $zipz $zipf;'
##
alias hiztory='command -v glow||(sudo apt install glow -y &>/dev/null||apt install glow -y&>/dev/null); 
history -a; echo -e "## $(tty; date;) ## " >> ~/.bash_history; tail -n22 ~/.bash_history|glow; read -rep " $c2 lines: " -i "$lo" "lo"; \
tail -n${lo} ~/.bash_history|glow; '
alias qq='cd ..; ' 
alias ww='cd $OLDPWD; '
alias bb="btop --utf-force"
alias emojis='cat $ants/sh/emojis.sh|tr "\n" "\t";';
alias 12_emojis=emojis;
############################################
#### GITHUB ################################
alias 12_write_gist_kk='read -ep ">_ " 'kl'; printf "$kl"|gh gist create -f $(date +%A_%y_%m_%d_%__0k_%M.sh);'
alias kf='guf=$(gum file);echo -e "\n\n\n\n\n"; tput cuu 2; read -ep "$c2 title: $cyan" -i "$(date +%A%y%m%d%0k%M.sh)" "ttll";cat $guf|gh gist create -f $ttll - '
############################################
#### SSH ###################################
############################################
#### ANTS ##################################
#alias ali='micro /alias.sh && read -t2 -n1 -ep "update /alias.sh? " ab && source /alias.sh'ions.sh'
alias uu='sudo apt update && sudo apt upgrade -y && sudo apt -y autoremove; sudo apt full-upgrade -y && sudo snap refresh && jp2a $ants/media/tard.jpg|pv --rate-limit=2222 --quiet'
alias rb='sudo wall "gg"; sleep 1; sudo systemctl reboot'
##
alias www="www-browser"
############################################
#### WEATHER ###############################
# vv='curl -sm2 http://wttr.in/sthlm?format=%l:+%c+%f'
alias 12_weather='curl http://wttr.in/stockholm '
alias 12_whtr='tput sc; tput cup 4 $((COLUMNS-28)) el; tput cup 5 $((COLUMNS-28)) el; tput cuf 2; 
curl -sm2 http://wttr.in/sthlm?format=%l:+%c+%t+/+%f++; tput cup 6 $((COLUMNS-28)) el; tput sgr0 rc'
#curl http://wttr.in/Stockholm?format=%l:+%c%t+-+%C++-++Feels+like:+%f++H:+%h; 
############################################
## MISC_STUFF ##############################
alias 12_fill='seq -s " # " 4444|lolcat'
alias 12_info_tput='less /sh/info/tputhelp.txt'
alias 12_coolors='. $ants/sh/helpansi.sh;' 
############################################
## RANDOM_STUFF ############################
# export rnd1="(($RANDOM%99))"
# alias rnd1="(shuf 0-222 -n1)"
alias lf=lfub
alias rr1='(echo $SRANDOM|tail -c2)'
alias rr2='(echo $RANDOM|tail -c2)'
alias rrf='tput setaf $(rr1)'
alias rrb='tput setab $(rr2)'
############################################
#### IP_STUFF ##############################
#alias ports='echo -e "\n\n   $cyan-$re Open ports on local network"$cyan" -"$re" \n"; echo -e " -- -- -- -- -- -- -- $(portsopen;  echo " -- -- -- -- -- -- --")"|column -tLo "$(tput sgr0)|  " -tLo "  $(tput sgr0)||   " -H 1,2,3,4,8; echo -e "\n\n" '
#export ipn="$(hostname -I | tail -c3)"
#export ipnet="$(hostname -I|tr  " " "\n"|head -n1)"
#export ipnet=$(hostname -I|tr " " "\n"|head -n1)
#export ipn=$(hostname -I|tr " " "\n"|head -n1|tail -c2)
#alias iplocal="ifconfig | sed -En 's/127.0.0.1//;s/.*inet (addr:)?(([0-9]*\.){3}[0-9]*).*/\2/p'|tr "\n" "-""
#iplocal=$(iplocal|tail -n1)
#alias ipnet="tput setab $ipn; echo -n $ipnet; tput sgr0;"
#alias ippub="wget -qO- ifconfig.me"
#alias ipports="sudo lsof -i -P -n"
##
#alias ipa='echo -ne "
#\t$(rrf)------$(tput setaf 2) Public IP: $(tput sgr0)$(ippub)$(tput setaf 6) 
#\t$(tput setaf $(rr2))---------------------------------- 
#\t$(rrf)------$(tput setaf 4) Network IP: $(tput sgr0)$(iplocal|tr "\n" "\t")$(tput sgr0)"; echo'
############################################

##
# alias ali='psp read -ep "$c2 " -i "alias " "ali"; echo "$ali" >> /etc/aaaa.sh; echo -e "\n $ali \n " '
# alias ali='psp read -ep "$c2 " -i "ali " "ali";
# echo "$ali" >> /etc/aaaa.sh; echo -e "\n $ali \n " '
#alias ali='psp read -ep "$c2 alias name: " "alia"; 
#psp read -ep "$c2 alias $alia=" -i ""'""""'"" "aliq"; 
#echo "alias $alia=$aliq" >> /alias.sh; 
#echo -e "\n $alia=""$aliq"" \n "; source /alias.sh'
############################################
############################################
#alias fakta='neofetch 2>/dev/null '
alias gg='tput indn 8 cuu 4; read -ep "$c2 " -i "google: " "google"; googler "https://www.google.com/search?q=$google"'
alias zz="ranger 2>/dev/null" 
#alias pp='echo ____pinging_moto8____; for i in {1..18}; do sleep 1; 
#kdeconnect-cli -n "moto g(8)" --ping-msg "  >_<  "; sleep 1; done'
alias cloner='
psp read -ep "$c2 "$rev"clone where folder?$re " -i "$PWD/" "folder"; mkdir -p $folder -m 775 2>/dev/null; 
chown "$SUDO_USER":"$USER" "$folder"; cd $folder; echo -e "\n\t $cyan$bold> $pink$PWD/$cyan <$re\n\t * * * *\n"; ll -caklup;
####
psp read -ep "$c2 CLONE: https://github.com/aeniks/" -i "" "clone"; 
git clone https://github.com/aeniks/$clone; cd $clone 2>/dev/null; echo -e "\n\t $cyan$bold> $pink$PWD/$cyan <$re\n\t * * * *\n"; ls -a; echo;echo; '
# alias ww='ee;ee "$cyan";w;ee;ee "$blue"; ps all;ee "$re $PWD"'
alias 12_last_logins='echo;echo "  LAST LOGINS"; echo -e "$pink"; sudo lastb -axdwn 4;echo -e "$white"; echo "       = = = = = = == ";echo; sudo last -wxdFan4;echo;landscape-sysinfo; echo;echo "    = = = = = =   ";echo'
alias 12_choose_logins_screen='read -n1 -ep "  $c2  g/t  $(systemctl get-default)  " "gt"; if [ $gt == t ]; then sudo systemctl set-default multi-user.target; else sudo systemctl set-default graphical.target; fi ; echo gg'
alias xxxx='startx'
#alias an12='bash <(wget -O- dub.sh12)'
#alias aeniks='wget -Ok dub.sh/aeniks; . k;'
alias greet='echo -ne "\t$c2 Welcome back $blue $USER,$re today is:$blue "; date; echo'
####
alias uuuu='cd /uuuu; echo; pwd|pr --omit-header --indent=4|\
lolcat -p 2; echo;  echo -e "$cyan$dim --------$re"; ls -Alhkct; echo -e "$cyan$dim --------$re \n"'
if [ -x /usr/games/cowsay ]; then cows=($(ls /usr/share/cowsay/cows|sed s/.cow//g)); fi; 
alias 12_quote="/usr/games/fortune"
alias push='git add --all; git commit --all -m $(date +%F_%H_%M); git push'
alias pull='git pull'
alias info_cm'=less $ants/sh/info/cmd.sh'
alias cm2'=cat $ants/sh/cmd.sh'
alias yno='read -n1 -p "$re$c2$dim ["$re$bold"Y$dim/"$re$bold"n$dim]$re " "yn"; if [ "$yn" == "${yn#[Nn]}" ]; then echo yes; fi;'
