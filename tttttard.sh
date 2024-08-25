
for i in {1..99}; do echo -e "\e[H\e[48m"; 
jp2a media/tard.jpg --color-depth=8 --chars="  $(echo -e "$SRANDOM$SRANDOM"|tr -s "0-9" " -_")"; 
sleep .1; done
