#/bin/bash
# Installs basic apps and functions
tput dim; 
sudo apt update; sudo apt upgrade -y;
##################
sudo apt -y install \
net-tools \
lolcat \
fortunes \
fortune-mod \
cowsay \
neofetch \
mc \
btop \


; 


##############
echo;echo;
#echo "${cows[$((RANDOM%${#cows[@]}))]}"
fortunes=$(ls /usr/share/games/fortunes)
cows=($(ls /usr/share/cowsay/cows|sed s/.cow//g)); 
#alias qqqq='/usr/games/fortune|/usr/games/cowthink -f ${cows[$((RANDOM%${#cows[@]}))]}|lolcat;'
sudo cp /ants/sh/ssss.sh /bin/ssss;
sudo chown $SUDO_USER:$USER /bin/ssss;
echo "ok";
