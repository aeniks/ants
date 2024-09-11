#/bin/bash
## LOADING_ANIMATIONS
loader() {
BLA_metro=( 0.1 \
'       ' \
'=      ' \
'==     ' \
'===    ' \
' ===   ' \
'  ===  ' \
'    ===' \
'     ==' \
'      =' \
'       ' \
'       ' \
'       ' \
'       ' \
'       ' \
)
##\e[0;40m
BLA_passing_dots=( 0.25 '.  ' '.. ' '...' ' ..' '  .' '   ' )
##
declare -a BLA_active_loading_animation; size=($(stty size));
BLA::play_loading_animation_loop() {
while true; do for frame in "${BLA_active_loading_animation[@]}"; do
printf "\r\e[$((size/2));$((size[1]/2-8))H%s" \
"$(echo -e "\e[2;40m[ \e[0;40;3$((RANDOM%6+1))m")${frame}$(echo -e "\e[2;37;40m]$re ")"
sleep "${BLA_loading_animation_frame_interval}"; done; done; 
}

BLA::start_loading_animation() {
BLA_active_loading_animation=( "${@}" ); 
BLA_loading_animation_frame_interval="${BLA_active_loading_animation[0]}"; 
unset "BLA_active_loading_animation[0]"; 
echo -ne "\e7"; tput civis;
BLA::play_loading_animation_loop & disown; echo -e "\eM\e[0K"
printf "\r\e[$((size/2-1));$((size[1]/2-8))H\e[2;5;39m%s" "loading${re}... "; 
BLA_loading_animation_pid="${!}"; 
}
BLA::stop_loading_animation() {
kill "${BLA_loading_animation_pid}" &> /dev/null; 
printf "\r\e[$((size/2-1));$((size[1]/2-8))H\e[0;32m%s" "done "; echo -e "\e[0m\e[0K\n\eM\e[0K";
tput cnorm; echo -ne "\e[0m"; 
}
trap BLA::stop_loading_animation SIGINT
BLA::start_loading_animation "${BLA_metro[@]}"
sleep 1; echo -ne "\e[0K working on $1 ... "; 
$1 &>/dev/null; 
sleep 1; echo -ne " almost ... \e[0K"; 
sleep 1; echo -ne "$green done$re ✔ ... \e[0K"; 
BLA::stop_loading_animation
echo -ne "\e8"; 
}
