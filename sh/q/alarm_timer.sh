#!/bin/bash
## alarm timer
qalarm() {
qalarma() {
ppp=$(timeout 1 notify-send -u critical aa -p)
kdeconnect-cli -d "fb1c649a_3a0c_4297_ae12_b0cf5cb558b8" --ring& 
for i in {1..8}; do echo gg; timeout 1 kdeconnect-cli -d "fb1c649a_3a0c_4297_ae12_b0cf5cb558b8" --ping-msg "${an} kk"; 
sudo wall --nobanner "${an}"; 
$(timeout 2 notify-send -u critical -a "${an} $ppp" -r "$ppp" -A "return"="TURN OFF $ppp" "$an $ppp $(date) ")
echo gg; done 
} 

########################################
## variables for color etc #############
al=$(date +%H%M); an="alarm 1"; bb='\e[32m'; bm='\e[34m'; dim='\e[2m'; 
cyan='\e[1;36m'; pink='\e[1;35m'; rev='\e[7m'; re='\e[0m'; bo='\e[1m'
########################################
## actual alarm ########################
######################################
########################################
## prompt ##############################
printf "\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\e[14A
  \e[1mWelcome to: ${cyan}bash${re}-${pink}alarm${re}!
${dim}    ----------${re}\n\n\n\n\n\n\n\n\n\e[8A"
printf "${re}${bo}  Alarm ${bm}time${re}${dim}:${cyan}"; 
read -rep " " -i "${al}" "al"; 
printf "${re}${bo}  Alarm ${bb}name${re}${dim}:${pink}"; 
read -rep " " -i "${an}" "an"; 
printf "${re}${dim}    ----------${re}\n"; 
printf "${re}${bo}  Your Alarm: ${pink}${rev} ${an} ${re} is set to ${bb}${al:0:2}${re}:${bm}${al:2:2} ${re}\n";
printf "${re}${dim}    ----------${re}\n\n"; 
########################################
## timer checks every 25 seconds #######
while true; do sleep 5; [ "$(date +%H%M)" -eq "${al}" ]&& qalarma; return; done & disown; 
########################################
}
## end alarm

qalarm 

# 
#     -----------------------------------${dim}
#   To set alarm time: Enter a 4-digit time-code 
#   [HHMM] with no separators. Or just type: 
#   [alarm 1445 alarm-name] to skip this prompt. 
#     ${re}-----------------------------------${dim}
#   Example: ${dim}[${bb}1645${re}${dim}] (sets alarm to quarter to five.)
#   Example: ${dim}[${bm}0800${re}${dim}] (sets alarm to eight AM.)


































