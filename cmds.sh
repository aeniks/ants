whatis (1)           - display one-line manual page descriptions
showkey (1)          - examine the codes sent by the keyboard
showconsolefont (8)  - Show the current EGA/VGA console screen font





OOSS=($(cat "/etc/os-release"|tr " " "_"|tr -d '""'))
for i in ${!OOSS[@]}; do printf -v "OS_${OOSS[i]/=*}" "${OOSS[i]/*=}"; done 
printf "${OS_ID_LIKE^} ${OS_ID^} ${OS_VERSIO}";
