#!/bin/bash
###########
## /ants/functions.sh - functions for bash shell
###########
###########
## coolors - display available colors
####

sl() {
s1="ants.ftp.sh"
s2="ants.swe.net"
s3="aeniks.mooo.com"
s4="bobo.ftp.sh"
echo -n "$cyan 1$re) "; host $s1; 
echo -n "$cyan 2$re) "; host $s2; 
echo -n "$cyan 3$re) "; host $s3; 
echo -n "$cyan 4$re) "; host $s4; 
echo -en "\n\t$c2 server: "; read a
echo -en "\t$c2 user: "; read -ep "" -i "$USER" "shuser";
echo -en "\t$c2 port:"; read -ep " " -i "22" "sp";
        case $a in
	        1) ssh $shuser@$s1 -p $sp; return 0 ;;
	        2) ssh $shuser@$s2 -p $sp; return 0 ;;
	        3) ssh $shuser@$s3 -p $sp; return 0 ;;
	        4) ssh $shuser@$s4 -p $sp; return 0 ;;
		0) return 0 ;;
		*) echo -e $red"Wrong option."$clear; WrongCommand;;
        esac
}




cdcd() {
l -d */; psp read -ep "$c2 "$rev"goto:$re " -i "$PWD" "goto"; 
mkdir -p $folder -m 775 2>/dev/null;
cd $goto; echo -e "\n\t $cyan$bold> $pink$PWD$cyan <$re\n\t * * * *\n"; ls -caklhuptr --group-directories-first;
}

####



ipsnet() {
ipsnet=($(ip n | grep -v FAILED|tr -s "[:alpha:]" "\t"|cut -c1-11|head -n-1|tr -d "\n\t")); 
echo ${ipsnet[@]}
}

#  for i in ${ipsnet[@]}; do nc -N $i 22 -w1 -v||(tput setaf 1 cuu1; echo -e " NO $re";) done



ipnet() {
iplocal=$(ifconfig|grep "4163" -n1|tail -n1|cut -c16-29|tr -d " [:alpha:]"); 
ipbase=${iplocal%.*}; echo $ipbase
for ip in $ipbase.{1..54}; do
ping -c 1 -W 1 $ip &
done | sed -nE 's:^.* from ([0-9.]+).*time=(.*s)$:\1 (\2):p'
wait
}

#scan()
#{
#
#baseip=$(arp -a) && baseip=${baseip%%\)*} && baseip=${baseip##*\(}
#baseip=$(ip -o -f inet addr show|grep "scope global") && \
#baseip=${baseip##* inet} && baseip=${baseip%%/*}; baseip=${baseip%.*}
#echo $baseip
#
#for ip in $baseip.{1..54}; do
#ping -c 1 -W 1 $ip &
#done | sed -nE 's:^.* from ([0-9.]+).*time=(.*s)$:\1 (\2):p'
#wait
#fi
#}

# if [ $1 ]; then
# for baseip; do
# scan $baseip
# done
# else
# baseip=$(arp -a) && \
# baseip=${baseip%%\)*} && baseip=${baseip##*\(}
# if [ $baseip"" == "" ] ; then
# baseip=$(ip -o -f inet addr show|grep "scope global") && \
# baseip=${baseip##* inet} && baseip=${baseip%%/*}
# fi
# baseip=${baseip%.*}
# scan $baseip 
# fi

coolors() {
#!/bin/bash
for ((i=0; i<256; i++)) ;do
echo -n '  '
tput setab $i
tput setaf $(( ( (i>231&&i<244 ) || ( (i<17)&& (i%8<2)) ||
(i>16&&i<232)&& ((i-16)%6 <(i<100?3:2) ) && ((i-16)%36<15) )?7:16))
printf " C %03d " $i
tput op
(( ((i<16||i>231) && ((i+1)%8==0)) || ((i>16&&i<232)&& ((i-15)%6==0)) )) &&
printf " " ''
done
echo;echo;
}
###########
## sup - show basic info
sup() {
echo -e "\n\t $redb running: $re$gray";
sudo w -o;
echo -e "\n\t $yellowb running-processess: $re$gray";
sudo ps -la
echo -e "\n\t$blueb login-attempts: $re$gray";
sudo lastb -an8
echo -e "\n\t $cyanb login-users: $re$gray";
sudo last -an8
echo -e "\n$re";
}
#cmd() {
#cat /ants/cmd.sh|shuf -n1;
#read -ep "$c2 new cmd: " "cmd"
#echo -e "$cmd"; >> "/ants/cmd.sh";
#}
###########
## timer - countdown
klockan () { while true; do tput sc; tput cup 0 $((COLUMNS - 42)); tput setaf $(echo $LINENO) 2>/dev/null; date +%F%t$(tput setaf $(date +%u))%A$(tput setaf $(date +%S))%t%R:%S; tput rc; sleep 1; done& } 

