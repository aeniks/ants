yo() { 

if ! [ -x "$(command -v figlet)" ]; then read -rep "$c2 dl figlet? " -i "y" kk; 
apt install figlet -y >/dev/null||sudo apt install figlet -y >/dev/null; fi; 
[ $1 ]||read -rep "$c2 yo: " "mx"; figlet -c -f block "$mx$1" 2>/dev/null||figlet-figlet \
-c -f block "$mx$1"; unset mx kk; }

read -rep ">_ " "msg"; echo;echo;figlet -f Big_Money-ne "$msg"|batcat -ppfl Zig;echo;echo; 
yo


