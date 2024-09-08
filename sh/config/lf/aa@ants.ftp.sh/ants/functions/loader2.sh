#/bin/bash
## LOADING_ANIMATIONS
loader2() {
BLA_passing_dots=( 0.1 '     '  '     ' '.    ' '..   ' '...  ' ' ... ' '  ...' '   ..' '     ' '     ' '     ' )
#\e[?25l";
declare -a BLA_active_loading_animation; 
BLA::play_loading_animation_loop() {
while true; do for frame in "${BLA_active_loading_animation[@]}"; do
printf "\e7"; 
printf "\e[$((LINES/2))H\e[2;40m"; 
printf "\e[$((COLUMNS/2-12))G          \n"; 
printf "\e[$((COLUMNS/2-12))G [ \e[0;40;3$((RANDOM%6+1))m${frame}\e[2;37;40m] \n"; 
printf "\e[$((COLUMNS/2-12))G          \n"; 
printf "\e8"; 
sleep "${BLA_loading_animation_frame_interval}"; 
done; done; 
}
BLA::start_loading_animation() {
BLA_active_loading_animation=( "${@}" ); 
BLA_loading_animation_frame_interval="${BLA_active_loading_animation[0]}"; 
unset "BLA_active_loading_animation[0]"; 
BLA::play_loading_animation_loop & disown; 
printf "\eM\e[0K"; 
BLA_loading_animation_pid="${!}"; 
}
BLA::stop_loading_animation() {
kill "${BLA_loading_animation_pid}" &>/dev/null; 
printf "\e[?25h\e[0m"; 
}
trap BLA::stop_loading_animation SIGINT;
BLA::start_loading_animation "${BLA_passing_dots[@]}";
${@}; 
BLA::stop_loading_animation
printf "\e[?25h\e[0m"; 
}
