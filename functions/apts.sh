


rs() {
printf "\e[A\e[2K\n\e[7m rsync files: \e[0m"; 
rs="$(ls -ptr|grep -v '/'|fzf --height='22%' --scroll-off=12 -m --info=inline)"
echo;
rsto="$(ls $ants/sh/config/ssh|fzf --info=inline --height='~' --scroll-off=12 \
--header '-- ssh to: --' --header-first)"
[ "${rsto}" = "new" ]&& printf "to:"; read -re "rsto"; 
rsync -Pa --info=name1 ${rs[*]} ${rsto}; echo; 
} 
