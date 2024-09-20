beggn() { sleep 2; 
printf "\e[2;$((COLUMNS/2))H\e[1;38;5;67;40m $(timeout 1 lsb_release -ds) \e[0m";  
printf "\e[3;$((COLUMNS/2))H\e[0;2;37;40m $TERM_PROGRAM \e[0;1;97;40m-\e[0;2;37;40m $0 \e[0;1;97;40m-\e[0;2;37;40m $TERM \e[0m"; 
printf "\e[4;$((COLUMNS/2))H\e[38;5;24;40m $(ip l|grep -m 1 -w "link/ether"|cut -f6-6 -d " ";) \e[0m"; 
printf "\e[5;$((COLUMNS/2))H\e[92;40m $(date) \e[0m"; 
printf "\e[6;$((COLUMNS/2))H\e[31;40m $(hostname --all-ip-addresses 2>/dev/null|cut -f1 -d" "
) \e[0;1;97;40m-\e[0;94;40m $(curl -s ip.me -4) \e[0m"; 
printf "\e[7;$((COLUMNS/2))H\e[96;40m $USER \e[97m@\e[95;40m $HOSTNAME \e8\n"; }; 
