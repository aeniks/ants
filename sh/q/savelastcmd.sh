#!/bin/bash
savelastcmd() {
echo -e "$c2 create: ${cyan} \n\n $(history|cut  -c6-|tail -n2|head -n1) $re\n\n ? "; 
read -rep " " -i "y" "kkkk"; read -rep "$c2 where?: " -i "$PWD" "where"
echo -e "\n\n #$(date)\n
$(history|cut  -b6-|tail -n2|head -n1)\n" >> $where; echo -e "${cyan}created: ${re}$where\n$(tail -n4 $where)"; 
}
savelastcmd
