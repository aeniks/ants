tards() {
for i in {1..99}; do echo -e "\e[H\e[48m"; 
pic=${1}; [ $1 ]||local pic="$ants/media/tard.jpg";
jp2a $pic --color-depth=8 --chars="  $(echo -e "$SRANDOM$SRANDOM$SRANDOM$SRANDOM"|tr -s "0-9" " -_")"; 
sleep .1; done
}
