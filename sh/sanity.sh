#!/data/data/com.termux/files/usr/bin/bash
## detox filenames
sanity() { c2="$(echo -e "\e[36m --\e[0m")"; [ $1 ]&& cd $1; read -n1 -rep "$c2 Sanitize $cyan$PWD$re
$c2 fast[f]orward? or [c]heck first?" "kjda"; if [ $kjda = "c" ]; 
then find ./ -type f | cat -n | while read n f; do 
echo -e "$f ==>> "$(echo $f | sed "s/[ ()\'~,]//g")""; 
done; read -n1 -rep "$c2 Are these changes ok? n / y " "baba"; fi; 
if [ $baba = "y" ]; then find ./ -type f | cat -n | while read n f; 
do mv -nv "$f" "$(echo $f | sed "s/[ ()\'~,]//g")"; done; fi; echo -e "ok"; } 
