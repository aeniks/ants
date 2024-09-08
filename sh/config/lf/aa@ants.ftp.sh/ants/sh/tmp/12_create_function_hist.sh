12_savelastcmd() {
#echo -e "create: \
#${cyan}$(history|cut  -b6-|tail -n2|head -n1|tr -s '  ' "\n"|head -n1;)"; 
#read -rep " " -i "y" "kkkk";
echo -e "$c2 create: ${cyan} \n\n $(history|cut  -c6-|tail -n2|head -n1) \n\n ? "; 
read -rep " " -i "y" "kkkk"; 
echo -e "\n\n #$(date)\n\n
$(history|cut  -b6-|tail -n2|head -n1)
\n" >> ~/functions.d/new.sh; echo -e "${cyan}created: ${re}$(tail -n4 ~/functions.d//new.sh)"; 
}
