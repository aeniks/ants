#!/bin/bash
## selection menu 
oo() { unset ops ms; ops=($(cat $ants/sh/figz.sh)); 
prompt="$1" index="0" cur="0" count="${#ops[@]}";
printf "\e[H\e[0J\e[?25l    --$prompt--\n";   ## print prompt
for o in "${ops[@]//.*/}"; do printf "    $o  "; done; 
printf "\e[${count}A\e7\e[22G\e[?25h"; 
# printf "\n\n\n\n\n\n"; 
read -rep "message: " -i "$ms" "ms"; printf "\e[?25l\e[1A";
while true; do local index="0"; for o in "${ops[@]//.*/}"; ## print options
do if [ "$index" = "$cur" ]; then printf " > \e[7m $o \e[0m"; 
printf "\e[${count}B\e[22G"; figlet -r -f "${ops[$cur]}" "$ms"|batcat -ppfl zig; 
## mark & highlight the current option
else printf "    $o  "; fi; (( index++ )); done; ## list all options (option list is zero-based)
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
