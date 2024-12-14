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
echo -ne "\e7\e[2;40m[\e[0;40;3$((RANDOM%6+1))m${frame}\e[2;37;40m]\e8"; 
sleep "${BLA_loading_animation_frame_interval}"; done; done; 
}

BLA::start_loading_animation() {
BLA_active_loading_animation=( "${@}" ); 
BLA_loading_animation_frame_interval="${BLA_active_loading_animation[0]}"; 
unset "BLA_active_loading_animation[0]"; 
#echo -ne "\e7"; save cursor
tput civis;
BLA::play_loading_animation_loop & disown; echo -e "\eM\e[0K"
echo -ne "\e[2;5;39mloading${re}... "; 
BLA_loading_animation_pid="${!}"; 
}
BLA::stop_loading_animation() {
kill "${BLA_loading_animation_pid}" &> /dev/null; 
}
trap BLA::stop_loading_animation SIGINT
BLA::start_loading_animation "${BLA_metro[@]}"
sleep 1; echo -ne "\e7\n\e[0K working on $1 ... "; 
$1 &>/dev/null; 
sleep 1; echo -ne "\e7\n almost ... \e[0K\e8"; 
sleep 1; echo -ne "\e7\n$green done$re ✔ ... \e[0K\e8"; 
#echo -e "\e[0m\e[0K\n\eM\e[0K";
BLA::stop_loading_animation
tput cnorm; echo -ne "\e[0m\r"; 
#echo -ne "\e8"; reset cursor
}
