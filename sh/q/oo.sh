#!/bin/bash
## selection menu 
oo() { unset ops ms; local ops=($(cat $ants/sh/q/.figz.sh)); 
local prompt="$1" index="0" cur="0" count="${#ops[@]}" esc=$(echo -ne "\e");
printf "\e[?25l    --$prompt--\n";   ## print prompt
for o in "${ops[@]//.*/}"; do echo -e "    $o  "; done; 
printf "\e[${count}A\e7\e[22G\e[?25h"; 
read -rep "message: " -i "$ms" "ms"; printf "\e[?25l\e[1A";
while true; do local index="0"; for o in "${ops[@]//.*/}"; ## print options
do if [ "$index" = "$cur" ]; then echo -e " > \e[7m $o \e[0m"; ## mark & highlight the current option
# figlet -r -f $sel "$ms"|batcat -ppfl zig; 
else echo -e "    $o  "; fi; (( index++ )); done; ## list all options (option list is zero-based)
read -srn1 key; ## wait for user to key in arrows or ENTER
if [ "$key" = A ]; then (( cur-- )); (( cur < 0 ))&& (( cur = 0 )); 
elif [ "$key" = B ]; then (( cur++ )); (( cur >= count ))&& (( cur = count - 1 )); 
elif [ "$key" = C ]; then printf "\e8\e[22G\e[?25h"; 
read -rep "message: " -i "$ms" "ms";  printf "\e[?25l";
elif [ "$key" = "" ]; then break; 
elif [ "$key" = "q" ]; then printf "\e[?25h\n"; return; fi; # en
printf "\e8"; 
# printf "\e[${count}A"; 
done; 
# go up to the beginning to re-render
printf -v sel "${ops[$cur]}"; printf  "\e[?25h\n \e[7m $sel \e[0m\n"; 
##########################################################
printf "\n"; figlet -rf $sel "$ms"|batcat -ppfl zig; printf "\n\n"; return; #####
##########################################################
}; 

oo

#if [ "$(printf "${ops[$cur]}"|grep "/")" ]; 
#then q "${ops[$cur]}" "$(ls -p $ants/sh/q/${ops[$cur]})"; fi; 

##for i in $ants/sh/q/*; do . $i; done; 


# op2c=($(cat .q.sh | cut -f-1 -d"#"|tr -d '"'))
# op2d=($(cat .q.sh | cut -f2- -d"#"))
# 
# printf "\n\n"
# printf " c -- ${op2c[*]} \	
# printf " d -- ${op2d[*]} \n"
# 
