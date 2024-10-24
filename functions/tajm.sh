
tajm() {
printf "\e[?47h\e[2J"; date +%R|figlet -w $COLUMNS -c -f Big_Money-nw|batcat -ppflrs; date +%^A%n%-d" "%^B|figlet -w $COLUMNS -c -f miniwi|batcat -ppflr; printf  "\n\n\n\n"; fortune|batcat -ppfld; printf "\n\n"; read -t60 -n1 -srp " " "aa"; [ -z "$aa" ]&& printf "\e[?47l\n\ngg\n\n"; [ -z "$aa" ]&&tajm
};  
