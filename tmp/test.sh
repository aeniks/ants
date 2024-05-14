#/bin/bash 
frejm() {
cmn=$(tput cols)
cmn=$((cmn/2-28))
echo $cmn
tput civis;
tput cup 6 $cmn ed; 
for i in {1..44}; do tput setaf $((41+i*i)); echo -ne "o"; sleep .01; 
done; 
echo -ne "\v\b \v\b "; echo -ne "\v\b \v\bo"; 
for i in {1..43}; 
do  tput setaf $((65+i*i)); echo -ne "\b\bo"; sleep .01; 
done; 
tput cuu1; echo -ne "\b "; tput cuu1; echo -ne "\b "; 
tput cuu1; echo -ne "\b "; tput cuu1; echo -ne "\bo"; 
tput cup 8 $cmn; 
echo -ne "    -- Welcome to the ants installer! --"|lolcat -a -s 2 -F .1 -p 22;
####
#sleep 1;
tput cup 6 $cmn; 
for i in {1..44}; do tput setaf $((i+188)); echo -ne "o"; sleep .01; 
done; 
echo -ne "\v\bo\v\bo"; echo -ne "\v\bo\v\bo"; 
for i in {1..43}; 
do  tput setaf $((i+8*i)); echo -ne "\b\bo"; sleep .01; 
done; 
tput cuu1 setaf 99; echo -ne "\bo"; tput cuu1; echo -ne "\bo"; 
tput cuu1 setaf 19; echo -ne "\bo"; tput cuu1; echo -ne "\bo"; 
tput cuu1 setaf 19; echo -ne "\bo"; tput cuu1; echo -ne "\bo"; 
####
tput cnorm;
tput cud 12;
}
frejm