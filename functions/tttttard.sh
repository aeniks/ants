tards() {
for i in {1..99}; do 
echo -e "\[25?l\e[H\e[48m"; 
pic=${1}; [ $1 ]||local pic="$ants/media/tard.jpg";
jp2a $pic --color-depth=8 --chars="  $(echo -e "$SRANDOM$SRANDOM$SRANDOM$SRANDOM")"|pv --quiet --rate-limit 2222; 
done; echo -e "\[25?h"
}
