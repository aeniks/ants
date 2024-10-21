


rs() {
printf "\e[A\e[2K\e[7m rsync files: \e[0m\n"; 
rs="$(ls -ptr|grep -v '/'|fzf --height='22%' --scroll-off=12 -m --info=inline)"; 
printf "\e[A\e[2K\e[7m rsync reciever: \e[0m\n"; 
rsto="$(ls $ants/sh/config/ssh|fzf --info=inline --height='~12' --scroll-off=12 --header '-- ssh to: --')"; 

printf "\e[A\e[2K\n -- \n -- to: "; 
[ "${rsto}" = "new" ] && read -rep " " -i "192.168.0.10" 'rsto'; 
read -rep " " -i "$rsto" 'rsto'; 
printf "\e[A\e[2K\n -- ${rsto} \n -- user: "; 
read -rep " " -i 'aa' 'rsuser'; 
printf " -- folder: "; 
read -rep " " -i '~/rs/' 'rsfold'; 
rsync -a --info=name1 ${rs[*]} ${rsuser}@${rsto}:${rsfold} ; 
printf "\n\e[7m$rsuser@$rsto:$rsfold\e[0m\n";
ssh "$rsuser"@"$rsto" 'printf "$HOME/'"${rsfold/\~/}"'\n"; ls -ptcr '"$rsfold"'|tail -n12'
} 



