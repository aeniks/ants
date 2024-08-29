#/bin/bash
## LOADING_ANIMATIONS
loader() {
printf "\e7\e[s";
[ -e /bin/tput ]|| apt install ncurses-utils &>/dev/null;
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
BLA_passing_dots=( 0.1 '.   ' '..  ' '... ' ' ...' '  ..' '   .' '    ' '    ' '    ' )
##
echo -ne "\e7"; tput civis;
declare -a BLA_active_loading_animation; 
size=($(stty size));
for i in {1..4}; do echo -ne "\e[$((size/2-3+$i));$((size[1]/2-8))H\e[40m                  \e[0m\n"; done
BLA::play_loading_animation_loop() {
while true; do for frame in "${BLA_active_loading_animation[@]}"; do
echo -ne "\e[$((size/2));$((size[1]/2-5))H\e[2;40m \
[ \e[0;40;3$((RANDOM%6+1))m${frame}\
\e[2;37;40m] $re"
sleep "${BLA_loading_animation_frame_interval}"; done; done; 
}
BLA::start_loading_animation() {
BLA_active_loading_animation=( "${@}" ); 
BLA_loading_animation_frame_interval="${BLA_active_loading_animation[0]}"; 
unset "BLA_active_loading_animation[0]"; 
BLA::play_loading_animation_loop & disown; echo -e "\eM\e[0K"
echo -ne "\e[$((size/2-1));$((size[1]/2-5))H\e[2;5;40;39m loading\e[0;40;37m...    "; 
BLA_loading_animation_pid="${!}"; 
}
BLA::stop_loading_animation() {
kill "${BLA_loading_animation_pid}" &> /dev/null; 
echo -ne "\e[$((size/2-1));$((size[1]/2-5))H\e[0;40;37m -\e[40;32m done ✔ \e[40;37m- "; 
tput cnorm; echo -ne "\e[0m"; 
}
trap BLA::stop_loading_animation SIGINT
BLA::start_loading_animation "${BLA_passing_dots[@]}"
sleep 1; 
echo -ne "\e[0m\e[$((size/2+2));$((size[1]/2-8))H\e[2;40;39m working on...    \e[0m"; 
echo -ne "\e[0m\e[$((size/2+3));$((size[1]/2-8))H\e[2;40;39m $(printf "$1"|tail -c 16) \e[0m"; 
printf "\e8\e[u"; $1; 
sleep 1; echo -ne "\e[$((size/2+1));$((size[1]/2-8))H\e[0;40;39m almost ...       \e[0m"; 
sleep 1; echo -ne "\e[$((size/2+2));$((size[1]/2-8))H\e[0;40m           "; 
BLA::stop_loading_animation
echo -e "\e8"; 
}
