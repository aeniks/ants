#!/bin/bash
## get figlet & download figlet fonts
apt install figlet -y||sudo apt install figlet -y; 
git clone https://github.com/hIMEI29A/FigletFonts.git figletfonts; 
cd figletfonts; make; cd /usr/share/figlet; 
mkdir -p ~/tmp; for i in *; do figlet -f "$i" "aa$(date)"&>/dev/null||sudo mv $i ~/tmp/; done
printf "\n"; figlet -c "all good!"; printf "\n";

