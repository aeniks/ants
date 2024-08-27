#!/bin/bash 
# Authenticates github

sudo apt install gpg git gh -qqy 2>/dev/null;
printf "\n$c2 ants folder:"; read -rep " " -i "$ants" "ants"; 
gpg -o /tmp/gh.txt -d $ants/sh/config/gh_aeniks.gpg
gh auth login --with-token < /tmp/gh.txt;
gh auth status; echo; rm /tmp/gh.txt; 
printf "\n$c2 gh username:"; read -rep " " -i "$aeniks" "ghuser"; 
git config --global user.name $ghuser; 
printf "\n$c2 gh user mail:"; read -rep " " -i "$ghuser@" "ghmail"; 
git config --global user.email $ghuser; 
git config --global init.defaultBranch main; 
##
printf "new gh key?; "; read; 
[ "$(id -u)" -eq 0 ]&& (echo "cant be root"; read );
read -rep "name for key: " -i "$(hostname)" "githubs";
read -rep "gh email/login: " -i "$ghmail" "ghmail";
echo 'Host *
ForwardAgent yes
' >> ~/.ssh/config;
ssh-keygen -C $ghmail;
chmod 600 ~/.ssh/$githubs; 
eval "$(ssh-agent -s)"; 
ssh-add ~/.ssh/$githubs;
gh ssh-key add id_ed25519.pub --type authentication --title $githubs;
sudo systemctl restart ssh;
ssh -T git@github.com;
