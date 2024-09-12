#!/bin/bash
## folder view with preview
catty() {
unset oldir cd ls dir ee; dir="$1"; 
if [ $dir ]; then oldir="$PWD"; cd $1; dir="$PWD"; else read -t 2 -rep "$c2 folder: " -i "$PWD" "dir"; fi
seps=" $cyan$dim -------------------------$re"; 
ee=($(ls $dir -p1fA)); ee=(${ee[@]///}); echo "${ee[@]}";
echo -e "\n\n$seps\n $c2 $green$dir$re\n$seps";
for i in ${ee[@]///}; do ls="$(file -bi $i)"; echo -e "$re $c2$bold $i$c2 $ls\n$seps$dim";
ls="$(file -ib $i|head -c4)"; if [ $ls = "text" ]; then 
echo -e "$(head -n8 $i) \n\t\e[34m -- $re$dim\n$(tail -n8 $i)"|pr --omit-header --indent=0 --page-width=$((COLUMNS-8)) --indent=2
fi; if [ $ls = "imag" ]; then jp2a $i --color-depth=8 --width=$((COLUMNS-16))|pr --omit-header --indent 8||echo -e " $c2 install jp2a "; fi
echo -e "$seps"; done; [ $oldir ]&& cd $oldir;
}