timer() {
#!/bin/bash
GREEN='\033[0;32m'
RED='\033[0;31m'
YELLOW='\033[0;33m'
RESET='\033[0m'
hour=0
min=0
sec=22
pppp pppp pppp pppp 
read -ep "$c2 Hours: " -i "$hour" "hour";
read -ep  "$up1$c2 Minutes: " -i "$min" "min";
read -ep  "$up1$c2 Seconds: " -i "$sec" "sec";
echo -ne "$up1";
tput civis
echo -ne "${GREEN}"
while [ $hour -ge 0 ]; do
while [ $min -ge 0 ]; do
while [ $sec -ge 0 ]; do
if [ "$hour" -eq "0" ] && [ "$min" -eq "0" ]; then
echo -ne "${YELLOW}"
fi
if [ "$hour" -eq "0" ] && [ "$min" -eq "0" ] && [ "$sec" -le "10" ]; then
echo -ne "${RED}"
fi
echo -ne "                $(printf "%02d" $hour):$(printf "%02d" $min):$(printf "%02d" $sec)\033[0K\r"
let "sec=sec-1"
sleep 1
done
sec=59
let "min=min-1"
done
min=59
let "hour=hour-1"
done
echo -e "${RESET}"
tput cnorm
}
###########
## db_new - create new mysql database
dbnew() {
#!/bin/bash
## new_db
##
d1="$(date +%h%d%y-%S)"; read -ep "$c2 DB User: " -i "$SUDO_USER" "dbu" ; read -ep "$c2 New DB: " -i "$d1" "d1"; echo -e "\n $green $d1 $re";
sudo mysql -e"CREATE USER $dbu;flush privileges;SHOW DATABASES;";
sudo mysql -u $dbu -p -e"CREATE DATABASE IF NOT EXISTS $d1;flush privileges;SHOW DATABASES;";
echo -e "\n $cyan $d1 $re \n\n";
##
##
}
###########
###########
## wotd - word of the day
wotd() {
RANDOMWORD=($(cat /usr/share/dict/words))
woord=$(echo ${RANDOMWORD[$((RANDOM%${#RANDOMWORD[@]}))]})
echo $woord|tr -d "''";
}
###########
## loginscreen - change default login screen
loginscreen() {
sudo systemctl enable multi-user.target 2>/dev/null;
read -n1 -ep "$c2 Choose default login mode: [G]/[T]" lsls
if [ $lsls == g ]; then 
sudo systemctl set-default graphical.target
else sudo systemctl set-default multi-user.target
fi
}
###########
## pro - task loaading animation
pro() {
####
alias tf='tput setaf $((RANDOM%16));'
alias tb='tput setab $((RANDOM%16));'
c2="$cyan --$re"; tput civis;
$1 $2 $3 $4 $5 $6 $pro &>/dev/null & disown; tput cuu 8; tput ed; tput cud 2; PROC_ID=$!; while kill -0 "$PROC_ID"&>/dev/null; 
do for X in "[        ]" "[$(tf)=$re       ]" "[$(tf)==$re      ]" "[$(tf)===$re     ]" "[$(tf)====    $re]"  "[ $(tf)====   $re]" \
"[  $(tf)====$re  ]" "[   $(tf)==== $re]" "[    $(tf)====$re]" "[     "$(tf)"===$re]" "[      "$(tf)"=="$re"]" "[       =]" "[        ]" "[        ]" "[        ]"; 
do echo -e "  [$(tb)  $re]$c2 Executing $rev $1 $2 $3 $4 $pro $re"$c2" $X"; tput cuu1; sleep 0.08; done; done;
echo -e "\t\t\t\t\t\t [  "$green"DONE"$re"  ] \n\n\n\n\n"; tput cnorm;
}
###########
## show loaded state
#yno() {
#if [ -z "$1" ]; 
#then echo -e "\n\t $c2 Try$dim ["$re"yno question? command 1"$dim"]$re and use quotes...\n"; fi; 
#echo -e "\n\n\t $re$c2 $1 $white$dim["$re$bold"Y$dim/"$re$bold"n$dim]$re $(tput sc)\n\n\n\n"; 
#tput rc cuu 5; read -n1 yn; 
#if [ "$yn" == "${yn#[Nn]}" ]; then echo -en "\t $c2 OK"; pro $2 $3 $4 $5 ; else echo "nope"; fi;  
#}
zzzz() { 
for i in {1..22}; do 
tput indn $LINES; tput civis; 
tput cup $((RANDOM%$LINES-12)); 
fortune|/usr/games/fortune|/usr/games/cowthink -f ${cows[$((RANDOM%${#cows[@]}))]}|pr --omit-header --indent="$((RANDOM%COLUMNS*8/6))"|lolcat -s 222 -p 666 -a; 
tput cnorm; tput cup 0; sleep 4;
done; 
}
own() {
if [ $UID = 0 ]; 
then echo -e "\t $SUDO_USER own /ants/"; sudo chown $SUDO_USER:ants /ants -R; sudo chmod 775 /ants -R;
else echo -e "\t $USER own /ants/"; sudo chown $USER:ants /ants -R; sudo chmod 775 /ants -R; 
fi;
}
owns() {
if [ $UID = 0 ]; 
then echo -e "\t $SUDO_USER own /home/$SUDO_USER"; sudo chown $SUDO_USER:ants /home/$SUDO_USER -R; sudo chmod 775 /home/$SUDO_USER  -R;
else echo -e "\t $USER own/home/$USER"; sudo chown $USER:ants /home/$USER -R; sudo chmod 775/home/$USER -R; 
fi;
}
qqqq() {
sudo chmod 775 /gh/qqqq -R; sudo chown aa /gh/qqqq -R; cd /gh/qqqq/; git pull; ls -Atlcr;
pp=$(pwd); read -ep " $c2 create? " -i "/gh/qqqq/$(wotd|tr -s "[:upper:]" "[:lower:]"|tr -d "' '").txt" "qaqa";
micro $qaqa; cd /gh/qqqq/; git add -A; git commit -a -m $(wotd); git pull; git push; cd $pp; ls -Altr; sudo chmod 775 /gh/qqqq -R;
}
githubs() {
sudo apt -y install git gh 2>/dev/null;
qq="Auth Github";
echo -e "\n\n\t $re$c2 $qq $white$dim["$re$bold"Y$dim/"$re$bold"n$dim]$re $(tput sc)\n\n\n\n"; read -n1 yn; 
if [ "$yn" == "${yn#[Nn]}" ]; then echo -en "\t $c2 OK"; 
gpg -o /tmp/gh.txt -d /ants/sh/gh.gpg;
gh auth login --with-token < /tmp/gh.txt;
gh auth status; echo; rm /tmp/gh.txt;
gh config set git_protocol ssh;
##
read -ep "gh email: " -i "hello@aeniks.com" "ghmail";
read -ep "gh name: " -i "aeniks" "ghname";
git config --global user.email $ghmail
git config --global user.name $ghname
else echo " nope "; fi; echo ok;
##
##
sudo cp /ants/sh/aa.gpg /ants/sh/aa.pub ~/.ssh/;
if [ $UID = 0 ]; 
then echo -e "\t $SUDO_USER own ~/.ssh"; 
sudo chown $SUDO_USER:ants ~/.ssh -R; sudo chmod 775 /gh/qqqq -R;
else echo -e "\t $USER ~/.ssh"; 
sudo chown $USER:ants ~/.ssh -R; sudo chmod 775 /gh/qqqq -R; 
fi; 
####
sudo chmod 775 ~/.ssh/aa.pub; sudo chmod 600 ~/.ssh/aa.gpg;
gpg -o ~/.ssh/aa.key -d ~/.ssh/aa.gpg;
sudo chmod 600 ~/.ssh/aa.key;
ssh-add ~/.ssh/aa.key;
}

githut() {
sshp=$(wotd|tr -d "''"|tr "[:upper:]" "[:lower:]"); 
ssh-keygen -f $HOME/.ssh/$sshp -N ""; 
gh ssh-key add "$HOME/.ssh/$sshp.pub"
ssh-add $HOME/.ssh/$sshp;
}


mkv() {
echo -e "\n\t $c2 convert $green$(find -iname *.mkv)$re to *.mp4?: "; read; 
for i in $(find -iname *.mkv); do
ffmpeg -i "$i" -codec copy "${i%.*}.mp4"; rm $i; 
done
}
owset() {
cd /home;
read -ep "$c2 Update rights on $(ls)" "yy";
for i in $(ls);
do sudo chown $i: $i -R; done; 
}
popo() {
echo -ne "\n$(ls|tail -n8) \n\t$c2 Choose file to upload: "; read -ep "" -i "$PWD/" popo;
sudo cp "$popo" /gh/qqqq/; sudo chown aa:ants /gh/qqqq -R; 
sudo chmod 775 /gh/qqqq -R; sudo chown aa /gh/qqqq -R; cd /gh/qqqq/; 
ls * -Atrhsw1; 
pp=$(pwd); read -ep " $c2 create? " -i "/gh/qqqq/$(ls -Atrw1|tail -n 1)" "qaqa";
cd /gh/qqqq/; git add -A; git commit -a -m "added $qaqa"; 
git pull; git push; 
cd $pp; ls -Atrlhkw1; sudo chmod 775 /gh/qqqq -R;
echo -e "\n\t$c2 Visit:$cyan https://github.com/aeniks/qqqq/raw/main/$(ls * -Atrw1|tail -n1)\n\n"
}
